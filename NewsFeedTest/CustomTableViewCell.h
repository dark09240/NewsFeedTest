//
//  CustomTableViewCell.h
//  NewsFeedTest
//
//  Created by Lycodes_Dong on 7/6/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *myProfilepicture;
@property (weak, nonatomic) IBOutlet UILabel *myNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *myTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *myStatusLabel;
@property (weak, nonatomic) IBOutlet UIImageView *myImage;

@end
