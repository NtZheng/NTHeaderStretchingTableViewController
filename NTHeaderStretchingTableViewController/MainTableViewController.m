//
//  MainTableViewController.m
//  NTHeaderStretchingTableViewController
//
//  Created by Nineteen on 10/10/16.
//  Copyright © 2016 Nineteen. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController ()

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    // 将父控制器中的属性设置放在super的viewDidLoad之前
    self.headerImageHeight = 200;
    self.headerImageName = @"husky";
    self.navigationBackgroundImageName = @"";
    
    [super viewDidLoad];
    
    self.leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [self.leftButton setTitle:@"left" forState:UIControlStateNormal];
    [self.leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    self.rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [self.rightButton setTitle:@"right" forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightButton];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"School：NEU";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"Nickname：nineteen";
    } else {
        cell.textLabel.text = @"Name：郑祯";
    }
    return cell;
}


@end
