//
//  MTPhotoScrollView.m
//  MTPhotoScrollView
//
//  Created by Trung Tran on 5/10/13.
//  Copyright (c) 2013 WillowTree Apps, Inc. All rights reserved.
//

#import "MTPhotoScrollView.h"

@interface MTPhotoScrollView()
@end

@implementation MTPhotoScrollView

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
    UIImageView *imageView = [UIImageView new];
    [self addSubview:imageView];
    [self setImageView:imageView];
    
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
}

- (void)sizeImageViewToFit
{
    UIImage *image = [[self imageView] image];
    [[self imageView] setFrame:CGRectMake(0.0, 0.0, [image size].width, [image size].height)];
    [self layoutSubviews];
    [self setMaxMinZoomScalesForCurrentBounds];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize boundsSize = [self bounds].size;
    CGRect frameToCenter = [[self imageView] frame];
    
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
    
    [[self imageView] setFrame:frameToCenter];
}

- (void)setMaxMinZoomScalesForCurrentBounds
{
    CGRect imageFrame = [[self imageView] frame];
    CGRect bounds = [self bounds];
    
    CGFloat xRatio = bounds.size.width / imageFrame.size.width;
    CGFloat yRatio = bounds.size.height / imageFrame.size.height;
    
    CGFloat minScale = MAX(xRatio, yRatio);
    
    // Reset zoom before making calculations
    [self setMinimumZoomScale:minScale];
    [self setMaximumZoomScale:minScale*4.0];
    [self setZoomScale:minScale];
    [self setContentSize:[[self imageView] frame].size];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [self imageView];
}

- (void)setImage:(UIImage *)image
{
    [[self imageView] setImage:image];
    [self sizeImageViewToFit];
}

- (UIImage *)image
{
    return [[self imageView] image];
}

@end
