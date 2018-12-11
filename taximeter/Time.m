//
//  Time.m
//  taximeter
//
//  Created by William Ching on 2018-12-03.
//  Copyright © 2018 William Ching. All rights reserved.
//

#import "Time.h"

@implementation Time

-(void)setHour:(int)num{
    hour = num;
}
-(void)setMinute:(int)num{
    minute = num;
}
-(int)getHour{
    return hour;
}
-(int)getMinute{
    return minute;
}

@end
