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
        self.backgroundColor = [SKColor whiteColor];
        self.tileMap = [JSTileMap mapNamed:@"level1.tmx"];
        [self addChild:self.tileMap];   //add tileMap to the scene tree

        self.player = [[Player alloc]initWithImageNamed:@"redtile.png"];
        self.player.position = CGPointMake(300, 500);
        self.player.zPosition = 15;
        [self.tileMap addChild:self.player];    //add player to the scene tree

        // can dd players zPosition...(TODO: show affect of both)
        
    }
    return self;
}

@end
