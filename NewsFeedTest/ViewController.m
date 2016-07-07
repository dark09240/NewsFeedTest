//
//  ViewController.m
//  NewsFeedTest
//
//  Created by Lycodes_Dong on 7/4/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ViewController Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayProfilePic = [[NSMutableArray alloc]init];
    self.arrayImage = [[NSMutableArray alloc]init];
    
    NSURL *url = [NSURL URLWithString:@"http://api.androidhive.info/feed/feed.json"];
    
    [self.myActivityIndicatorView startAnimating];
    
    [DongFramework getJsonWithURL:url Target:self Action:@selector(getJsonFinished:) Name:@"GetJson"];
    
}

#pragma mark Get Json Finished

- (void)getJsonFinished:(NSNotification *)notification {

    NSArray *arrayJson = (NSArray *)[notification object];
    
    NSArray *arrayFeed = [arrayJson valueForKey:@"feed"];
    
    if ([arrayFeed count] > 0) {
        
        self.arrayProfilePicUrl = [arrayFeed valueForKey:@"profilePic"];
        self.arrayName = [arrayFeed valueForKey:@"name"];
        self.arrayTime = [arrayFeed valueForKey:@"timeStamp"];
        self.arrayStatus = [arrayFeed valueForKey:@"status"];
        self.arrayImageUrl = [arrayFeed valueForKey:@"image"];
        
    }

    [self getImage];
    
}

#pragma mark Get Image

- (void)getImage {
    
    NSURL *url;
    
    NSString *urlString;
    
    UIImage *image;

    for (int i = 0; i < [self.arrayProfilePicUrl count]; i++) {
        
        urlString = [NSString stringWithFormat:@"%@",[self.arrayProfilePicUrl objectAtIndex:i]];
        
        if (![urlString isEqualToString:@"<null>"]) {
            
            url = [NSURL URLWithString:urlString];
            
            image = [DongFramework getImageWithURL:url];
            
            [self.arrayProfilePic addObject:image];
            
        }else {
            
            [self.arrayProfilePic addObject:@""];
            
        }
        
        urlString = [NSString stringWithFormat:@"%@",[self.arrayImageUrl objectAtIndex:i]];
        
        if (![urlString isEqualToString:@"<null>"]) {
            
            url = [NSURL URLWithString:urlString];
            
            image = [DongFramework getImageWithURL:url];
            
            [self.arrayImage addObject:image];
            
        }else {
            
            [self.arrayImage addObject:@""];
        
        }
        
    }
    
    if ([self.arrayProfilePic count] == [self.arrayProfilePicUrl count]) {
        
        if ([self.arrayImage count] == [self.arrayImageUrl count]) {
    
            [self.myActivityIndicatorView stopAnimating];
            
            [self.myTableView reloadData];
            
        }
        
    }

}

#pragma mark UITableView DataSoure

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (tableView == self.myTableView) {
        
        if ([self.arrayProfilePic count] == [self.arrayProfilePicUrl count]) {
            
            if ([self.arrayImage count] == [self.arrayImageUrl count]) {
        
                return [self.arrayName count];
                
            }
            
        }

        
    }
    
    return 0;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CustomTableViewCell *cell;
    NSString *string;
    UIImage *image;
    
    if (!cell) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCell"];
        cell.frame = CGRectMake(0, 0, self.view.bounds.size.width, 0);
        
    }
    
    if (tableView == self.myTableView) {
        
        string = [NSString stringWithFormat:@"%@",[self.arrayProfilePicUrl objectAtIndex:indexPath.row]];
        
        if (![string isEqualToString:@"<null>"]) {
            
            image = (UIImage *)[self.arrayProfilePic objectAtIndex:indexPath.row];
            
            cell.myProfilepicture.image = image;
            
        }
        
        string = [NSString stringWithFormat:@"%@",[self.arrayName objectAtIndex:indexPath.row]];
        
        cell.myNameLabel.text = string;
        
        string = [NSString stringWithFormat:@"%@",[self.arrayTime objectAtIndex:indexPath.row]];
        
        cell.myTimeLabel.text = string;
        
        string = [NSString stringWithFormat:@"%@",[self.arrayStatus objectAtIndex:indexPath.row]];
        
        cell.myStatusLabel.text = string;
        
        string = [NSString stringWithFormat:@"%@",[self.arrayImageUrl objectAtIndex:indexPath.row]];
        
        if (![string isEqualToString:@"<null>"]) {
            
            image = (UIImage *)[self.arrayImage objectAtIndex:indexPath.row];
            
            cell.myImage.image = image;
            
        }
        
        cell.myButton.tag = indexPath.row;
        
    }
    
    return cell;

}

#pragma mark UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (tableView == self.myTableView) {
        
        return 320;
        
    }
    
    return 0;

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"Read"]) {
        
        PageTwoViewController *pageTwo = [segue destinationViewController];
        
        UIButton *button = (UIButton *)sender;
        
        NSInteger index = button.tag;
        
        NSString *string = (NSString *)[self.arrayName objectAtIndex:index];
        
        [pageTwo setName:string];
        
    }
    
}

#pragma mark Receive Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
