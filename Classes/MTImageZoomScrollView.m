//
//  MTImageZoomScrollView.m
//  MTPhotoScrollView
//
//  Created by Trung Tran on 6/21/13.
//  Copyright (c) 2013 WillowTree Apps, Inc. All rights reserved.
//

#import "MTImageZoomScrollView.h"
@interface MTImageZoomScrollView ()
@end

@implementation MTImageZoomScrollView

- (void)commonInit
{
    [super commonInit];
    UIImageView *imageView = [UIImageView new];
    [self setContentZoomView:imageView];
}

- (UIImageView *)imageView
{
    return (UIImageView *)[self contentZoomView];
}

- (void)setImage:(UIImage *)image
{
    [[self imageView] setImage:image];
    [self sizeImageViewToFit];
}

- (void)sizeImageViewToFit
{
    UIImage *image = [[self imageView] image];
    [[self imageView] setFrame:CGRectMake(0.0, 0.0, [image size].width, [image size].height)];
    [self layoutSubviews];
    [self setZoomScaleForContentSize];
}

- (UIImage *)image
{
    return [[self imageView] image];
}

@end
