//
//  Trip.h
//  taximeter
//
//  Created by William Ching on 2018-12-02.
//  Copyright © 2018 William Ching. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Passenger.h"


@interface Trip : NSObject{
    
    double cost;
    double initialSpeed;
    Passenger *passenger;
}

-(id)initWithPassenger:(Passenger*)newPassenger;
-(void)setPassenger:(Passenger*)passenger;
-(Passenger*)getPassenger;
-(void)setCost;
-(double)getCost;
-(void)setInitialSpeed:(double)initSpeed;
-(double)getInitialSpeed;

@end

