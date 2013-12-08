//
//  ViewController.m
//  SJCBlockDrawingViewExample
//
//  Created by Stuart Crook on 07/12/2013.
//  Copyright (c) 2013 Stuart Crook. All rights reserved.
//

#import "ViewController.h"
#import "SJCBlockDrawingView.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // A trivial example of using the block drawing view to render a
    // gradient. (This can be achieved far more efficiently using a
    // CAGradientLayer, but that isn't really the point, is it?)
    
    [_blockDrawingView setDrawRectBlock: ^(UIView *view, CGRect rect) {
       
        CGColorSpaceRef cs = CGColorSpaceCreateDeviceRGB();
        CFArrayRef colours = (__bridge CFArrayRef)@[ (id)[UIColor whiteColor].CGColor, (id)[UIColor blackColor].CGColor ];
        CGGradientRef gradient = CGGradientCreateWithColors(cs, colours, NULL);
        
        // use 'view' to refer to the current view in the same way you would use 'self'
        CGRect bounds = view.bounds;
        
        CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), gradient, bounds.origin, CGPointMake(bounds.size.width, bounds.size.height), kNilOptions);
        
        CGGradientRelease(gradient);
        CGColorSpaceRelease(cs);
    }];
}

@end
