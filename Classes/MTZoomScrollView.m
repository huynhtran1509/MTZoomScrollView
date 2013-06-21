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
    [self setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
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
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize boundsSize = [self bounds].size;
    CGRect frameToCenter = [[self contentZoomView] frame];
    
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width)
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    else
        frameToCenter.origin.x = 0;
    
    // center vertically
    if (frameToCenter.size.height < boundsSize.height)
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    else
        frameToCenter.origin.y = 0;
    
    [[self contentZoomView] setFrame:frameToCenter];
}

- (void)setZoomScaleForContentSize
{
    CGRect contentFrame = [[self contentZoomView] frame];
    CGRect bounds = [self bounds];
    
    NSAssert(contentFrame.size.width > 0.0, @"Content width must be greater than 0");
    NSAssert(contentFrame.size.height > 0.0, @"Content height must be greater than 0");
    
    CGFloat xRatio = bounds.size.width / contentFrame.size.width;
    CGFloat yRatio = bounds.size.height / contentFrame.size.height;
    
    CGFloat minScale = MAX(xRatio, yRatio);
    
    // Reset zoom before making calculations
    [self setMinimumZoomScale:minScale*0.5];
    [self setMaximumZoomScale:minScale*4.0];
    [self setZoomScale:minScale];
    [self setContentSize:[[self contentZoomView] frame].size];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [self contentZoomView];
}

- (void)setContentZoomView:(UIView *)contentZoomView
{
    _contentZoomView = contentZoomView;
    [contentZoomView setFrame:[self bounds]];
    [self addSubview:contentZoomView];
    [self layoutSubviews];
    [self setZoomScaleForContentSize];
}

@end
