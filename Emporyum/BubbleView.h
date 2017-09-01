//
//  BubbleView.h
//  Emporyum
//
//  Created by Jin on 12/24/13.
//  Copyright (c) 2013 Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BubbleView : UIView
@property (strong,nonatomic) UIImage *image;
@property (nonatomic) double circleAlpha;
@property (strong,nonatomic) UIColor *circlebackgroundColor;
@property (strong,nonatomic) UIColor *circleStrokeColor;
@property (nonatomic) CGFloat radius;
-(void) setCirclebackgroundColor:(UIColor *)circlebackgroundColor andStrokeColor:(UIColor*)strokeColor;
-(id)initWithRadius:(CGFloat)radius atPoint:(CGPoint)point;


@end
