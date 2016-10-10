//
//  NTHeaderStretchingTableViewController.m
//  NTHeaderStretchingTableViewController
//
//  Created by Nineteen on 10/10/16.
//  Copyright © 2016 Nineteen. All rights reserved.
//

#import "NTHeaderStretchingTableViewController.h"

#define NTDeviceSize [UIScreen mainScreen].bounds.size

@interface NTHeaderStretchingTableViewController ()

@property (nonatomic, strong) UIImage *navigationBackgroundImage;
@property (nonatomic, strong) UIImageView *headerImageView;

@end

@implementation NTHeaderStretchingTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(self.headerImageHeight, 0, 0, 0);
    [self.tableView addSubview:self.headerImageView];
}

#pragma mark - 懒加载
- (UIImage *)navigationBackgroundImage {
    if (_navigationBackgroundImage == nil) {
        if (self.navigationBackgroundImageName != nil && self.navigationBackgroundImageName.length != 0) {
            _navigationBackgroundImage = [UIImage imageNamed:self.navigationBackgroundImageName];
        } else {
           // do nothing , return nil
        }
    }
    return _navigationBackgroundImage;
}

- (UIImageView *)headerImageView {
    if (_headerImageView == nil) {
        _headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, - self.headerImageHeight, NTDeviceSize.width, self.headerImageHeight)];
        _headerImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headerImageView.clipsToBounds = YES;
        if (self.headerImageName != nil && self.headerImageName.length != 0) {
            _headerImageView.image = [UIImage imageNamed:self.headerImageName];
        } else {
            NSLog(@"您没有设置头部显示的图片，所以UI上没有显示");// 提示使用者
        }
    }
    return _headerImageView;
}

#pragma mark - methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y < - self.headerImageHeight) {
        CGRect tempFrame = self.headerImageView.frame;
        tempFrame.size.height = - scrollView.contentOffset.y;
        tempFrame.origin.y = scrollView.contentOffset.y;
        self.headerImageView.frame = tempFrame;
    }
}




@end
