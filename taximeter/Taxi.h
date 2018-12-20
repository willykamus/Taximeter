//
//  Taxi.h
//  taximeter
//
//  Created by William Ching on 2018-12-06.
//  Copyright © 2018 William Ching. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Passenger.h"
#import "Taximeter.h"
#import "Math.h"
NS_ASSUME_NONNULL_BEGIN

@interface Taxi : NSObject{
    double fuel;
    double mileages;
    Taximeter* taximeter;
}
-(id)initWithFuel:(double)initFuel;
-(void)setFuel:(double)litres;
-(double)getFuel;
-(void)setMileage:(double)mileage;
-(double)getMileage;
-(void)mileageCalculation;
-(void)fuelReduction;
-(bool)fuelWarning;
-(void)setTaximeter:(Taximeter*)taximtr;
-(Taximeter*)getTaximeter;
-(void)reFuel;
@end

NS_ASSUME_NONNULL_END
