//
//  GameScene.m
//  LightsOut
//
//  Created by Elijah Houle on 2/23/15.
//  Copyright (c) 2015 Elijah Houle, Kyle Nosar, Matt Burris. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(instancetype) initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor colorWithRed:.4 green:.4 blue:.95 alpha:1.0];
        self.tileMap = [JSTileMap mapNamed:@"lo_level1.tmx"];
        [self addChild:self.tileMap];
    }
    return self;
}

-(void)didMoveToView:(SKView *)view
{
    //create test sprite to use in testing controls
    SKSpriteNode * testSprite = [[SKSpriteNode alloc]
                                 initWithColor:[SKColor redColor]size:CGSizeMake(32,32)];
    testSprite.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    testSprite.name = @"testSprite";


    
    [self addChild:testSprite];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.xScale = 0.5;
        sprite.yScale = 0.5;
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
