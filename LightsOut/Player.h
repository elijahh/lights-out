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

//=============================== Methods ===================================//
-(instancetype)initWithImageNamed:(NSString *)filename; // contstructor to create player and set velocity
-(void)update:(NSTimeInterval)delta; // updates delta for player(plugs into gravity)
-(CGRect)boundingBox:(CGFloat)amountToShrinkXDim yDimension:(CGFloat)amountToShrinkYDim; // set players collision
//==========================================================================//

//============================ Properties =================================//
@property(nonatomic,assign)CGPoint desiredPos; // players desired position(ties to collision handling)
@property(nonatomic,assign)CGPoint velocity; // velocity to be applied
@property(nonatomic,assign) BOOL onGround;
@property(nonatomic,assign)BOOL isJumping;
@property(nonatomic,assign)BOOL isMovingRight;
@property(nonatomic,assign)BOOL isMovingLeft;

//=========================================================================//


@end
