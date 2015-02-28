//
//  Player.m
//  LightsOut
//
//  Created by Kyle Nosar on 2/24/15.
//  Copyright (c) 2015 Elijah Houle, Kyle Nosar, Matt Burris. All rights reserved.
//

#import "Player.h"

@implementation Player
//Creates a player with a specified filename
//sets player velocity to a standard of nothing
-(instancetype)initWithImageNamed:(NSString *)filename{
    if(self == [super initWithImageNamed:filename]){
        self.velocity = CGPointMake(0.0, 0.0);
    }
        return self;
}

@end
