//
//  circleView.m
//  practice83
//
//  Created by Jin on 12/23/13.
//  Copyright (c) 2013 Jin. All rights reserved.
//

#import "circleView.h"


@implementation circleView
@synthesize fillColor = _fillColor;
@synthesize strokeColor = _strokeColor;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

-(UIColor *)fillColor{
    if (!_fillColor) {
        _fillColor = [UIColor whiteColor];
    }
    return _fillColor;
}

-(void)setFillColor:(UIColor *)fillColor{
    _fillColor = fillColor;
    [self setNeedsDisplay];
}

-(UIColor *)strokeColor{
    if (!_strokeColor) {
        _strokeColor = [UIColor whiteColor];
    }
    return _strokeColor;
}

-(void)setStrokeColor:(UIColor *)strokeColor{
    _strokeColor = strokeColor;
    [self setNeedsDisplay];
}



-(void)setOvalBounds:(CGRect)ovalBounds{
    _ovalBounds = ovalBounds;
    [self setNeedsDisplay];
}

-(void)setup{
    self.backgroundColor = nil;
    self.alpha = 0.4;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

-(void)awakeFromNib{
    [self setup];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.ovalBounds];
    [path addClip];
    [self.fillColor setFill];
    UIRectFill(self.bounds);
    [self.strokeColor setStroke];
    
    [path stroke];
    
}


@end
