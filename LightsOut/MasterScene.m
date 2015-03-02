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
@end
