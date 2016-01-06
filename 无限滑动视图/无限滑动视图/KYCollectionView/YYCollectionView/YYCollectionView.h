//
//  YYCollectionView.h
//  无限滑动视图－demo
//
//  Created by asun on 15/11/17.
//  Copyright © 2015年 yinyi. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kYYCollectionViewMinSpace 0
#define kYYCollectionViewCell @"kYYCollectionViewCell"
@interface YYCollectionView : UICollectionView <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
// 传入图片数组
@property (nonatomic,strong) NSArray *images;
@end
