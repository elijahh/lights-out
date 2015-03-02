//
//  Player.m
//  LightsOut
//
//  Created by Kyle Nosar on 2/24/15.
//  Copyright (c) 2015 Elijah Houle, Kyle Nosar, Matt Burris. All rights reserved.
//

#import "Player.h"

@implementation Player
//Creates a player with a specified filename
//sets player velocity to a standard of nothing
-(instancetype)initWithImageNamed:(NSString *)filename{
    if(self == [super initWithImageNamed:filename]){
        self.velocity = CGPointMake(0.0, 0.0);
    }
    return self;
}

//sets players bounding box, the 2 args allow you
//to shrink the x an y dimensions of the box as needed
-(CGRect)boundingBox:(CGFloat)amountToShrinkXDim yDimension:(CGFloat)amountToShrinkYDim {
    CGRect boundingBox = CGRectInset(self.frame, amountToShrinkXDim,amountToShrinkYDim);
    CGPoint delta = CGPointMake(self.desiredPos.x - self.position.x, self.desiredPos.y - self.position.y);
    return CGRectOffset(boundingBox, delta.x, delta.y);
}
//returns new vector based on scalar value(Vector is a CGPoints x and y values)
-(CGPoint)getScalarProduct:(CGPoint)vector withDelta:(CGFloat)scalar {
    vector.x *= scalar;
    vector.y *= scalar;
    return CGPointMake(vector.x, vector.y);
}
//returns the some of two points x1 + x2 , y1 + y2
-(CGPoint)getSumOfPoints:(CGPoint)pointOne withPoint:(CGPoint)pointTwo {
    return CGPointMake(pointOne.x + pointTwo.x, pointOne.y + pointTwo.y);
}

// updates the current timestep and player gravity
-(void)update:(NSTimeInterval)delta {
    CGPoint gravity = CGPointMake(0.0, -450.0);
    CGPoint gravityStep = [self getScalarProduct:gravity withDelta:delta];
    self.velocity = [self getSumOfPoints:self.velocity withPoint:gravityStep];
    CGPoint velocityStep = [self getScalarProduct:self.velocity withDelta:delta];
    self.desiredPos = [self getSumOfPoints:self.position withPoint:velocityStep];
    if(self.isMovingLeft) {
        self.velocity = CGPointMake(self.velocity.x - 5, self.velocity.y);
    }
    else if(self.isMovingRight) {
        self.velocity = CGPointMake(self.velocity.x + 5, self.velocity.y);
    }
    else if( !self.isMovingRight && !self.isMovingLeft) {
        self.velocity = CGPointMake(0, self.velocity.y);
    }
    NSLog(@" MY LOCATION: %@",NSStringFromCGPoint(self.position));
}
@end
