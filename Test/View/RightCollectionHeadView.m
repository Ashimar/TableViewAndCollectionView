//
//  RightCollectionHeadView.m
//  Test
//
//  Created by Ashimar on 16/11/6.
//  Copyright © 2016年 ZHZ. All rights reserved.
//

#import "RightCollectionHeadView.h"

@implementation RightCollectionHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width, 44)];
        [self addSubview:self.label];
    }
    return self;
}

@end
