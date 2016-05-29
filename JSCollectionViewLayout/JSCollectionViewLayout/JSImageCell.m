//
//  JSImageCell.m
//  JSCollectionViewLayout
//
//  Created by  江苏 on 16/5/29.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "JSImageCell.h"

@interface JSImageCell()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation JSImageCell

- (void)awakeFromNib {
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 10;
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = [imageName copy];
    
    self.imageView.image = [UIImage imageNamed:imageName];
}
@end
