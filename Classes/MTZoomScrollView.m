//
//  MTPhotoScrollView.m
//  MTPhotoScrollView
//
//  Created by Trung Tran on 5/10/13.
//  Copyright (c) 2013 WillowTree Apps, Inc. All rights reserved.
//

#import "MTZoomScrollView.h"

@interface MTZoomScrollView()
@end

@implementation MTZoomScrollView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self commonInit];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit
{
    [self setContentSize:self.bounds.size];
    [self setDelegate:self];
    [self setMinimumZoomScale:1.0];
    [self setShowsHorizontalScrollIndicator:NO];
    [self setShowsVerticalScrollIndicator:NO];
    [self setDecelerationRate:UIScrollViewDecelerationRateFast];
    [self setAlwaysBounceHorizontal:YES];
    [self setAlwaysBounceVertical:YES];
    [self setClipsToBounds:YES];
    [self setMinContentZoomScale:1.0];
    [self setMaxContentZoomScale:4.0];
    [self setContentViewContentMode:MTZoomScrollViewContentModeSizeToFit];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize boundsSize = [self bounds].size;
    CGRect frameToCenter = [[self contentZoomView] frame];
    
    // Center content view horizontally
    if (frameToCenter.size.width < boundsSize.width)
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    else
        frameToCenter.origin.x = 0;
    
    // Center content view vertically
    if (frameToCenter.size.height < boundsSize.height)
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    else
        frameToCenter.origin.y = 0;
    
    [[self contentZoomView] setFrame:frameToCenter];
}

- (void)resetZoomScale
{
    [self setMinimumZoomScale:1.0];
    [self setMaximumZoomScale:1.0];
    [self setZoomScale:1.0];
}

- (void)setZoomScaleForContentSize
{
    [self resetZoomScale];
    
    CGRect contentFrame = [[self contentZoomView] frame];
    CGRect bounds = [self bounds];
    
    NSAssert(contentFrame.size.width > 0.0, @"Content width must be greater than 0");
    NSAssert(contentFrame.size.height > 0.0, @"Content height must be greater than 0");
    
    CGFloat xRatio = bounds.size.width / contentFrame.size.width;
    CGFloat yRatio = bounds.size.height / contentFrame.size.height;
    
    CGFloat minimumRatio = xRatio;
    
    // Get the smaller/larger of the width/height ratios for the right content mode
    if ([self contentViewContentMode] == MTZoomScrollViewContentModeSizeToFit)
        minimumRatio = MIN(xRatio, yRatio);
    else if ([self contentViewContentMode] == MTZoomScrollViewContentModeSizeToFill)
        minimumRatio = MAX(xRatio, yRatio);
    
    // Reset zoom before making calculations
    [self setMinimumZoomScale:minimumRatio*[self minContentZoomScale]];
    [self setMaximumZoomScale:minimumRatio*[self maxContentZoomScale]];
    [self setZoomScale:minimumRatio];
    [self setContentSize:[[self contentZoomView] frame].size];
}

- (void)setContentZoomView:(UIView *)contentZoomView
{
    _contentZoomView = contentZoomView;
    [contentZoomView setFrame:[self bounds]];
    [self addSubview:contentZoomView];
    [self layoutSubviews];
    [self setZoomScaleForContentSize];
}

#pragma mark - UIScrollViewDelegate Methods

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [self contentZoomView];
}

@end
