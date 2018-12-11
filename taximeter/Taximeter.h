//
//  Taxi.h
//  taximeter
//
//  Created by William Ching on 2018-12-01.
//  Copyright © 2018 William Ching. All rights reserved.
//

#ifndef Taxi_h
#define Taxi_h
#import "Trip.h"
#import "Passenger.h"

@interface Taximeter : NSObject{
    double balance;
    NSMutableArray *trips;
}

-(void)setBalance:(double)money;
-(double)getBalance;
-(NSMutableArray *)getTrip;
-(void)setTrip:(Trip*)passengerTrip;

@end

#endif /* Taxi_h */
