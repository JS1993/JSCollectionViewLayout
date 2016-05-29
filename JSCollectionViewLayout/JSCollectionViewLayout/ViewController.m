//
//  ViewController.m
//  JSCollectionViewLayout
//
//  Created by  江苏 on 16/5/29.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "JSImageCell.h"
#import "JSCircleCollectionViewLayout.h"
#import "JSLinearCollectionViewFlowLayout.h"
#import "JSGidCollectionViewLayout.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
/** collectionView */
@property (nonatomic, weak) UICollectionView *collectionView;
/** 数据 */
@property (nonatomic, strong) NSMutableArray *imageNames;


@end

@implementation ViewController

static NSString * const JSPhotoId = @"photo";

- (NSMutableArray *)imageNames
{
    if (!_imageNames) {
        _imageNames = [NSMutableArray array];
        for (int i = 0; i<20; i++) {
            [_imageNames addObject:[NSString stringWithFormat:@"%zd", i + 1]];
        }
    }
    return _imageNames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建布局
    JSCircleCollectionViewLayout *layout = [[JSCircleCollectionViewLayout alloc] init];
    
    // 创建CollectionView
    CGFloat collectionW = self.view.frame.size.width;
    CGFloat collectionH = 400;
    CGRect frame = CGRectMake(0, 30, collectionW, collectionH);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    // 注册
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([JSImageCell class]) bundle:nil] forCellWithReuseIdentifier:JSPhotoId];
    
}

static NSInteger i=0;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    NSInteger change=++i%3;
    
    //进行三种不同风格的布局
    if (change==0) {
        [self.collectionView setCollectionViewLayout:[[JSCircleCollectionViewLayout alloc] init] animated:YES];
    } else if(change==1){
        JSLinearCollectionViewFlowLayout *layout = [[JSLinearCollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(220, 220);
        [self.collectionView setCollectionViewLayout:layout animated:YES];
    }else{
        JSGidCollectionViewLayout* layout=[[JSGidCollectionViewLayout alloc]init];
        [self.collectionView setCollectionViewLayout:layout animated:YES];
    }
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageNames.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JSImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:JSPhotoId forIndexPath:indexPath];
    
    cell.imageName = self.imageNames[indexPath.item];
    
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.imageNames removeObjectAtIndex:indexPath.item];
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
}
@end
