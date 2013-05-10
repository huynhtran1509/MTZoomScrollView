//
//  MTPhotoScrollView.h
//  MTPhotoScrollView
//
//  Created by Trung Tran on 5/10/13.
//  Copyright (c) 2013 WillowTree Apps, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTPhotoScrollView : UIScrollView <UIScrollViewDelegate>

@property (nonatomic, readwrite, weak) UIImage *image;
@property (nonatomic, readwrite, weak) UIImageView *imageView;

- (void)commonInit;
- (void)sizeImageViewToFit;
- (void)setMaxMinZoomScalesForCurrentBounds;

@end
