//
//  PCCalculator.h
//  Assign-1-Dhickey
//
//  Created by Daniel Hickey on 13/10/2013.
//  Copyright (c) 2013 Daniel Hickey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCCalculator : NSObject{
    int base;
}


@property (retain) NSMutableString *display;
@property (retain) NSString *operator;
//@property double operand;

-(void) clear;
-(int) getBase;
-(void) setBase: (int) b;
-(void) input: (NSString *) character;
-(NSString *) displayValue;
//-(NSString *) hexadecimal;
//-(NSString *) octal;
-(NSString *) binary: (int) number;
-(NSString *) decimal: (int) b n:(NSString *)n;

#define NUMBERMAX 2147483647

@end