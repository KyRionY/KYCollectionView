//
//  KYCollectionView.h
//  无限滑动视图
//
//  Created by kyrione on 15/11/17.
//  Copyright © 2015年 yinyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KYCollectionView;
@protocol KYCollectionViewDelegate <NSObject>
// 点击回调
- (void)kycollectionView:(KYCollectionView *)collectionView didSelectItemAtIndex:(NSInteger)index;

@end

@interface KYCollectionView : UIView <UICollectionViewDelegate, UIScrollViewDelegate>
// 传入图片数组
@property (nonatomic,strong) NSArray *images;

// 滑动时间 默认 .7
@property (nonatomic,assign) CGFloat time;

// 是否显示pageControl 默认显示
@property (nonatomic,assign) BOOL isHidePageControl;

// 代理
@property (nonatomic,weak) id<KYCollectionViewDelegate> delegate;

// 初始化方法
- (instancetype)initWithFrame:(CGRect)frame images:(NSArray*)images time:(CGFloat)time;

// 开始自动滑动
- (void)beginAutoScroll;

// 停止自动滑动
- (void)endAutoScroll;
@end


