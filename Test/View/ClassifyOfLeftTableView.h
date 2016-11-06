//
//  ClassifyOfLeftTableView.h
//  Test
//
//  Created by Ashimar on 16/11/6.
//  Copyright © 2016年 ZHZ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapLeftBlock) (NSInteger index);

@interface ClassifyOfLeftTableView : UITableView

@property (nonatomic, strong) NSArray *leftDataSource;

@property (nonatomic, copy)TapLeftBlock tapLeftBlock;

@end
