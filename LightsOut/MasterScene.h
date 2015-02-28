//
//  SceneUtils.h
//  LightsOut
//
//  Created by Kyle Nosar on 2/24/15.
//  Copyright (c) 2015 Elijah Houle, Kyle Nosar, Matt Burris. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "JSTileMap.h"
#import "Task.h"
#import "TaskQueue.h"

@interface MasterScene : SKScene
//=========================== FUNCTIONS ===================================
-(SKSpriteNode *)newLeftButton; //creates the Left Button every scene
-(SKSpriteNode *)newRightButton; //creates the Right Button every scene
-(SKSpriteNode *)newUpButton;   //create Up button every scene
-(SKSpriteNode *)newDownButton; //creates Down button every scene
-(SKSpriteNode *)newAButton;  // creates a button(jump button)?
-(SKSpriteNode *)newBButton; // creates b button(acceleration)?

-(void) initTaskQueue:(NSMutableArray*) tasks; // series of tasks for level
-(void) getNextTask; // pop task off queue and assign it to activeTask
//=========================================================================

//=========================== PROPERTIES LIST ==================================
@property(nonatomic,strong)JSTileMap * tileMap; // loading the unique tile map per level
@property const int upButtonXPos;
@property const int upButtonYPos;
@property const int rightButtonXPos;
@property const int rightButtonYPos;
@property const int leftButtonXPos;
@property const int leftButtonYPos;
@property const int downButtonXPos;
@property const int downButtonYPos;
@property const int aButtonXPos;
@property const int aButtonYPos;
@property const int bButtonXPos;
@property const int bButtonYPos;
@property const int yGravity; // TODO: decide gravity implementation

@property (strong, nonatomic) TaskQueue *taskQueue;
@property (strong, nonatomic) Task *activeTask;
//=========================================================================


@end
