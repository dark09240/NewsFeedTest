//
//  PageTwoViewController.m
//  NewsFeedTest
//
//  Created by Lycodes_Dong on 7/7/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import "PageTwoViewController.h"

@interface PageTwoViewController ()

@end

@implementation PageTwoViewController

#pragma mark UIView Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myNavigationItem.title = self.name;
    
}

#pragma mark Receive Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
