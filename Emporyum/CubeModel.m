////
////  CubeModel.m
////  Emporyum
////
////  Created by Jin on 1/12/14.
////  Copyright (c) 2014 Jin. All rights reserved.
////
//
//#import "CubeModel.h"
//
//@interface CubeModel()
//@property (strong,nonatomic) NSMutableArray *imgArray;
//@property (strong,nonatomic) NSMutableDictionary *blue;
//@property (strong,nonatomic) NSMutableDictionary *green;
//@property (strong,nonatomic) NSMutableDictionary *orange;
//@property (strong,nonatomic) NSMutableDictionary *red;
//@property (strong,nonatomic) NSMutableDictionary *white;
//@property (strong,nonatomic) NSMutableDictionary *yellow;
//@end
//
//@implementation CubeModel
//
//-(id)init{
//    self = [super init];
//    if (self) {
//        NSString *string;
//        for (int i = 0; i<=100; i++) {
//            string = @"blue_cube_d";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.blue[@"to_d"]=self.imgArray;
//        self.blue[@"d_img"] = [self.blue[@"to_d"] lastObject];
//        self.blue[@"d_dict"] = @"orange";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"blue_cube_l";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.blue[@"to_l"]=self.imgArray;
//        self.blue[@"l_img"] = [self.blue[@"to_l"] lastObject];
//        self.blue[@"l_dict"] = @"white";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"blue_cube_r";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.blue[@"to_r"]=self.imgArray;
//        self.blue[@"r_img"] = [self.blue[@"to_r"] lastObject];
//        self.blue[@"r_dict"] = @"red";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"blue_cube_u";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.blue[@"to_u"]=self.imgArray;
//        self.blue[@"u_img"] = [self.blue[@"to_u"] lastObject];
//        self.blue[@"u_dict"] = @"yellow";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"green_cube_d";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.green[@"to_d"]=self.imgArray;
//        self.green[@"d_img"] = [self.green[@"to_d"] lastObject];
//        self.green[@"d_dict"] = @"yellow";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"green_cube_l";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.green[@"to_l"]=self.imgArray;
//        self.green[@"l_img"] = [self.green[@"to_l"] lastObject];
//        self.green[@"l_dict"] = @"red";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"green_cube_r";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.green[@"to_r"]=self.imgArray;
//        self.green[@"r_img"] = [self.green[@"to_r"] lastObject];
//        self.green[@"r_dict"] = @"white";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"green_cube_u";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.green[@"to_u"]=self.imgArray;
//        self.green[@"u_img"] = [self.green[@"to_u"] lastObject];
//        self.green[@"u_dict"] = @"orange";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"orange_cube_d";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.orange[@"to_d"]=self.imgArray;
//        self.orange[@"d_img"] = [self.orange[@"to_d"] lastObject];
//        self.orange[@"d_dict"]=@"green";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"orange_cube_l";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.orange[@"to_l"]=self.imgArray;
//        self.orange[@"l_img"] = [self.orange[@"to_l"] lastObject];
//        self.orange[@"l_dict"]=@"white";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"orange_cube_r";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.orange[@"to_r"]=self.imgArray;
//        self.orange[@"r_img"] = [self.orange[@"to_r"] lastObject];
//        self.orange[@"r_dict"]=@"red";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"orange_cube_u";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.orange[@"to_u"]=self.imgArray;
//        self.orange[@"u_img"] = [self.orange[@"to_u"] lastObject];
//        self.orange[@"u_dict"]=@"blue";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"red_cube_d";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.red[@"to_d"]=self.imgArray;
//        self.red[@"d_img"] = [self.red[@"to_d"] lastObject];
//        self.red[@"d_dict"]=@"orange";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"red_cube_l";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.red[@"to_l"]=self.imgArray;
//        self.red[@"l_img"] = [self.red[@"to_l"] lastObject];
//        self.red[@"l_dict"]=@"blue";
//        self.imgArray = nil;
//        
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"red_cube_r";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.red[@"to_r"]=self.imgArray;
//        self.red[@"r_img"] = [self.red[@"to_r"] lastObject];
//        self.red[@"r_dict"]=@"green";
//        self.imgArray = nil;
//        
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"red_cube_u";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.red[@"to_u"]=self.imgArray;
//        self.red[@"u_img"] = [self.red[@"to_u"] lastObject];
//        self.red[@"u_dict"]=@"yellow";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"white_cube_d";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.white[@"to_d"]=self.imgArray;
//        self.white[@"d_img"] = [self.white[@"to_d"] lastObject];
//        self.white[@"d_dict"]=@"orange";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"white_cube_l";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.white[@"to_l"]=self.imgArray;
//        self.white[@"l_img"] = [self.white[@"to_l"] lastObject];
//        self.white[@"l_dict"]=@"green";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"white_cube_r";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.white[@"to_r"]=self.imgArray;
//        self.white[@"r_img"] = [self.white[@"to_r"] lastObject];
//        self.white[@"r_dict"]=@"blue";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"white_cube_u";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.white[@"to_u"]=self.imgArray;
//        self.white[@"u_img"] = [self.white[@"to_u"] lastObject];
//        self.white[@"u_dict"]=@"yellow";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"yellow_cube_d";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.yellow[@"to_d"]=self.imgArray;
//        self.yellow[@"d_img"] = [self.yellow[@"to_d"] lastObject];
//        self.yellow[@"d_dict"]=@"blue";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"yellow_cube_l";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.yellow[@"to_l"]=self.imgArray;
//        self.yellow[@"l_img"] = [self.yellow[@"to_l"] lastObject];
//        self.yellow[@"l_dict"]=@"white";
//        self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//         string = @"yellow_cube_r";
//         string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//         [self.imgArray addObject:[UIImage imageNamed:string]];
//         }
//        self.yellow[@"to_r"]=self.imgArray;
//        self.yellow[@"r_img"] = [self.yellow[@"to_r"] lastObject];
//        self.yellow[@"r_dict"]=@"red";
//         self.imgArray = nil;
//        
//        for (int i = 0; i<=100; i++) {
//            string = @"yellow_cube_u";
//            string = [string stringByAppendingString:[NSString stringWithFormat:@"%04d.jpg",i]];
//            [self.imgArray addObject:[UIImage imageNamed:string]];
//        }
//        self.yellow[@"to_u"]=self.imgArray;
//        self.yellow[@"u_img"] = [self.yellow[@"to_u"] lastObject];
//        self.yellow[@"u_dict"]=@"green";
//        self.imgArray = nil;
//    }
//    return self;
//}
//
//
//-(NSMutableArray *)imgArray{
//    if (!_imgArray) {
//        _imgArray = [NSMutableArray array];
//    }
//    return _imgArray;
//}
//
//-(NSMutableDictionary *)cube{
//    if (!_cube) {
//        _cube = [NSMutableDictionary dictionary];
//        _cube[@"blue"] = self.blue;
//        _cube[@"green"] = self.green;
//        _cube[@"orange"]=self.orange;
//        _cube[@"red"] = self.red;
//        _cube[@"white"]=self.white;
//        _cube[@"yellow"] = self.yellow;
//    }
//    return _cube;
//}
//
//-(NSMutableDictionary *)blue{
//    if (!_blue) {
//        _blue = [NSMutableDictionary dictionary];
//    }
//    return _blue;
//}
//
//
//-(NSMutableDictionary *)green{
//    if (!_green) {
//        _green = [NSMutableDictionary dictionary];
//    }
//    return _green;
//}
//
//-(NSMutableDictionary *)orange{
//    if (!_orange) {
//        _orange = [NSMutableDictionary dictionary];
//    }
//    return _orange;
//}
//
//-(NSMutableDictionary *)red{
//    if (!_red) {
//        _red = [NSMutableDictionary dictionary];
//    }
//    return _red;
//}
//
//-(NSMutableDictionary *)white{
//    if (!_white) {
//        _white = [NSMutableDictionary dictionary];
//    }
//    return _white;
//}
//
//-(NSMutableDictionary *)yellow{
//    if (!_yellow) {
//        _yellow = [NSMutableDictionary dictionary];
//    }
//    return _yellow;
//}
//
//-(NSMutableDictionary *)frontColor{
//    if (!_frontColor) {
//        _frontColor = [NSMutableDictionary dictionary];
//        _frontColor[@"blue"] = [self.blue[@"to_u"] firstObject];
//        _frontColor[@"green"] = [self.green[@"to_u"] firstObject];
//        _frontColor[@"red"] = [self.red[@"to_u"] firstObject];
//        _frontColor[@"orange"] = [self.orange[@"to_u"] firstObject];
//        _frontColor[@"white"] = [self.white[@"to_u"] firstObject];
//        _frontColor[@"yellow"] = [self.yellow[@"to_u"] firstObject];
//    }
//    return _frontColor;
//}
//
//
//@end
//
