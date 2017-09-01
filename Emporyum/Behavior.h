//
//  Behavior.h
//  practice84
//
//  Created by Jin on 12/21/13.
//  Copyright (c) 2013 Jin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Behavior : UIDynamicBehavior

-(void) addItem:(id <UIDynamicItem>) item;
-(void)removeItem:(id <UIDynamicItem>)item;
@property (strong,nonatomic) UIGravityBehavior *gravity;
@property (strong,nonatomic) UICollisionBehavior *collider;
@property (strong,nonatomic) UIDynamicItemBehavior *animationActions;

@end
