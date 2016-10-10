//
//  MainTableViewController.m
//  NTHeaderStretchingTableViewController
//
//  Created by Nineteen on 10/10/16.
//  Copyright © 2016 Nineteen. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    self.headerImageHeight = 200;
    self.headerImageName = @"husky";
    [super viewDidLoad];
    self.navigationBackgroundImageName = @"";
    
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据---%ld", (long)indexPath.row];
    return cell;
}


@end
