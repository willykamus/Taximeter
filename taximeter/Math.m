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
//-(int)power:(int)base exponent:(int)exp;
double factorial(int num){
    double value = 1;
    for(int i=2; i<=num; i++ )
        value *= i;
    return value;
}
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

double cosine(double num){
    return 1/sine(num);
}
double tangent(double num){
//    double value;
//    double sen = 1/cosene(num);
//    value = sen/cosene(num);
    return sine(num)/cosine(num);
}

double absolute(double num){
    if(num<0){
        num *= -1;
    }
    return num;
}


//sine(double x){
//    double ret = 0.0;
//    for(int i = 1; i < 51; i+=2)
//        if(i % 4 == 1)
//            ret +=(pow(x,i))/(fact(i));
//    else if(i % 4 == 3)
//        ret -=(pow(x,i))/(fact(i));
//    return ret
//}

//int n, m;
//scanf("%dh%d", &h, &m)
