//
//  TestTableViewController.m
//  xuxian
//
//  Created by BugHunter on 15/10/8.
//  Copyright © 2015年 BugHunter. All rights reserved.
//

#import "TestTableViewController.h"
#import "Common.h"
#import "Reachability.h"
@interface TestTableViewController()
@property (weak, nonatomic) IBOutlet UILabel *notificationLabel;
@property (weak, nonatomic) IBOutlet UILabel *wifiOnlyLabel;
@property (weak, nonatomic) IBOutlet UILabel *wwanOnlyLabel;

@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"开启 www.apple.com 的网络检测");
    Reachability* reach = [Reachability reachabilityWithHostname:@"www.apple.com"];
    NSLog(@"-- current status: %@", reach.currentReachabilityString);
    
    // start the notifier which will cause the reachability object to retain itself!
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    [reach startNotifier];
}

- (void) reachabilityChanged: (NSNotification*)note {
    Reachability * reach = [note object];
    
    if(![reach isReachable])
    {
        self.notificationLabel.text = @"网络不可用";
        self.notificationLabel.backgroundColor = [UIColor redColor];
        self.wifiOnlyLabel.backgroundColor = [UIColor redColor];
        self.wwanOnlyLabel.backgroundColor = [UIColor redColor];
        return;
    }
    
    self.notificationLabel.text = @"网络可用";
    self.notificationLabel.backgroundColor = [UIColor greenColor];
    
    if (reach.isReachableViaWiFi) {
        self.wifiOnlyLabel.backgroundColor = [UIColor greenColor];
        self.wifiOnlyLabel.text = @"当前通过wifi连接";
    } else {
        self.wifiOnlyLabel.backgroundColor = [UIColor redColor];
        self.wifiOnlyLabel.text = @"wifi未开启，不能用";
    }
    
    if (reach.isReachableViaWWAN) {
        self.wwanOnlyLabel.backgroundColor = [UIColor greenColor];
        self.wwanOnlyLabel.text = @"当前通过2g or 3g连接";
    } else {
        self.wwanOnlyLabel.backgroundColor = [UIColor redColor];
        self.wwanOnlyLabel.text = @"2g or 3g网络未使用";
    }
}
@end
