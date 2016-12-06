//
//  ViewController.m
//  CYLoading
//
//  Created by 陈阳阳 on 16/12/6.
//  Copyright © 2016年 cyy. All rights reserved.
//

#import "ViewController.h"
#import "CYLoading.h"

@interface ViewController ()

@property (nonatomic,strong) CYLoading *loadCenter;
@property (nonatomic,strong) CYLoading *loadBottomRight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.width * 9 / 16)];
    bgView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bgView];
    
    CYLoading *loadCenter = [[CYLoading alloc]initWithView:bgView loadingPosition:LoadingCenter];
    self.loadCenter = loadCenter;
    
    CYLoading *loadBottomRight = [[CYLoading alloc]initWithView:bgView loadingPosition:LoadingRightBottom];
    self.loadBottomRight = loadBottomRight;

    UIButton *show = [[UIButton alloc]initWithFrame:CGRectMake(70, CGRectGetMaxY(bgView.frame) + 50, 60, 40)];
    show.backgroundColor = [UIColor grayColor];
    [show setTitle:@"show" forState:UIControlStateNormal];
    [show addTarget:self action:@selector(showClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:show];
    
    UIButton *hidden = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(show.frame) + 50, CGRectGetMaxY(bgView.frame) + 50, 60, 40)];
    hidden.backgroundColor = [UIColor grayColor];
    [hidden setTitle:@"hidden" forState:UIControlStateNormal];
    [hidden addTarget:self action:@selector(hiddenClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hidden];
}

- (void)showClick {
    [self.loadCenter show];
    [self.loadBottomRight show];
}

- (void)hiddenClick {
    [self.loadCenter hide];
    [self.loadBottomRight hide];
}

@end
