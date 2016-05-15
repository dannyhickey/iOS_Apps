//
//  PCCalculator.m
//  Assign-1-Dhickey
//
//  Created by Daniel Hickey on 13/10/2013.
//  Copyright (c) 2013 Daniel Hickey. All rights reserved.
//

#import "PCCalculator.h"

const NSString *numbers = @"0123456789ABCDEF";
//const NSString *oct = @"01234567";
//const NSString *bin = @"01";
const NSString *clear = @"Clear";
const NSString *delete = @"<-";

@implementation PCCalculator

- (id)init
{
    self = [super init];
    if (self) {
        _display = [[NSMutableString stringWithCapacity:32] retain];
        _operator = nil;
    }
    return self;
}

- (void)dealloc
{
    [_display release];
    [_operator release];
    [super dealloc];
}

-(void) input: (NSString *) character
{
    if ([numbers rangeOfString:character].length)
    {        
        [_display appendString:character];
    }
   else if([character isEqualToString:(NSString *)delete]){
        NSInteger index_of_char_to_remove = [_display length]-1;
        if(index_of_char_to_remove >= 0){
            [_display deleteCharactersInRange:NSMakeRange(index_of_char_to_remove,1)];//removes one character
            }
    }
    else if([character isEqualToString:(NSString *)clear]){
        if([_display length]){
            [_display setString:[NSString string]]; // returns an empty string
        }        
    }
}

-(NSString *)displayValue//show decimal value
{
    if([_display length]){
        NSString * output = [self decimal:base n:_display];
        return output;
    }
    else
        return @"0";
}


-(NSString *)binary:(int)number // converts decimal to binary
{
    if(number > 0){
        int n = log(number)/log(2)+1;          //Figure out the maximum power of 2 required
        NSString *result = @"";             //Start with empty string
        for (int j=n; j>=0; j--)            //Iterate through power of 2
        {
            long long power = powl(2,j);
            if (power <= number)          //If the number is greater than current power of 2
            {
                number -= power;                                  //Subtract the power of 2
                result = [result stringByAppendingString:@"1"]; //Add a 1 to result string
            }
            else result = [result stringByAppendingString:@"0"]; //Otherwise add a 0
        }
        return result;
    }
    else
        return @"0";
}
 

-(int)getBase{
    return base;
}

-(void)setBase:(int)b
{
    base = b;
}

/*
-(NSString *)hexadecimal//convert decimal to hex
{
    if([_display length]){
        long number = [[self displayValue]doubleValue];
        NSString *decimal = [[NSNumber numberWithDouble:number]stringValue];
        NSString *hexadecimal =[NSString stringWithFormat:@"%lX",(long)[decimal integerValue]];
        return hexadecimal;
    }
    else
        return @"0";
}

-(NSString *)octal //convert decimal to octal
{
    if([_display length]){
        long number = [[self displayValue]doubleValue];
        NSString *decimal = [[NSNumber numberWithDouble:number]stringValue];
        NSString *octal =[NSString stringWithFormat:@"%lO",(long)[decimal integerValue]];
        return octal;
    }
    else
        return @"0";
}
 */

-(NSString *) decimal:(int)b n:(NSString *)n //uses number base and the string
{
    const char *number = [n cStringUsingEncoding:NSASCIIStringEncoding];
    long long convert;
    
    switch (b) {
        case 0:
            convert = [n longLongValue];
            break;
        case 1:
            convert =  strtoll(number, NULL, 8);            
            break;
        case 2:
            convert =  strtoll(number, NULL, 2);
            break;
        case 3:
            convert =  strtoll(number, NULL, 16);
            break;        
    }
    
    if (convert > NUMBERMAX)
    {
        convert = NUMBERMAX;
    }
    return [NSString stringWithFormat:@"%lld", convert];
}

- (void) clear {
     [_display setString:[NSString string]];
}

@end
