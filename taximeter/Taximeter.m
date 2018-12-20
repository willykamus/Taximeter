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

@end

