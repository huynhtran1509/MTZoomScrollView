//
//  MTImageZoomScrollView.h
//  MTPhotoScrollView
//
//  Created by Trung Tran on 6/21/13.
//  Copyright (c) 2013 WillowTree Apps, Inc. All rights reserved.
//

#import "MTZoomScrollView.h"

/**
 This class is an view that allows zooming and panning of an image. Look at MTZoomScrollView to see what parameters
  can be configured.
 */
@interface MTImageZoomScrollView : MTZoomScrollView

/**
 Sets the contentZoomView as an imageView with the image specified. The zoom scales are calculated once the image has 
 been set.
 */
@property (nonatomic, readwrite, weak) UIImage *image;

/**
 If you need to set the image through the imageView, call sizeImageViewToFit so the imageView zooms correctly.
 */
@property (nonatomic, readonly) UIImageView *imageView;

/**
 Resizes the imageView to the current image and resets the zoom scales
 */
- (void)sizeImageViewToFit;

@end
