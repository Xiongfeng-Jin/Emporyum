//
//  Behavior.m
//  practice84
//
//  Created by Jin on 12/21/13.
//  Copyright (c) 2013 Jin. All rights reserved.
//

#import "Behavior.h"

@interface Behavior()



@end

@implementation Behavior

-(instancetype)init{
    self= [super init];
    [self addChildBehavior:self.gravity];
    [self addChildBehavior:self.collider];
    [self addChildBehavior:self.animationActions];
    return self;
}

-(void)addItem:(id<UIDynamicItem>)item{
    [self.gravity addItem:item];
    [self.collider addItem:item];
    [self.animationActions addItem:item];
}


-(UIDynamicItemBehavior *)animationActions{
    if (!_animationActions) {
        _animationActions = [[UIDynamicItemBehavior alloc] init];
        _animationActions.resistance = 300;
    }
    return _animationActions;
}

-(void)removeItem:(id<UIDynamicItem>)item{
    [self.gravity removeItem:item];
    [self.collider removeItem:item];
    [self.animationActions removeItem:item];
}

-(UIGravityBehavior *)gravity{
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 0;
    }
    return _gravity;
}

-(UICollisionBehavior *)collider{
    if (!_collider) {
        _collider = [[UICollisionBehavior alloc] init];
        _collider.translatesReferenceBoundsIntoBoundary = YES;
    }
    return _collider;
}



@end
