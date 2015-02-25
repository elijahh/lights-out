//
//  LightbulbTask.m
//  LightsOut
//
//  Created by Elijah Houle on 2/25/15.
//  Copyright (c) 2015 Elijah Houle. All rights reserved.
//

#import "LightbulbTask.h"

@implementation LightbulbTask

-(id) init {
    Task *findLightbulb = [Task init];
    Task *findSocket = [Task init];
    [findSocket addPrerequisite:findLightbulb];
    Task *putIntoSocket = [Task init];
    [putIntoSocket addPrerequisite:findSocket];
    return putIntoSocket;
}

@end
