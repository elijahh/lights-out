//
//  TaskQueue.h
//  LightsOut
//
//  Created by Elijah Houle on 2/24/15.
//  Copyright (c) 2015 Elijah Houle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@interface TaskQueue : NSObject

@property (strong, nonatomic) NSMutableArray* taskQueue;

-(void) pushTask:(Task*) task; // add task (prereqs will be added automatically)
-(Task*) popTask; // get next task

@end
