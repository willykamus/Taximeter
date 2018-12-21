//
//  Math.m
//  taximeter
//
//  Created by William Ching on 2018-12-01.
//  Copyright © 2018 William Ching. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Math.h"

double power(double base,int exp){
    double value = 1;
    for(int i = exp; i > 0; i--){
        value *= base;
    }
    return value;
}

double factorial(int num){
    double value = 1;
    for(int i=2; i<=num; i++ )
        value *= i;
    return value;
}
// Even thought it is the formula, I could not make ir work for number larger than 20
double sine(double num){
    double value = 0.0;
    for(int i = 1; i < 51; i+=2){
        if(i % 4 == 1)
            value +=(power(num, i))/(factorial(i));
        else if(i % 4 == 3)
            value -=(power(num, i))/(factorial(i));
    }
    return value;
}
// Even thought it is the formula, I could not make ir work for number larger than 20
double cosine(double num){
    double value = 1.0;
    for(int i = 2; i < 52; i+=2){
        if(i % 4 == 0)
            value +=(power(num, i))/(factorial(i));
        else if(i % 4 == 2)
            value -=(power(num, i))/(factorial(i));
    }
    printf("%lf\n",value);
    return value;
}
double tangent(double num){
    return sine(num)/cosine(num);
}

double absolute(double num){
    if(num<0){
        num *= -1;
    }
    return num;
}

float randomNumber(float top , float bottom){
    srand((unsigned int) time(0));
    int num = rand();
    float number =  fmod((bottom+num), top-bottom) + bottom;
    return number;
}
