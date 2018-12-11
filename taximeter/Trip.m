//
//  Trip.m
//  taximeter
//
//  Created by William Ching on 2018-12-02.
//  Copyright © 2018 William Ching. All rights reserved.
//

#import "Trip.h"
#import "Passenger.h"

@implementation Trip

-(id)initWithPassenger:(Passenger*)newPassenger{
    self = [super init];
    passenger = newPassenger;
    return self;
}

-(void)setPassenger:(Passenger*)newPassenger{
    passenger = newPassenger;
}
-(Passenger*)getPassenger{
    return passenger;
}

-(void)setCost{
    int end = passenger.getEndTime.getHour*60 + passenger.getEndTime.getMinute;
    int start = passenger.getStartTime.getHour*60 + passenger.getStartTime.getMinute;
    for(int i = start; i < end ; i++){
        if(i >= 0 && i < 480){
            cost = cost + 30.0/60.0;
        }
        if(i >= 480 && i < 840){
            cost = cost + 20.0/60.0;
        }
        if(i >= 840 && i < 1440){
            cost = cost + 25.0/60.0;
        }
        if(i == 1440)
            i=0;
    }
}
-(double)getCost{
    return cost;
}
-(void)setInitialSpeed:(double)initSpeed{
    initialSpeed = initSpeed;
}
-(double)getInitialSpeed{
    return initialSpeed;
}

@end
