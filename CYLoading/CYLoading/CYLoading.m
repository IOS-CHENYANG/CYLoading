//
//  CYLoading.m
//  CYLoading
//
//  Created by 陈阳阳 on 16/12/6.
//  Copyright © 2016年 cyy. All rights reserved.
//

#import "CYLoading.h"

@implementation CYLoading
{
    UIImageView *_imageCircleView;
    UIView      *_view;
}

- (id)initWithView:(UIView *)view loadingPosition:(LoadingPosition)position{
    NSAssert(view, @"View must not be nil.");
    _view = view;
    if (position == LoadingCenter) {
        return [self initWithFrame:CGRectMake((view.bounds.size.width - 30) / 2, (view.bounds.size.height - 30) / 2, 30, 30)];
    }else if (position == LoadingRightBottom) {
        return [self initWithFrame:CGRectMake(view.bounds.size.width - 30 - 10, view.bounds.size.height - 30 - 10, 30, 30)];
    }
    return [self initWithFrame:CGRectZero];
}

- (void)show
{
    [_view addSubview:self];
    [self startAnimation];
}

- (void)hide
{
    [self stopAnimation];
    [self removeFromSuperview];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews {
    _imageCircleView = [[UIImageView alloc]initWithFrame:self.bounds];
    _imageCircleView.image = [UIImage imageNamed:@"loading_video_"];
    _imageCircleView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_imageCircleView];
}

- (void)startAnimation {
    
    [self setNeedsDisplay];
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0f];
    rotationAnimation.duration = 1.0f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 1000;
    [_imageCircleView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)stopAnimation {
    [_imageCircleView.layer removeAnimationForKey:@"rotationAnimation"];
}

@end
