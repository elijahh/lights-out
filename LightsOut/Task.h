//
//  Task.h
//  LightsOut
//
//  Created by Elijah Houle on 2/24/15.
//  Copyright (c) 2015 Elijah Houle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (strong, nonatomic) NSMutableArray* prerequisites; // tasks that this one depends on in order to queue
@property (nonatomic, assign) BOOL active; // is this the currently active task?
@property (nonatomic, assign) BOOL completed; // is this task completed?

-(id) initWithPrerequisites:(NSMutableArray*) tasks;
-(void) addPrerequisite:(Task*) task;
-(void) addPrerequisites:(NSMutableArray*) tasks;
-(BOOL) canStart; // check whether prereqs are done
-(void) startTask;
-(void) completeTask;

@end
