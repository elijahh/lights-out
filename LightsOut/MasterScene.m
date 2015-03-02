//
//  SceneUtils.m
//  LightsOut
//
//  Created by Kyle Nosar on 2/24/15.
//  Copyright (c) 2015 Elijah Houle, Kyle Nosar, Matt Burris. All rights reserved.
//

#import "MasterScene.h"

@implementation MasterScene

-(instancetype) initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        [self setLeftButtonXPos:20];
        [self setLeftButtonYPos:20];
        [self setRightButtonXPos:75];
        [self setRightButtonYPos:20];
        [self setAButtonXPos:size.width-70];
        [self setAButtonYPos:20];
        [self setBButtonXPos:size.width-125];
        [self setBButtonYPos:20];
        [self addChild:[self newLeftButton]];
        [self addChild:[self newRightButton]];
        [self addChild:[self newAButton]];
        [self addChild:[self newBButton]];
    }
    return self;
}

-(SKSpriteNode *)newLeftButton {
    SKSpriteNode *leftButton = [[SKSpriteNode alloc] initWithImageNamed:@"lbutton.png"];
    [leftButton setPosition:CGPointMake(self.leftButtonXPos, self.leftButtonYPos)];
    [leftButton setAlpha:0.5];
    return leftButton;
}

-(SKSpriteNode *)newRightButton {
    SKSpriteNode *rightButton = [[SKSpriteNode alloc] initWithImageNamed:@"rbutton.png"];
    [rightButton setPosition:CGPointMake(self.rightButtonXPos, self.rightButtonYPos)];
    [rightButton setAlpha:0.5];
    return rightButton;
}

-(SKSpriteNode *)newAButton {
    SKSpriteNode *aButton = [[SKSpriteNode alloc] initWithImageNamed:@"abutton.png"];
    [aButton setPosition:CGPointMake(self.aButtonXPos, self.aButtonYPos)];
    [aButton setAlpha:0.5];
    return aButton;
}

-(SKSpriteNode *)newBButton {
    SKSpriteNode *bButton = [[SKSpriteNode alloc] initWithImageNamed:@"bbutton.png"];
    [bButton setPosition:CGPointMake(self.bButtonXPos, self.bButtonYPos)];
    [bButton setAlpha:0.5];
    return bButton;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch* touch in touches) {
        CGPoint point = [touch locationInNode:self];
        if (self.leftButtonXPos-20 <= point.x && point.x <= self.leftButtonXPos+20
            && self.leftButtonYPos-20 <= point.y && point.y <= self.leftButtonYPos+20) [self setLeftButtonTouched:YES];
        if (self.rightButtonXPos-20 <= point.x && point.x <= self.rightButtonXPos+20
            && self.rightButtonYPos-20 <= point.y && point.y <= self.rightButtonYPos+20) [self setRightButtonTouched:YES];
        if (self.aButtonXPos-20 <= point.x && point.x <= self.aButtonXPos+20
            && self.aButtonYPos-20 <= point.y && point.y <= self.aButtonYPos+20) [self setAButtonTouched:YES];
        if (self.bButtonXPos-20 <= point.x && point.x <= self.bButtonXPos+20
            && self.bButtonYPos-20 <= point.y && point.y <= self.bButtonYPos+20) [self setBButtonTouched:YES];
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch* touch in touches) {
        CGPoint point = [touch locationInNode:self];
        if (self.leftButtonXPos-20 <= point.x && point.x <= self.leftButtonXPos+20
            && self.leftButtonYPos-20 <= point.y && point.y <= self.leftButtonYPos+20) [self setLeftButtonTouched:NO];
        if (self.rightButtonXPos-20 <= point.x && point.x <= self.rightButtonXPos+20
            && self.rightButtonYPos-20 <= point.y && point.y <= self.rightButtonYPos+20) [self setRightButtonTouched:NO];
        if (self.aButtonXPos-20 <= point.x && point.x <= self.aButtonXPos+20
            && self.aButtonYPos-20 <= point.y && point.y <= self.aButtonYPos+20) [self setAButtonTouched:NO];
        if (self.bButtonXPos-20 <= point.x && point.x <= self.bButtonXPos+20
            && self.bButtonYPos-20 <= point.y && point.y <= self.bButtonYPos+20) [self setBButtonTouched:NO];
    }
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch* touch in touches) {
        CGPoint point = [touch previousLocationInNode:self]; // stop touching
        if (self.leftButtonXPos-20 <= point.x && point.x <= self.leftButtonXPos+20
            && self.leftButtonYPos-20 <= point.y && point.y <= self.leftButtonYPos+20) [self setLeftButtonTouched:NO];
        if (self.rightButtonXPos-20 <= point.x && point.x <= self.rightButtonXPos+20
            && self.rightButtonYPos-20 <= point.y && point.y <= self.rightButtonYPos+20) [self setRightButtonTouched:NO];
        if (self.aButtonXPos-20 <= point.x && point.x <= self.aButtonXPos+20
            && self.aButtonYPos-20 <= point.y && point.y <= self.aButtonYPos+20) [self setAButtonTouched:NO];
        if (self.bButtonXPos-20 <= point.x && point.x <= self.bButtonXPos+20
            && self.bButtonYPos-20 <= point.y && point.y <= self.bButtonYPos+20) [self setBButtonTouched:NO];
        
        point = [touch locationInNode:self]; // start touching
        if (self.leftButtonXPos-20 <= point.x && point.x <= self.leftButtonXPos+20
            && self.leftButtonYPos-20 <= point.y && point.y <= self.leftButtonYPos+20) [self setLeftButtonTouched:YES];
        if (self.rightButtonXPos-20 <= point.x && point.x <= self.rightButtonXPos+20
            && self.rightButtonYPos-20 <= point.y && point.y <= self.rightButtonYPos+20) [self setRightButtonTouched:YES];
        if (self.aButtonXPos-20 <= point.x && point.x <= self.aButtonXPos+20
            && self.aButtonYPos-20 <= point.y && point.y <= self.aButtonYPos+20) [self setAButtonTouched:YES];
        if (self.bButtonXPos-20 <= point.x && point.x <= self.bButtonXPos+20
            && self.bButtonYPos-20 <= point.y && point.y <= self.bButtonYPos+20) [self setBButtonTouched:YES];
    }
}

-(void) initTaskQueue:(NSMutableArray*) tasks {
    for (int i = 0; i < tasks.count; ++i) {
        [self.taskQueue pushTask:tasks[i]];
    }
}

-(void) getNextTask {
    self.activeTask = [self.taskQueue popTask];
}

// handles delta spikes on hungry tasks
-(void)update:(NSTimeInterval)currentTime{
    NSTimeInterval delta = currentTime - self.previousUpdateTime; //keeping track of timeStamp
    if(delta >0.02) delta = 0.02;
    self.previousUpdateTime = currentTime;
    [self.player update:delta];
    
}
//gets a rect boundary for each tile
-(CGRect)tileRectFromTileCoords:(CGPoint)tileCoords {
    float levelHeight = self.tileMap.mapSize.height * self.tileMap.tileSize.height;
    CGPoint origin = CGPointMake(tileCoords.x * self.tileMap.tileSize.width, levelHeight - ((tileCoords.y + 1) * self.tileMap.tileSize.height));
    return CGRectMake(origin.x, origin.y, self.tileMap.tileSize.width, self.tileMap.tileSize.height);
}
//gets the GID info for this tiles layer(wall, hazard, portal, etc)
-(NSInteger)tileGIDAtTileCoord:(CGPoint)coord forLayer:(TMXLayer *)layer {
    TMXLayerInfo * layerInfo = layer.layerInfo;
    
    return [layerInfo tileGidAtCoord:coord];
}

-(void)handleCollisionsForPlayer:(Player *)player forLayer:(TMXLayer*)layer {
    NSInteger indices[8] = {7,1,3,5,0,2,6,8};
    for(int i =0; i< 8; i++){
        NSInteger tileIndex = indices[i];
        CGRect playerRect = [player boundingBox:0 yDimension:0]; // shrink nothing at the moment[TODO: test]
        CGPoint playerCoord = [layer coordForPoint:player.position];
        NSInteger tileColumn = tileIndex % 3;
        NSInteger tileRow = tileIndex / 3;
        CGPoint tileCoord = CGPointMake(playerCoord.x + (tileColumn - 1), (playerCoord.y + (tileRow - 1)));
        
        NSInteger gid = [self tileGIDAtTileCoord:tileCoord forLayer:layer];
        
        if(gid) {
            CGRect tileRect = [self tileRectFromTileCoords:tileCoord];
            NSLog(@"GID %ld, tileCoord:%@,TileRect %@,playerRect:%@",(long)gid,NSStringFromCGPoint(tileCoord),NSStringFromCGRect(tileRect),NSStringFromCGRect(playerRect));
            //COLLISION RESOLUTION GOES HERE! TODO
        }
    }
}
@end
