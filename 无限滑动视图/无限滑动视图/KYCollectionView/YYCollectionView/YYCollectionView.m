//
//  YYCollectionView.m
//  无限滑动视图－demo
//
//  Created by asun on 15/11/17.
//  Copyright © 2015年 yinyi. All rights reserved.
//

#import "YYCollectionView.h"
#import "YYCollectionViewCell.h"
#import "YYCollectionViewFlowLayout.h"

@implementation YYCollectionView
- (instancetype)initWithFrame:(CGRect)frame {
    YYCollectionViewFlowLayout *layout = [[YYCollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = kYYCollectionViewMinSpace;
    layout.itemSize = CGSizeMake(frame.size.width, frame.size.height);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        //隐藏滑块
        self.showsHorizontalScrollIndicator = NO;
        //开启分页效果
        self.pagingEnabled = YES;
        self.dataSource = self;
        [self registerClass:[YYCollectionViewCell class] forCellWithReuseIdentifier:kYYCollectionViewCell];
    }
    return self;
}

#pragma mark - collectionView代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _images.count * 1000;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    YYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kYYCollectionViewCell forIndexPath:indexPath];
    
    // 获取图片
    cell.image = _images[indexPath.item];
    
    return cell;
}

- (void)setImages:(NSArray *)images {
    if (images.count > 0) {
        _images = images;
        [self reloadData];
        [self scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:300] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
}

@end
