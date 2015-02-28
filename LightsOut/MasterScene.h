//
//  SceneUtils.h
//  LightsOut
//
//  Created by Kyle Nosar on 2/24/15.
//  Copyright (c) 2015 Elijah Houle, Kyle Nosar, Matt Burris. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MasterScene : SKScene
//=========================== FUNCTIONS ===================================
-(SKSpriteNode *)newLeftButton; //creates the Left Button every scene
-(SKSpriteNode *)newRightButton; //creates the Right Button every scene
-(SKSpriteNode *)newUpButton;   //create Up button every scene
-(SKSpriteNode *)newDownButton; //creates Down button every scene
-(SKSpriteNode *)newAButton;  // creates a button(jump button)?
-(SKSpriteNode *)newBButton; // creates b button(acceleration)?
//=========================================================================

//=========================== PROPERTIES LIST ==================================
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
//=========================================================================


@end
