//
//  YYCollectionViewCell.m
//  无限滑动视图－demo
//
//  Created by asun on 15/11/17.
//  Copyright © 2015年 yinyi. All rights reserved.
//

#import "YYCollectionViewCell.h"

@implementation YYCollectionViewCell
{
    UIImageView *_imageView;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imageView];
        
    }
    return self;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    if (_imageView) {
        _imageView.image = image;
    }
}



@end
