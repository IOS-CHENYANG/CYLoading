//
//  CYLoading.h
//  CYLoading
//
//  Created by 陈阳阳 on 16/12/6.
//  Copyright © 2016年 cyy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,LoadingPosition) {
    LoadingCenter,
    LoadingRightBottom
};

@interface CYLoading : UIView

- (id)initWithView:(UIView *)view loadingPosition:(LoadingPosition)position;

- (void)show;

- (void)hide;

@end
