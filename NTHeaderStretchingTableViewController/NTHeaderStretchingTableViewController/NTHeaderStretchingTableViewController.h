//
//  NTHeaderStretchingTableViewController.h
//  NTHeaderStretchingTableViewController
//
//  Created by Nineteen on 10/10/16.
//  Copyright © 2016 Nineteen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NTHeaderStretchingTableViewController : UITableViewController

/*
 * 导航栏背景图片名称
 */
@property (nonatomic, copy) NSString *navigationBackgroundImageName;

/*
 * 头部拉伸图片名称
 */
@property (nonatomic, copy) NSString *headerImageName;

/*
 * 导航栏背景图片名称
 */
@property (nonatomic, assign) NSInteger headerImageHeight;

@end
