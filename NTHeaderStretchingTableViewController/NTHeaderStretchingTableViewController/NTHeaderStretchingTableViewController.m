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
    // 1、头部图片拉伸效果
    if (scrollView.contentOffset.y < - self.headerImageHeight) {
        CGRect tempFrame = self.headerImageView.frame;
        tempFrame.size.height = - scrollView.contentOffset.y;
        tempFrame.origin.y = scrollView.contentOffset.y;
        self.headerImageView.frame = tempFrame;
    }
    
    // 2、导航栏透明度变化效果
    CGFloat tempAlpha = (scrollView.contentOffset.y + self.headerImageHeight) / (self.headerImageHeight - 64); // 计算方法可以通过初始点和结束点来计算，两个点的不透明度分别是0和1
    /*
     这两个判断是为了检测继承该类的控制室是否处于UINavigationController的管辖之下的，在iOS7开始引入了edgesForExtendedLayout这个变量，表示将原来的坐标系向着一个方向或者是多个方向进行扩展
     */
    if(self.edgesForExtendedLayout == UIRectEdgeTop || self.edgesForExtendedLayout == UIRectEdgeAll){
        UIImage *tempImage = self.navigationBackgroundImage == nil ? [self imageWithColor:[UIColor redColor]] : self.navigationBackgroundImage;
        [self.navigationController.navigationBar setBackgroundImage:[self imageByApplyingAlpha:tempAlpha image:tempImage] forBarMetrics:UIBarMetricsDefault];
    }
}

//设置图片透明度
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, image.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)imageWithColor:(UIColor *)color {
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return theImage;
}




@end
