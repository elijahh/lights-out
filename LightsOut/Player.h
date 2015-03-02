//
//  Player.h
//  LightsOut
//
//  Created by Kyle Nosar on 2/24/15.
//  Copyright (c) 2015 Elijah Houle, Kyle Nosar, Matt Burris. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <GLKit/GLKit.h>

@interface Player : SKSpriteNode

-(instancetype)initWithImageNamed:(NSString *)filename; // contstructor to create player and set velocity
@property(nonatomic,assign)CGPoint velocity; // velocity to be applied
-(void)update:(NSTimeInterval)delta; // updates delta for player(plugs into gravity)
-(CGRect)boundingBox:(CGFloat)amountToShrinkXDim yDimension:(CGFloat)amountToShrinkYDim; // set players collision


@end
