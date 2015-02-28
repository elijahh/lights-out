//
//  TaskQueue.m
//  LightsOut
//
//  Created by Elijah Houle on 2/24/15.
//  Copyright (c) 2015 Elijah Houle. All rights reserved.
//

#import "TaskQueue.h"

@implementation TaskQueue

-(void) pushTask:(Task*) task {
    for (unsigned long i = self.taskQueue.count; i > 0; --i) { // shift array to push task at beginning
        self.taskQueue[i] = self.taskQueue[i-1];
    }
    for (int i = 0; i < task.prerequisites.count; ++i) { // push prereqs
        [self pushTask:task.prerequisites[i]];
    }
    self.taskQueue[0] = task; // push task
}

-(Task*) popTask {
    Task* task = self.taskQueue.lastObject;
    [self.taskQueue removeLastObject];
    return task;
}

@end
