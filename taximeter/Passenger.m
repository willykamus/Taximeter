//
//  Passenger.m
//  taximeter
//
//  Created by William Ching on 2018-12-02.
//  Copyright © 2018 William Ching. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Passenger.h"

@implementation Passenger

-(id)init{
    self = [super init];
    timeLimit = 60*12;
    return self;
}

-(void)setStartTime:(Time*)time{
    start = time;
}

-(void)setEndTime:(Time*)time{
    end = time;
}

-(Time*)getStartTime{
    return start;
}

-(Time*)getEndTime{
    return end;
}

-(void)setTripLength:(int)length{
    tripLength = length;
}

-(int)getTripLength{
    return tripLength;
}

-(int)tripCalculator:(Time*)start end:(Time*)end{
    
    double count = 0;
    double begin = [start getHour]*60 + [start getMinute];
    double finish = [end getHour ]*60 + [end getMinute];
    
    if(begin < finish){
        count = finish - begin;
    }else{
        count = (1440 - begin) + finish;
    }
    return count;
}

-(bool)invalidTrip{
    if((double)tripLength < 720){
        return false;
    }else{
        return true;
    }
}

@end
