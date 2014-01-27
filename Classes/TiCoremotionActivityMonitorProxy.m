/**
 * Copyright (c) 2014 by Ben Bahrenburg. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiCoremotionActivityMonitorProxy.h"

@implementation TiCoremotionActivityMonitorProxy

- (CMMotionActivityManager *)motionActivitiyManager
{
    if (_motionActivitiyManager == nil) {
        _motionActivitiyManager = [[CMMotionActivityManager alloc] init];
    }
    return _motionActivitiyManager;
}

- (void)startActivityMonitoring:(id)unused
{
    if ([CMMotionActivityManager isActivityAvailable]) {
        __weak __typeof(self) weakSelf = self;
        
        [self.motionActivitiyManager startActivityUpdatesToQueue:[NSOperationQueue mainQueue]
                                                     withHandler:^(CMMotionActivity *activity) {
                                                         NSLog(@"%s %@", __PRETTY_FUNCTION__, activity);
                                                         
                                                     }];
        
    }
}

- (void)stopUpdateActivityMonitoring:(id)unused
{
    [self.motionActivitiyManager stopActivityUpdates];
}


- (void)query:(id)args;
{
    ENSURE_UI_THREAD(query, args);
    
    ENSURE_SINGLE_ARG(args,NSDictionary);
    ENSURE_TYPE(args,NSDictionary);
    KrollCallback *callback = [args objectForKey:@"completed"];
    
    long long secondsFrom = [[args valueForKey:@"from"]longLongValue]/1000;
    NSDate *from = [NSDate dateWithTimeIntervalSince1970:secondsFrom];
    //NSLog(@"[DEBUG] somedate: %@", from);
    
    long long secondsTo = [[args valueForKey:@"to"]longLongValue]/1000;
    NSDate *to = [NSDate dateWithTimeIntervalSince1970:secondsTo];
    //NSLog(@"[DEBUG] somedate: %@", to);
    
    __weak __typeof(self) weakSelf = self;
    [self.motionActivitiyManager queryActivityStartingFromDate:from
                                                        toDate:to
                                                       toQueue:[NSOperationQueue mainQueue]
                                                   withHandler:^(NSArray *activities, NSError *error) {
                                                       if (error) {
                                                           
                                                       }else{
                                                           
                                                       }
                                                   }];
}


@end
