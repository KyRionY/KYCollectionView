//
//  KYCollectionView.m
//  无限滑动视图
//
//  Created by asun on 15/11/17.
//  Copyright © 2015年 yinyi. All rights reserved.
//

#import "KYCollectionView.h"
#import "YYCollectionView.h"

@implementation KYCollectionView
{
    YYCollectionView *_collectionView;
    UIPageControl *_page;
    NSTimer *_timer;
    NSInteger _integer;
}

#pragma mark - 初始化方法
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _collectionView = [[YYCollectionView alloc] initWithFrame:self.bounds];
        _collectionView.delegate = self;
        [self addSubview:_collectionView];
        
        _page = [[UIPageControl alloc] initWithFrame:CGRectMake(self.bounds.size.width * .2, self.bounds.size.height * .85, self.bounds.size.width * .6, self.bounds.size.height * .1)];
        _page.userInteractionEnabled = NO;
        [self addSubview:_page];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray*)images time:(CGFloat)time {
    if (self = [self initWithFrame:frame]) {
        _images = images;
        self.time = time;
    }
    return self;
}

#pragma mark - set,get
- (void)setImages:(NSArray *)images {
    _images = images;
    _page.numberOfPages = images.count;
    _collectionView.images = images;
}

- (void)setIsHidePageControl:(BOOL)isHidePageControl {
    _page.hidden = isHidePageControl;
    _isHidePageControl = isHidePageControl;
}

- (CGFloat)time {
    return _time ? _time : 3;
}

#pragma mark - collectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    _page.currentPage = indexPath.row;
    
    //重新对intege赋值
    _integer = indexPath.section * self.images.count + indexPath.row;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self deleteTimer];
    [self.delegate kycollectionView:self didSelectItemAtIndex:indexPath.row];
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(beginTimer) userInfo:nil repeats:NO];
}

#pragma mark - scrollViewDelegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self deleteTimer];
}

-(void)scrollViewDidEndDecelerating:(UICollectionView *)scrollView{
    _timer = [NSTimer scheduledTimerWithTimeInterval:self.time target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    
    CGPoint pInView = [self convertPoint:_collectionView.center toView:_collectionView];
    // 获取这一点的indexPath
    NSIndexPath *indexPathNow = [_collectionView indexPathForItemAtPoint:pInView];
    // 赋值给记录当前坐标的变量
    _page.currentPage = indexPathNow.row;
    
    _integer = indexPathNow.section * self.images.count + indexPathNow.row;
}

#pragma mark - 自动滑动方法
- (void)beginAutoScroll {
    [self beginTimer];
}

- (void)endAutoScroll {
    [self deleteTimer];
}

#pragma mark - 控制器方法
//定时器
-(void)timer:(NSTimer *)timer{
    _integer ++;
    NSInteger count = self.images.count;
    
    //计算显示的单元格
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_integer % count inSection:_integer / count] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    _page.currentPage = _integer % self.images.count;
}

// 开启定时器
- (void)beginTimer {
    if (self.images && !_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:self.time target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    }
}

// 取消定时器
- (void)deleteTimer {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    CGPoint pInView = [self convertPoint:_collectionView.center toView:_collectionView];
    // 获取这一点的indexPath
    NSIndexPath *indexPathNow = [_collectionView indexPathForItemAtPoint:pInView];
    _integer = indexPathNow.section * self.images.count + indexPathNow.row;
}


@end
