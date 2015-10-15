//
//  HomeCollectionViewController.m
//  xuxian
//
//  Created by BugHunter on 15/9/22.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "HomeCollectionViewController.h"
#import "CollectionViewCell.h"
#import "Common.h"
#import "LOLDebug.h"
#import "Constant.h"
#import "CollectionLayout.h"
#import "LOLSectionView.h"
#import "UIColor+HexColors.h"
#import "WMAdPageView.h"
#import "Model.h"
#import "FruitAds.h"
#import "Fruit.h"
#import "UIImageView+PINRemoteImage.h"
#import "MJRefresh.h"
#import "Reachability.h"
#import "LOLErrorNetWorkView.h"

@interface HomeCollectionViewController()<WMAdPageViewDelegate>

@property (nonatomic,strong) IBOutlet UIView *homeNavigationBar;
@property (nonatomic,weak) IBOutlet UILabel *shopAddressLabel;
@property (nonatomic,weak) IBOutlet UILabel *subShopAddresslabel;

@end

@implementation HomeCollectionViewController

static NSString *FLAG = @"HomeCollectionViewController";
static NSString * const reuseIdentifier = @"CollectionCell";

-(id)initWithCollectionViewLayout:(nonnull UICollectionViewLayout *)layout{
    self = [super initWithCollectionViewLayout:layout];

    return self;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    
    // add operation observers
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleFetchFruitsStart:)
                                                 name:kFruitsStartNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleFetchFruitsSuccess:)
                                                 name:kFruitsSuccessNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleFetchFruitsError:)
                                                 name:kFruitsErrorNotification
                                               object:nil];
    
    //加载缓存
    [[Model sharedModel] initModelsWithCacheDic];
    [self initAdsView];
    //先检测网络，如果网络不可用，则显示网络不可用，如果网络可用则撤销网络不可用的标志
    Reachability* reach = [Reachability reachabilityWithHostname:@"192.168.11.3"];
    if (![reach isReachable]) {
        LOLErrorNetWorkView *view = [[LOLErrorNetWorkView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+20, screen_width,60)];
        [self.view addSubview:view];
        CGRect frame = self.collectionView.frame;
        CGRect newframe = CGRectMake(0, frame.origin.y+60, frame.size.width, frame.size.height);
        self.collectionView.frame = newframe;
    }else{
        NSLog(@"网络可用！");
    }
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    [reach startNotifier];

    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    [self.collectionView.header beginRefreshing];
    
    UINib *nib = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
    
    nib = [UINib nibWithNibName:@"LOLSectionView" bundle:nil];
    [self.collectionView registerNib:nib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Section"];
    
    self.collectionView.backgroundColor = [UIColor colorWithHexString:@"F8F9F2"];
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    UINavigationItem *navItem = self.navigationItem;
    
    UIView *navBarItem = self.homeNavigationBar;
    
    UITapGestureRecognizer *addressTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(test)];
    [navBarItem addGestureRecognizer:addressTapRecognizer];
    
    UIBarButtonItem *leftBBI = [[UIBarButtonItem alloc] initWithCustomView:navBarItem];
    navItem.leftBarButtonItem = leftBBI;
    
    UIBarButtonItem *rightBBI = [[UIBarButtonItem alloc] initWithImage:[Common getOrginalModelImage:@"Categorize"]
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(test)];
    navItem.rightBarButtonItem = rightBBI;
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    [self.collectionView.collectionViewLayout invalidateLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

-(NSInteger)numberOfSectionsInCollectionView:(nonnull UICollectionView *)collectionView{
    return [[Model sharedModel].sections count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *items = [[Model sharedModel].fruits objectAtIndex:section];
    return items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSArray *items = [[Model sharedModel].fruits objectAtIndex:indexPath.section];
    Fruit *fruit = [items objectAtIndex:indexPath.row];
    [cell.coverImageView setPin_updateWithProgress:YES];
    [cell.coverImageView pin_setImageFromURL:[NSURL URLWithString:[fruit imageUrl]]];
    cell.titleLabel.text = [fruit introduction];
    cell.nameLabel.text = [fruit name];
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(nonnull UICollectionView *)collectionView viewForSupplementaryElementOfKind:(nonnull NSString *)kind atIndexPath:(nonnull NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        LOLSectionView *sectionView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Section" forIndexPath:indexPath];
        sectionView.titleLabel.text = [[Model sharedModel].sections objectAtIndex:indexPath.section];
        return sectionView;
    }else{
        return nil;
    }
}

-(void)test{
   [[LOLDebug sharedDebug] LogInfoContent:@"ceshi" flag:FLAG line:84];
    NSString *sa = @"上海市";
    NSString *ssa = @"北京邮电大学学十提货点";
    
    [self.shopAddressLabel setText:sa];
    [self.subShopAddresslabel setText:ssa];
}


-(UIView *)homeNavigationBar{
    if (!_homeNavigationBar) {
        [[NSBundle mainBundle] loadNibNamed:@"HomeNavigationBar"
                                      owner:self
                                    options:nil];
    }
    
    return _homeNavigationBar;
}
-(void) doTapOperationAtIndex:(NSInteger)index{
    FruitAds *ad = [[Model sharedModel].ads objectAtIndex:index];
    NSLog(@"%@",[ad name]);
}

#pragma mark - Notification Handlers
- (void)handleFetchFruitsStart:(id)notification {
}

- (void)handleFetchFruitsSuccess:(id)notification {
    [self initAdsView];
    
    [self.collectionView reloadData];
    [self.collectionView.header endRefreshing];
}

- (void)handleFetchFruitsError:(id)notification {
    [self.collectionView.header endRefreshing];
}
-(void)refreshData{
    [[Model sharedModel] fetchFruits];
}
-(void)reachabilityChanged:(NSNotification *)note{
    Reachability *reach = [note object];
    if (![reach isReachable]) {
        LOLErrorNetWorkView *view = [[LOLErrorNetWorkView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+20, screen_width,60)];
        [self.view addSubview:view];
        CGRect frame = self.collectionView.frame;
        CGRect newframe = CGRectMake(0, frame.origin.y+60, frame.size.width, frame.size.height);
        self.collectionView.frame = newframe;
        return;
    }
    for (UIView *subviews in [self.view subviews]) {
        if (subviews.tag== tag) {
            [subviews removeFromSuperview];
        }
    }
    CGRect frame = self.collectionView.frame;
    CGRect newframe = CGRectMake(0, frame.origin.y-60, frame.size.width, frame.size.height);
    self.collectionView.frame = newframe;
    NSLog(@"网络可用！");
}
-(void)initAdsView{
    WMAdPageView *adPageView = [[WMAdPageView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 150)];
    NSMutableArray *arrImageUrl = [NSMutableArray array];
    for (FruitAds* ad in [Model sharedModel].ads) {
        [arrImageUrl addObject:ad.url];
    }
    [adPageView  setAdsWithImages:arrImageUrl delegate:self];
    [adPageView  setBAutoRoll:YES];
    [self.collectionView addSubview:adPageView];
}
@end
