//
//  BubbleView.m
//  Emporyum
//
//  Created by Jin on 12/24/13.
//  Copyright (c) 2013 Jin. All rights reserved.
//

#import "BubbleView.h"
#import "circleView.h"
#define SIZE_SCALE 0.75

@interface BubbleView()
@property (strong,nonatomic) circleView *circle;
@property (strong,nonatomic) UIImageView *imageView;
@property (nonatomic) BOOL imageViewIsOnFullScreen;

@end

@implementation BubbleView

//border around Image
-(circleView *)circle{
    if (!_circle) {
        _circle = [[circleView alloc] init];
        _circle.frame = self.bounds;
        _circle.ovalBounds = _circle.bounds;
    }
    return _circle;
}


-(double)circleAlpha{
    return self.circle.alpha;
}

-(void)setCircleAlpha:(double)circleAlpha{
    self.circle.alpha = circleAlpha;
}

-(UIColor *)circlebackgroundColor{
    return self.circle.fillColor;
}

-(UIColor *)circleStrokeColor{
    return self.circle.strokeColor;
}

-(void)setCirclebackgroundColor:(UIColor *)circlebackgroundColor{
    self.circle.fillColor = circlebackgroundColor;
}

-(void)setCircleStrokeColor:(UIColor *)circleStrokeColor{
    self.circle.strokeColor = circleStrokeColor;
}

-(void)setCirclebackgroundColor:(UIColor *)circlebackgroundColor andStrokeColor:(UIColor *)strokeColor{
    self.circlebackgroundColor=circlebackgroundColor;
    self.circleStrokeColor = strokeColor;
}

-(void)setRadius:(CGFloat)radius{
    _radius = radius;
    CGRect rect = self.frame;
    rect.size.height = radius*2;
    rect.size.width = radius*2;
    self.frame = rect;
    self.circle.frame = self.bounds;
    self.circle.ovalBounds = self.circle.bounds;
    CGRect imgr;
    imgr.size.height = self.circle.bounds.size.height * SIZE_SCALE;
    imgr.size.width = self.circle.bounds.size.width * SIZE_SCALE;
    //imgr.size.height = self.circle.bounds.size.height;
    //imgr.size.width = self.circle.bounds.size.width;
    self.imageView.frame = imgr;
    self.imageView.center = self.circle.center;
}


-(void)setImage:(UIImage *)image{
    _image = image;
    self.imageView.image = _image;
}

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        CGRect imgr;
        imgr.size.height = self.circle.bounds.size.height * SIZE_SCALE;
        imgr.size.width = self.circle.bounds.size.width * SIZE_SCALE;
        _imageView.frame =imgr;
        _imageView.center = self.circle.center;
    }
    return _imageView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.circle];
        [self addSubview:self.imageView];
    }
    CGRect rect = self.imageView.frame;
    rect.origin.x -=self.imageView.frame.origin.x*0.4;
    rect.origin.y -=self.imageView.frame.origin.y*0.4;
    rect.size.width+=self.imageView.frame.size.width*0.15;
    rect.size.height+=self.imageView.frame.size.height*0.15;
    self.bounds = rect;
    return self;
}

-(id)initWithRadius:(CGFloat)radius atPoint:(CGPoint)point{
    CGRect rect = CGRectMake(point.x, point.y, radius*2, radius*2);
    _radius = radius;    
    return [self initWithFrame:rect];
}

-(NSString *)description{
    NSString* string = [super description];
    string = [string stringByAppendingString:[NSString stringWithFormat:@"; circleAlpha = %f; circleBackgroundColor = %@; radius = %f; image = %@;",self.circleAlpha,self.circlebackgroundColor,self.radius,self.image]];
    return string;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
