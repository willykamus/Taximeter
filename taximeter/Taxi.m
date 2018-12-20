//
//  Taxi.m
//  taximeter
//
//  Created by William Ching on 2018-12-06.
//  Copyright © 2018 William Ching. All rights reserved.
//

#import "Taxi.h"

@implementation Taxi
-(id)initWithFuel:(double)initFuel{
    self = [super init];
    fuel = initFuel;
    taximeter = [[Taximeter alloc]init];
    return self;
}
-(void)setFuel:(double)litres{
    fuel = litres;
}
-(double)getFuel{
    return fuel;
}
-(void)setMileage:(double)mileage{
    mileages = mileage;
}
-(double)getMileage{
    return mileages;
}
-(void)mileageCalculation{
    Trip *lastTrip = [[taximeter getTrip]lastObject];
    mileages = mileages + power([lastTrip getInitialSpeed],2*([[lastTrip getPassenger]getTripLength]/60.0)) - (lastTrip.getInitialSpeed*([[lastTrip getPassenger]getTripLength]/60.0));
}
-(void)fuelReduction{
    Trip *lastTrip = [[taximeter getTrip]lastObject];
    fuel = fuel - (([[lastTrip getPassenger]getTripLength]/60.0)*absolute(tangent([lastTrip getInitialSpeed]) * ([[lastTrip getPassenger]getTripLength]/60.0)) + absolute(cosine([lastTrip getInitialSpeed])));
    if(fuel < 0){
        fuel = 0;
    }
}
-(bool)fuelWarning{
    if(fuel == 0){
        printf("Warning, you will run out of fuel during the trip\n");
        [taximeter setBalance:[taximeter getBalance] - 100];
        return false;
    }else{
        return true;
    }
}
-(void)setTaximeter:(Taximeter*)taximtr{
    taximeter = taximtr;
}
-(Taximeter*)getTaximeter{
    return taximeter;
}

-(void)reFuel{
    double litres;
    printf("Please insert the amount to refuel\n");
    scanf("%lf",&litres);
    float price = randomNumber(1.45, 1.15);
    printf("Your fare at this time is: %f per litre\n", price);
    if([[self getTaximeter]getBalance] < litres*price){
        printf("Not enough funds for this operation\n");
    }else{
        [self setFuel:[self getFuel] + litres];
        [[self getTaximeter]setBalance: [[self getTaximeter]getBalance] - litres*price];
    }
}
@end
