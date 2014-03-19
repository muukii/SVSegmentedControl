//
//  ViewController.m
//  SVSegmentedControl
//
//  Created by Sam Vermette on 24.05.11.
//  Copyright 2011 Sam Vermette. All rights reserved.
//

#import "ViewController.h"

#import <QuartzCore/QuartzCore.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// 1st CONTROL
	
	SVSegmentedControl *navSC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"Section 1", @"Section 2", nil]];
    navSC.changeHandler = ^(NSUInteger newIndex) {
        NSLog(@"segmentedControl did select index %i (via block handler)", newIndex);
    };
    
	[self.view addSubview:navSC];
	
	navSC.center = CGPointMake(160, 70);
	
	
	// 2nd CONTROL
	SVSegmentedControl *redSC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"About", @"Help", @"Credits", nil]];
    [redSC addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
	redSC.crossFadeLabelsOnDrag = YES;
	redSC.thumb.tintColor = [UIColor colorWithRed:0.6 green:0.2 blue:0.2 alpha:1];
    [redSC setSelectedSegmentIndex:1 animated:NO];
	
	[self.view addSubview:redSC];
	
	redSC.center = CGPointMake(160, 170);
	
	
	// 3rd CONTROL
	SVSegmentedControl *grayRC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"Section 1", @"Section 2", nil]];
    [grayRC addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
	grayRC.font = [UIFont boldSystemFontOfSize:19];
	grayRC.titleEdgeInsets = UIEdgeInsetsMake(0, 14, 0, 14);
	grayRC.height = 46;
	grayRC.thumb.tintColor = [UIColor colorWithRed:0 green:0.5 blue:0.1 alpha:1];
	grayRC.mustSlideToChange = YES;
    
	[self.view addSubview:grayRC];
	
	grayRC.center = CGPointMake(160, 270);
	
	
	// 4th CONTROL
	SVSegmentedControl *yellowRC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"One", @"Two", @"Three", nil]];
    [yellowRC addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];

	yellowRC.backgroundTintColor = [UIColor grayColor];
    yellowRC.height = 25;
    yellowRC.textShadowColor = [UIColor clearColor];
    yellowRC.thumbEdgeInset = UIEdgeInsetsMake(0, 0, 2, 0);
    yellowRC.textColor = [UIColor blueColor];
    yellowRC.borderColor = [UIColor blueColor];
    yellowRC.borderWidth = 0.5;

    SVSegmentedThumb *thumb = yellowRC.thumb;

    thumb.tintColor = [UIColor blackColor];
    thumb.textColor = [UIColor blueColor];
    thumb.shouldCastShadow = NO;
    thumb.borderColor = [UIColor blueColor];
    thumb.borderWidth = 0.5;

	[self.view addSubview:yellowRC];
	
	yellowRC.center = CGPointMake(160, 370);
}


#pragma mark - UIControlEventValueChanged

- (void)segmentedControlChangedValue:(SVSegmentedControl*)segmentedControl {
	NSLog(@"segmentedControl %i did select index %i (via UIControl method)", segmentedControl.tag, segmentedControl.selectedSegmentIndex);
}


@end
