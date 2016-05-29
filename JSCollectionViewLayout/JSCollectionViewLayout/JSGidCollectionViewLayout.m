//
//  JSGidCollectionViewLayout.m
//  JSCollectionViewLayout
//
//  Created by  江苏 on 16/5/29.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSGidCollectionViewLayout.h"

@interface JSGidCollectionViewLayout()

/** 所有的布局属性 */
@property (nonatomic, strong) NSMutableArray *attrsArray;

@end

@implementation JSGidCollectionViewLayout

- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

- (void)prepareLayout
{
    [super prepareLayout];
    
    [self.attrsArray removeAllObjects];
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i++) {
        // 创建UICollectionViewLayoutAttributes
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];

        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        // 添加UICollectionViewLayoutAttributes
        [self.attrsArray addObject:attrs];
    }
}


/**
 * 这个方法需要返回indexPath位置对应cell的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
        
     // 创建UICollectionViewLayoutAttributes
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    // 设置布局属性
    CGFloat width = self.collectionView.frame.size.width * 0.5;
    if (indexPath.item== 0) {
        CGFloat height = width;
        CGFloat x = 0;
        CGFloat y = 0;
        attrs.frame = CGRectMake(x, y, width, height);
    } else if (indexPath.item== 1) {
        CGFloat height = width * 0.5;
        CGFloat x = width;
        CGFloat y = 0;
        attrs.frame = CGRectMake(x, y, width, height);
    } else if (indexPath.item == 2) {
        CGFloat height = width * 0.5;
        CGFloat x = width;
        CGFloat y = height;
        attrs.frame = CGRectMake(x, y, width, height);
    } else if (indexPath.item == 3) {
        CGFloat height = width * 0.5;
        CGFloat x = 0;
        CGFloat y = width;
        attrs.frame = CGRectMake(x, y, width, height);
    } else if (indexPath.item == 4) {
        CGFloat height = width * 0.5;
        CGFloat x = 0;
        CGFloat y = width + height;
        attrs.frame = CGRectMake(x, y, width, height);
    } else if (indexPath.item == 5) {
        CGFloat height = width;
        CGFloat x = width;
        CGFloat y = width;
        attrs.frame = CGRectMake(x, y, width, height);
    } else {
        UICollectionViewLayoutAttributes *lastAttrs = self.attrsArray[indexPath.item - 6];
        CGRect lastFrame = lastAttrs.frame;
        lastFrame.origin.y += 2 * width;
        attrs.frame = lastFrame;
    }

    return attrs;
    
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

/**
 * 返回collectionView的内容大小
 */
- (CGSize)collectionViewContentSize
{
    int count = (int)[self.collectionView numberOfItemsInSection:0];
    int rows = (count + 3 - 1) / 3;
    CGFloat rowH = self.collectionView.frame.size.width * 0.5;
    return CGSizeMake(0, rows * rowH);
}

@end
