//
//  Passenger.h
//  taximeter
//
//  Created by William Ching on 2018-12-02.
//  Copyright © 2018 William Ching. All rights reserved.
//

#ifndef Passenger_h
#define Passenger_h
#import "Time.h"

@interface Passenger : NSObject{
    Time *start;
    Time *end;
    int timeLimit;
    int tripLength; // express in minutes
}

-(void)setStartTime:(Time*)time;
-(void)setEndTime:(Time*)time;
-(Time*)getStartTime;
-(Time*)getEndTime;
-(void)setTripLength:(int)length;
-(int)getTripLength;
-(int)tripCalculator:(Time*)start end:(Time*)end;
-(bool)invalidTrip;

@end

#endif /* Passenger_h */
