//
//  ShowImageViewController.m
//  Emporyum
//
//  Created by Jin on 1/3/14.
//  Copyright (c) 2014 Jin. All rights reserved.
//

#import "ShowImageViewController.h"
//#import "CubeModel.h"

@interface ShowImageViewController ()
@property(strong,nonatomic) NSMutableDictionary *dictPoint;
@property (strong,nonatomic) NSMutableDictionary *cube;
//@property (strong,nonatomic) CubeModel *cubeModel;
@end

@implementation ShowImageViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    UISwipeGestureRecognizer *swip;
    swip =[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipRight:)];
    [self.view addGestureRecognizer:swip];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
    swip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipLeft:)];
    swip.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swip];
    swip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipDown:)];
    swip.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swip];
    swip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipUp:)];
    swip.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swip];
    self.imageView.animationDuration = 0.5;
    self.imageView.animationRepeatCount = 1;
    self.dictPoint = self.cube[@"blue"];
//    self.imageView.image = self.cubeModel.frontColor[@"blue"];
}


//-(CubeModel *)cubeModel{
//    if (!_cubeModel) {
//        _cubeModel = [[CubeModel alloc] init];
//        self.cube=_cubeModel.cube;
//    }
//    return _cubeModel;
//}
//
//-(NSMutableDictionary *)cube{
//    if (!_cube) {
//        _cube = self.cubeModel.cube;
//    }
//    return _cube;
//}


- (void)swipRight:(UISwipeGestureRecognizer*)sender {
    self.imageView.animationImages = self.dictPoint[@"to_l"];
//    self.imageView.image = self.cubeModel.frontColor[self.dictPoint[@"l_dict"]];
    [self.imageView startAnimating];
    
    self.dictPoint = self.cube[self.dictPoint[@"l_dict"]];
    
}

-(void)swipLeft:(UISwipeGestureRecognizer*)sender{
    self.imageView.animationImages = self.dictPoint[@"to_r"];
//    self.imageView.image = self.cubeModel.frontColor[self.dictPoint[@"r_dict"]];
    [self.imageView startAnimating];
    self.dictPoint = self.cube[self.dictPoint[@"r_dict"]];
}

-(void)swipUp:(UISwipeGestureRecognizer*)sender{
    self.imageView.animationImages = self.dictPoint[@"to_d"];
//    self.imageView.image = self.cubeModel.frontColor[self.dictPoint[@"d_dict"]];
    [self.imageView startAnimating];
    
    self.dictPoint = self.cube[self.dictPoint[@"d_dict"]];
}


-(void)swipDown:(UISwipeGestureRecognizer*)sender{
    self.imageView.animationImages = self.dictPoint[@"to_u"];
 //   self.imageView.image = self.cubeModel.frontColor[self.dictPoint[@"u_dict"]];
    [self.imageView startAnimating];
    
    self.dictPoint = self.cube[self.dictPoint[@"u_dict"]];
}

- (void)tap:(UITapGestureRecognizer *)sender {
    [self.imageView stopAnimating];
}
@end
