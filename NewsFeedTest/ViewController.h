//
//  ViewController.h
//  NewsFeedTest
//
//  Created by Lycodes_Dong on 7/4/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DongFramework.h"
#import "CustomTableViewCell.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myActivityIndicatorView;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property NSArray *arrayProfilePicUrl,*arrayName,*arrayTime,*arrayStatus,*arrayImageUrl;
@property NSMutableArray *arrayProfilePic,*arrayImage;

@end

