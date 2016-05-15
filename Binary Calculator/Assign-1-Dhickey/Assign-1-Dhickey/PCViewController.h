//
//  PCViewController.h
//  Assign-1-Dhickey
//
//  Created by Daniel Hickey on 13/10/2013.
//  Copyright (c) 2013 Daniel Hickey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCCalculator.h"
#import <AVFoundation/AVFoundation.h>



@interface PCViewController : UIViewController <AVAudioPlayerDelegate>
{
    PCCalculator *calculator;   
}

- (IBAction)press:(id)sender;

- (IBAction)basePress:(id)sender;



@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *baseButtons;

@property (retain, nonatomic) IBOutlet UITextField *displayField;
@property (retain, nonatomic) IBOutlet UITextField *displayOct;
@property (retain, nonatomic) IBOutlet UITextField *displayBin;
@property (retain, nonatomic) IBOutlet UITextField *displayHex;

@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *binaryButtons;
@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *octalButtons;
@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *decimalButtons;
@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *hexButtons;


@end


