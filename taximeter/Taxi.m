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
    //NSLog(@"%lf",mileages);
}
-(void)fuelReduction{
    Trip *lastTrip = [[taximeter getTrip]lastObject];
    fuel = fuel - ((lastTrip.getPassenger.getTripLength/60.0)*absolute(tangent(lastTrip.getInitialSpeed) * (lastTrip.getPassenger.getTripLength/60.0)) + absolute(cosine(lastTrip.getInitialSpeed)));
}
-(bool)fuelWarning{
    if(fuel <= 0){
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
@end
