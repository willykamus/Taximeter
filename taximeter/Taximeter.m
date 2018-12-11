//
//  Taxi.m
//  taximeter
//
//  Created by William Ching on 2018-12-01.
//  Copyright © 2018 William Ching. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Taximeter.h"
#import "Math.h"
#import "Trip.h"

@implementation Taximeter

-(id)init{
    self = [super init];
    trips = [[NSMutableArray alloc]init];
    return self;
}

-(void)setBalance:(double)money{
    balance = money;
}
-(void)setTrip:(Trip*)passengerTrip;{
    [trips addObject:passengerTrip];
}
-(double)getBalance{
    return balance;
}
-(NSMutableArray*)getTrip{
    return trips;
}






//-(void)setBalance:(double)money{
//    balance = money;
//}
//-(double)getBalance{
//    return balance;
//}
//-(NSMutableArray*)getTrips{
//    return trips;
//}
//-(void)addTrip:(Trip*)trip{
//    [trips addObject:trip];
//}
//
//-(void)addFuel:(int)liters{
//    self.fuel +=liters;
//}
//-(void)fuelReduction:(double)initialVelocity duration:(int)hours{
//    fuel = fuel - (hours * absolute(tangent(initialVelocity*hours)) + absolute(cosene(initialVelocity)));
//}
//-(void)increaseMillage:(double)initialVelocity duration:(int)hours{
//
//    self.mileage = self.mileage + power(initialVelocity,hours*2) - (initialVelocity*hours);
//
//}

//-(void)fuelWarning{
//    if(fuel <= 0){
//        NSLog(@"Warning, you run out of fuel");
//        balance = balance - fuelFee;
//    }else{
//        NSLog(@"Remaining fuel: %f", fuel);
//    }
//}

@end

