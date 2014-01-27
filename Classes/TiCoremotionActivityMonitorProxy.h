/**
 * Copyright (c) 2014 by Ben Bahrenburg. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiProxy.h"
#import <CoreMotion/CoreMotion.h>
@interface TiCoremotionActivityMonitorProxy : TiProxy {

}
@property (nonatomic, strong) CMMotionActivityManager *motionActivitiyManager;
@end
