//
//  Time.h
//  taximeter
//
//  Created by William Ching on 2018-12-03.
//  Copyright © 2018 William Ching. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Time : NSObject{
    int hour;
    int minute;
}

-(void)setHour:(int)num;
-(void)setMinute:(int)num;
-(int)getHour;
-(int)getMinute;

@end
