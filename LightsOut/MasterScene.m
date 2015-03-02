//
//  SceneUtils.m
//  LightsOut
//
//  Created by Kyle Nosar on 2/24/15.
//  Copyright (c) 2015 Elijah Houle, Kyle Nosar, Matt Burris. All rights reserved.
//

#import "MasterScene.h"

@implementation MasterScene

-(void) setLeftButtonTouched:(BOOL)leftButtonTouched {
    _leftButtonTouched = leftButtonTouched;
    if (leftButtonTouched) {
       [self.leftButton setAlpha:1.0];
        self.player.isMovingLeft = YES;
        self.player.isMovingRight = NO;
    }
    else {
       [self.leftButton setAlpha:0.5];
        self.player.isMovingLeft = NO;
    }
}

-(void) setRightButtonTouched:(BOOL)rightButtonTouched {
    _rightButtonTouched = rightButtonTouched;
    if (rightButtonTouched) {
        [self.rightButton setAlpha:1.0];
        self.player.isMovingRight = YES;
        self.player.isMovingLeft = NO;
    }
    else {
        [self.rightButton setAlpha:0.5];
        self.player.isMovingRight = NO;
    }
}

-(void) setAButtonTouched:(BOOL)aButtonTouched {
    _aButtonTouched = aButtonTouched;
    if (aButtonTouched) [self.aButton setAlpha:1.0];
    else [self.aButton setAlpha:0.5];
}

-(void) setBButtonTouched:(BOOL)bButtonTouched {
    _bButtonTouched = bButtonTouched;
    if (bButtonTouched) {
        [self.bButton setAlpha:1.0];
    }
    else {
       [self.bButton setAlpha:0.5];
    }
}

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
        self.leftButton = [self newLeftButton];
        [self addChild:self.leftButton];
        self.rightButton = [self newRightButton];
        [self addChild:self.rightButton];
        self.aButton = [self newAButton];
        [self addChild:self.aButton];
        self.bButton = [self newBButton];
        [self addChild:self.bButton];
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
    [self handleCollisionsForPlayer:self.player forLayer:self.walls];
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
    player.onGround = NO; // initial no
    for(NSInteger i =0; i< 8; i++){
        NSInteger tileIndex = indices[i];
        CGRect playerRect = [player boundingBox:0 yDimension:0]; // shrink nothing at the moment[TODO: test]
        CGPoint playerCoord = [layer coordForPoint:player.desiredPos];
        NSInteger tileColumn = tileIndex % 3;
        NSInteger tileRow = tileIndex / 3;
        CGPoint tileCoord = CGPointMake(playerCoord.x + (tileColumn - 1), (playerCoord.y + (tileRow - 1)));
        
        NSInteger gid = [self tileGIDAtTileCoord:tileCoord forLayer:layer];
        
        if(gid != 0) {
            CGRect tileRect = [self tileRectFromTileCoords:tileCoord];
            //NSLog(@"GID %ld, tileCoord:%@,TileRect %@,playerRect:%@",(long)gid,NSStringFromCGPoint(tileCoord),NSStringFromCGRect(tileRect),NSStringFromCGRect(playerRect));
            //COLLISION RESOLUTION GOES HERE! TODO
            if(CGRectIntersectsRect(playerRect, tileRect)) {
                CGRect intersection = CGRectIntersection(playerRect, tileRect);
                
                if(tileIndex == 7) { // tile below me
                    player.desiredPos = CGPointMake(player.desiredPos.x, player.desiredPos.y + intersection.size.height);
                    player.velocity = CGPointMake(player.velocity.x, 0.0);
                    player.onGround = YES;
                } else if(tileIndex == 1) { // tile above me
                    player.desiredPos = CGPointMake(player.desiredPos.x, player.desiredPos.y - intersection.size.height);
                } else if(tileIndex == 3) { // tile to my left
                    player.desiredPos = CGPointMake(player.desiredPos.x + intersection.size.width, player.desiredPos.y);
                } else if(tileIndex == 5) { // tile to my right
                    player.desiredPos = CGPointMake(player.desiredPos.x - intersection.size.width,player.desiredPos.y);
                } else {
                    if(intersection.size.width > intersection.size.height) { // tile is diagnol, resolve vertically
                        player.velocity = CGPointMake(player.velocity.x, 0.0);
                        float intersectionHeight;
                        if(tileIndex > 4 ) {
                            intersectionHeight = intersection.size.height;
                            player.onGround = YES;
                        } else {
                            intersectionHeight = -intersection.size.height;
                        }
                        player.desiredPos = CGPointMake(player.desiredPos.x, player.desiredPos.y + intersection.size.height);
                    } else { // tile is diagnol resolve horizontally
                      float intersectionWidth;
                      if(tileIndex == 6 || tileIndex == 0) {
                          intersectionWidth = intersection.size.width;
                        } else {
                            intersectionWidth = -intersection.size.width;
                        }
                        player.desiredPos = CGPointMake(player.desiredPos.x + intersectionWidth, player.desiredPos.y);
                    }
                }
            }
        }
    }
    player.position = player.desiredPos; // update player position after collision handling
}
@end
