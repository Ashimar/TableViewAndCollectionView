//
//  ClassifyOfLeftTableView.m
//  Test
//
//  Created by Ashimar on 16/11/6.
//  Copyright © 2016年 ZHZ. All rights reserved.
//

#import "ClassifyOfLeftTableView.h"

@interface ClassifyOfLeftTableView () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation ClassifyOfLeftTableView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.leftDataSource = [NSArray array];
        
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellidentifier"];
    }
    return self;
}
- (void)setLeftDataSource:(NSArray *)leftDataSource {
    if (leftDataSource.count < 1) {
        return;
    }
    _leftDataSource = leftDataSource;
    [self reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.leftDataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellidentifier" forIndexPath:indexPath];
    cell.textLabel.text = self.leftDataSource[indexPath.row][@"type"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.tapLeftBlock(indexPath.row);
}

@end
