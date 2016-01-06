//
//  ViewController.m
//  无限滑动视图
//
//  Created by asun on 15/11/17.
//  Copyright © 2015年 yinyi. All rights reserved.
//

#import "ViewController.h"
#import "KYCollectionView.h"

@interface ViewController ()<KYCollectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    KYCollectionView *cv = [[KYCollectionView alloc] initWithFrame:CGRectMake(50, 100, 300, 130)];
    cv.images = @[[UIImage imageNamed:@"1.jpeg"], [UIImage imageNamed:@"2.jpeg"], [UIImage imageNamed:@"3.jpeg"], [UIImage imageNamed:@"4.jpeg"]];
    cv.time = 2;
    cv.delegate = self;
    [self.view addSubview:cv];
    [cv beginAutoScroll];
}

- (void)kycollectionView:(KYCollectionView *)collectionView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"[----%li----]",index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
