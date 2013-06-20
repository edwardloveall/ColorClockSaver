//
//  ColorClockView.m
//  ColorClock
//
//  Created by Edward Loveall on 6/20/13.
//  Copyright (c) 2013 Edward Loveall. All rights reserved.
//

#import "ColorClockView.h"

@implementation ColorClockView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];

        NSString *qtzComposition = [[NSBundle bundleForClass:[self class]] pathForResource:@"ColorClock" ofType:@"qtz"];

        clockView = [[QCView alloc] initWithFrame: NSMakeRect(0, 0, NSWidth(frame), NSHeight(frame))];

        [clockView loadCompositionFromFile:qtzComposition];
        [clockView setMaxRenderingFrameRate: 30.0f];

//        [clockView setValue:@"Times" forInputKey:@"fontName"];

        [self addSubview:clockView];

    }
    return self;
}

- (void)startAnimation
{
    [clockView startRendering];
    [super startAnimation];
}

- (void)stopAnimation
{
    [clockView stopRendering];
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
