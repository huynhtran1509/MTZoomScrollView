//
//  MTPhotoScrollView.h
//  MTPhotoScrollView
//
//  Created by Trung Tran on 5/10/13.
//  Copyright (c) 2013 WillowTree Apps, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MTZoomScrollViewContentMode)
{
    MTZoomScrollViewContentModeSizeToFit = 0,
    MTZoomScrollViewContentModeSizeToFill = 1,
};

@interface MTZoomScrollView : UIScrollView <UIScrollViewDelegate>

/**
 View that will be zoomed and panned
 */
@property (nonatomic, readwrite, weak) UIView *contentZoomView;

/**
 Minimum zoom scale that will be multiplied to the view's minimum zoomscale. 1.0 for set the zoom scale
 to size the contentZoomView to fit the bounds of the MTZoomScrollView. Defaults to 1.0.
 */
@property (nonatomic, readwrite) CGFloat minContentZoomScale;

/**
 Maximum zoom scale that will be multiplied to the view's maximum zoom scale. 1.0 would set the zoom contentZoomView
 to fit the bounds of the MTZoomScrollView. Defaults to 4.0.
 */
@property (nonatomic, readwrite) CGFloat maxContentZoomScale;

/**
 Content mode of the contentZoomView
 */
@property (nonatomic, readwrite) MTZoomScrollViewContentMode contentViewContentMode;

/**
 Common init method called in initWithFrame and initWithCoder for basic setup for default values.
 */
- (void)commonInit;

/**
 Updates the zoomscale for the content size of the contentZoomView. You will need to call this if you set 
 min/maxContentZoomScale after setting contentZoomView.
 */
- (void)setZoomScaleForContentSize;

@end
