//
//  GameScene.h
//  LightsOut
//

//  Copyright (c) 2015 Elijah Houle, Kyle Nosar, Matt Burris. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "MasterScene.h"

/* GameScene is our test base (unit test) to test features of our game engine*/
@interface GameScene : MasterScene
@property(nonatomic,strong) JSTileMap * tileMap; // tile map to be loaded. (unique to each scene)

@end
