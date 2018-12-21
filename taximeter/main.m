//
//  main.m
//  taximeter
//
//  Created by William Ching on 2018-11-29.
//  Copyright © 2018 William Ching. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Math.h"
#import "Taxi.h"
#import "Trip.h"
#import "Time.h"
#import "Passenger.h"


int mainMenu(){
    int userInput;
    printf("1. Pick up Passengers \n");
    printf("2. Fill up the gas tank \n");
    printf("3. Taximeter functions \n");
    printf("0. Exit \n");
    scanf("%d",&userInput);
    return userInput;
}

int taximeterFunctions(){
    int userInput;
    printf("1. Net Income \n");
    printf("2. Car's Fuel level \n");
    printf("3. Car's Mileage \n");
    printf("4. Total number of trips \n");
    printf("0. Exit \n");
    scanf("%d",&userInput);
    return userInput;
}

double dblFromUser(NSString *text){
    double userInput;
    printf("%s",[text UTF8String]);
    scanf("%lf",&userInput);
    return userInput;
}

void setTimesFromUser(NSString *text, Time *time){
    int hour;
    int minute;
    bool validInput = false;
    do {
        @try {
            printf("%s", [text UTF8String]);
            scanf("%dh%d",&hour,&minute);
            [time setHour:hour];
            [time setMinute:minute];
            validInput = true;
        } @catch (NSException *exception) {
            printf("Invalid Input\n");
        } @finally {
        }
        [time setHour:hour];
    } while (!validInput);    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        double currentFuel;
        printf("Hi, please enter you initial fuel level\n");
        scanf("%lf", &currentFuel);
        Taxi *taxi = [[Taxi alloc]initWithFuel:currentFuel];
        
        bool exit = true;
        
        do {
            int option = mainMenu();
            switch (option) {
                case 1:{
                    Time* star = [[Time alloc]init];
                    Time* end = [[Time alloc]init];
                    
                    Passenger *newPassenger = [[Passenger alloc]init];
                    
                    do {
                        // save the times in objects
                        setTimesFromUser(@"Please enter start time\n", star);
                        setTimesFromUser(@"Please enter finish time\n", end);
                        
                        // add time objects inside passenger
                        [newPassenger setStartTime:star];
                        [newPassenger setEndTime:end];
                        
                        //calculate the tripLength an add it to the 
                        [newPassenger setTripLength:[newPassenger tripCalculator:[newPassenger getStartTime] end:[newPassenger getEndTime]]];
                        
                        //** check if trip is greater than 12h
                    
                        if([newPassenger invalidTrip]){
                            printf("Invalid times, the trip exceed the maximun of 12 hours\n");
                        }
                    } while ([newPassenger invalidTrip]);
                    
                    // create a trip with a valid passenger
                    Trip *newTrip = [[Trip alloc]initWithPassenger:newPassenger];
                    
                    //ask initial speed to user
                    double speed = dblFromUser(@"Type the initial speed of the trip\n");
                    
                    //set trip initial speed
                    [newTrip setInitialSpeed:speed];
                    
                    //add trip to taximeter
                    [[taxi getTaximeter]setTrip:newTrip];
                    
                    //calculate fuel
                    [taxi fuelReduction];
                    
                    // check fuel to see if it can complete it
                    if([taxi fuelWarning]){
                        [newTrip setCost];
                        //calculate mileage and add it to the total mileage
                        [taxi mileageCalculation];
                        //add trip cost to balance
                        [[taxi getTaximeter]setBalance:[[taxi getTaximeter]getBalance] + [newTrip getCost]];
                    }else{
                        [taxi reFuel];
                        //remove trip from trip array
                        [[[taxi getTaximeter]getTrip] removeLastObject];
                    }
                }
                    break;
                case 2:{
                    [taxi reFuel];
                }
                    break;
                case 3:{
                    bool taxMeter = true;
                    printf("Taximeter functions\n");
                    do {
                        printf("Choose one of the following options\n");
                        int taxiOption = taximeterFunctions();
                        switch (taxiOption) {
                            case 1:
                                printf("Your net income is: %lf \n", [[taxi getTaximeter]getBalance]);
                                break;
                            case 2:
                                printf("Your fuel level is: %lf \n", [taxi getFuel]);
                                break;
                            case 3:
                                printf("Your total mileage is: %lf \n", [taxi getMileage]);
                                break;
                            case 4:
                                printf("The number of trip is: %lu \n", [[[taxi getTaximeter]getTrip]count]);
                                break;
                            case 0:
                                taxMeter = false;
                                break;
                            default:
                                printf("Option not available \n");
                                break;
                        }
                    } while(taxMeter);
                }
                    break;
                    
                case 0:{
                    exit = false;
                }
                    break;
                default:
                    printf("Option not available");
                    break;
            }// end of switch
        } while (exit);
        printf("Exit app");

    }
    return 0;
}
