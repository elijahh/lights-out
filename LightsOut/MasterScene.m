//
//  SceneUtils.m
//  LightsOut
//
//  Created by Kyle Nosar on 2/24/15.
//  Copyright (c) 2015 Elijah Houle, Kyle Nosar, Matt Burris. All rights reserved.
//

#import "MasterScene.h"

@implementation MasterScene
//TODO: this class will hold all attributes all scenes used need to inherit ie: controls

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
