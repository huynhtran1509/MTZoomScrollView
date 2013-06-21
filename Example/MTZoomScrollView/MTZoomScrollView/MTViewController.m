//
//  MTViewController.m
//  MTPhotoScrollView
//
//  Created by Trung Tran on 5/10/13.
//  Copyright (c) 2013 WillowTree Apps, Inc. All rights reserved.
//

#import "MTViewController.h"
#import "MTImageZoomScrollView.h"

@interface MTViewController ()

@property (nonatomic, readwrite, weak) IBOutlet MTImageZoomScrollView *scrollView;

@end

@implementation MTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Programatically
    MTZoomScrollView *scrollView = [[MTZoomScrollView alloc] initWithFrame:CGRectMake(0.0, 300.0, 100.0, 100.0)];
    [scrollView setMinContentZoomScale:1.0];
    [scrollView setBackgroundColor:[UIColor orangeColor]];
    UILabel *contentView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 200.0, 200.0)];
    [contentView setText:@"Non-Image View"];
    [scrollView setContentZoomView:contentView];
    [[self view] addSubview:scrollView];
    
    // Programatically with Image
    MTImageZoomScrollView *imageScrollView = [[MTImageZoomScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 300.0)];
    [imageScrollView setMinContentZoomScale:1.0];
    [imageScrollView setBackgroundColor:[UIColor greenColor]];
    [imageScrollView setImage:[UIImage imageNamed:@"test.jpg"]];
    [[self view] addSubview:imageScrollView];
    
    // Interface Builder with Image
    [[self scrollView] setImage:[UIImage imageNamed:@"test.jpg"]];
}

@end
