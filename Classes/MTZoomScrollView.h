//
//  MTPhotoScrollView.h
//  MTPhotoScrollView
//
//  Created by Trung Tran on 5/10/13.
//  Copyright (c) 2013 WillowTree Apps, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTZoomScrollView : UIScrollView <UIScrollViewDelegate>

@property (nonatomic, readwrite, weak) UIView *contentZoomView;
@property (nonatomic, readwrite) CGFloat minContentZoomScale;
@property (nonatomic, readwrite) CGFloat maxContentZoomScale;

- (void)commonInit;
- (void)setZoomScaleForContentSize;

@end
