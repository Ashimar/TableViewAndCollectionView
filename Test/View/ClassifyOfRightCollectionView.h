//
//  ClassifyOfRightCollectionView.h
//  Test
//
//  Created by Ashimar on 16/11/6.
//  Copyright © 2016年 ZHZ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapRightBlock)(NSInteger productID);

@interface ClassifyOfRightCollectionView : UICollectionView

@property (nonatomic, strong) NSArray *rightDataSource;

@property (nonatomic, copy) TapRightBlock tapRightBlock;

@end
