//
//  MTViewController.m
//  MTPhotoScrollView
//
//  Created by Trung Tran on 5/10/13.
//  Copyright (c) 2013 WillowTree Apps, Inc. All rights reserved.
//

#import "MTViewController.h"
#import "MTPhotoScrollView.h"

@interface MTViewController ()

@property (nonatomic, readwrite, weak) MTPhotoScrollView *scrollView1;
@property (nonatomic, readwrite, weak) IBOutlet MTPhotoScrollView *scrollView2;

@end

@implementation MTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MTPhotoScrollView *scrollView = [[MTPhotoScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 300.0)];
    [scrollView setBackgroundColor:[UIColor greenColor]];
    [scrollView setImage:[UIImage imageNamed:@"test.jpg"]];
    [[self view] addSubview:scrollView];
    [self setScrollView1:scrollView];
    
    [[self scrollView2] setImage:[UIImage imageNamed:@"test.jpg"]];
}

@end
