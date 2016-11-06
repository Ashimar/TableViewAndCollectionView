
//
//  ClassifyOfRightCollectionView.m
//  Test
//
//  Created by Ashimar on 16/11/6.
//  Copyright © 2016年 ZHZ. All rights reserved.
//

#import "ClassifyOfRightCollectionView.h"
#import "RightCollectionViewCell.h"
#import "RightCollectionHeadView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ClassifyOfRightCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation ClassifyOfRightCollectionView
- (void)dealloc {
    self.delegate = nil;
    self.dataSource = nil;
}
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        self.rightDataSource = [NSArray array];
        
        self.delegate = self;
        self.dataSource = self;
        
        [self registerNib:[UINib nibWithNibName:@"RightCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"RightCollectionViewCell"];
        
        [self registerClass:[RightCollectionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"RightCollectionHeadView"];
    }
    return self;
}

- (void)setRightDataSource:(NSArray *)rightDataSource {
    if (rightDataSource.count < 1 ) {
        return;
    }
    _rightDataSource = rightDataSource;
    [self reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    NSInteger num = self.rightDataSource.count;
    return num;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger num = [self.rightDataSource[section][@"sonCount"] integerValue];
    return num;
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.frame.size.width, 44);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *resuabelView;

    if (kind == UICollectionElementKindSectionHeader) {
        RightCollectionHeadView *cell = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"RightCollectionHeadView" forIndexPath:indexPath];
        resuabelView.backgroundColor = [UIColor lightGrayColor];
 
        
        cell.label.text = self.rightDataSource[indexPath.section][@"type"];

        return cell;
    }
    return resuabelView;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1.0f;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((self.frame.size.width-10)/3, (self.frame.size.width-10)/3+26+10);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 8);
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RightCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RightCollectionViewCell" forIndexPath:indexPath];
//    
    NSDictionary *dic = self.rightDataSource[indexPath.section][@"sonItems"][indexPath.item];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:dic[@"photo"]]];
    cell.label.text = dic[@"type"];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.rightDataSource[indexPath.section][@"sonItems"][indexPath.item];
    NSInteger productID = [dic[@"id"] integerValue];
    self.tapRightBlock (productID);
}

@end
