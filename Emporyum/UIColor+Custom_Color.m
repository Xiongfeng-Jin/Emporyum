//
//  UIColor+Custom_Color.m
//  Emporyum
//
//  Created by Jeremy Klein Sr on 1/11/14.
//  Copyright (c) 2014 Jin. All rights reserved.
//

#import "UIColor+Custom_Color.h"

@implementation UIColor (Custom_Color)

+ (UIColor *)empTealColor {
    int hexColor = 0x248c81;
    return [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:1.0];
    
}

+ (UIColor *)empLimeColor {
    int hexColor = 0x9dd237;
    return [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:1.0];
    
}

+ (UIColor *)empRedColor {
    int hexColor = 0xe03a3e;
    return [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:1.0];
    
}

+ (UIColor *)randomColor {
    NSArray* color = [NSArray arrayWithObjects:[UIColor greenColor],
                      [UIColor grayColor],
                      [UIColor blueColor],
                      [UIColor redColor],
                      [UIColor yellowColor]
                      , nil];
    return color[rand()%color.count];
}

@end
