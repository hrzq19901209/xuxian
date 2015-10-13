//
//  TestTableViewController.m
//  xuxian
//
//  Created by BugHunter on 15/10/8.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "TestTableViewController.h"
#import "Common.h"
@interface TestTableViewController()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) UITableView *tableView;

@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationItem *navItem = self.navigationItem;
    UIBarButtonItem *rightBBI = [[UIBarButtonItem alloc] initWithImage:[Common getOrginalModelImage:@"Categorize"]
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(test)];
    navItem.rightBarButtonItem = rightBBI;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    NSMutableArray *records = [NSMutableArray array];
    [records addObject:@"nidea"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    return cell;
}
-(void)test{
}

@end
