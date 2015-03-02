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
        self.backgroundColor = [SKColor blackColor];
        self.tileMap = [JSTileMap mapNamed:@"level1.tmx"];
        self.walls = [self.tileMap layerNamed:@"walls"];
        [self addChild:self.tileMap];   //add tileMap to the scene tree

        self.player = [[Player alloc]initWithImageNamed:@"sillyBot.png"];
        self.player.position = CGPointMake(100, 200);
        self.player.zPosition = 15;
        [self.tileMap addChild:self.player];    //add player to the scene tree

        // can dd players zPosition...(TODO: show affect of both)
        
    }
    return self;
}

@end
