//
//  Task.m
//  LightsOut
//
//  Created by Elijah Houle on 2/24/15.
//  Copyright (c) 2015 Elijah Houle. All rights reserved.
//

#import "Task.h"

@implementation Task

@synthesize completed;
@synthesize active;

-(id) initWithTag:(NSString*) tag {
    if (self = [super init]) {
        self.tag = tag;
        [self setActive:NO];
        [self setCompleted:NO];
    }
    return self;
}

-(id) initWithTag:(NSString*)tag AndPrerequisites:(NSMutableArray*)tasks {
    if (self = [super init]) {
        self.tag = tag;
        self.prerequisites = tasks;
        [self setActive:NO];
        [self setCompleted:NO];
    }
    return self;
}

-(void) addPrerequisite:(Task*) task {
    [self.prerequisites addObject:task];
}

-(void) addPrerequisites:(NSMutableArray*) tasks {
    [self.prerequisites addObjectsFromArray:tasks];
}

-(BOOL) canStart {
    // Check whether dependencies are fulfilled.
    for (int i = 0; i < self.prerequisites.count; ++i) {
        Task* dependency = (Task*) self.prerequisites[i];
        if (!dependency.completed) return NO;
    }
    return YES;
}

-(void) startTask {
    [self setActive:YES];
    [self setCompleted:NO];
}

-(void) completeTask {
    [self setActive:NO];
    [self setCompleted:YES];
}

@end
