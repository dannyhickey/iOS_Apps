//
//  PCViewController.m
//  Assign-1-Dhickey
//
//  Created by Daniel Hickey on 13/10/2013.
//  Copyright (c) 2013 Daniel Hickey. All rights reserved.
//

#import "PCViewController.h"

@interface PCViewController ()

@end

@implementation PCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)press:(id)sender {
    NSString *p = [[NSBundle mainBundle]pathForResource:@"beep-30" ofType:@"mp3"];
    AVAudioPlayer *theAudio = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:p]error:NULL];
    [theAudio play];//plays the sound of the buttons
    
    [calculator input:[sender titleForState:UIControlStateNormal]];
    int number = [[calculator displayValue]intValue];
    if (number > NUMBERMAX)//max number you can have
        number = NUMBERMAX;
    
    
    [_displayField setText:[NSString stringWithFormat:@"%i", number]];
      
    [_displayBin setText:[calculator binary:number]];
    
    NSString *stringHex = [NSString stringWithFormat:@"%x",number];
    [_displayHex setText:stringHex];
    
    NSString *stringOct = [NSString stringWithFormat:@"%o",number];
     [_displayOct setText:stringOct];
    
}
- (void)dealloc {
    [_displayField release];
    [calculator release];
    [_displayOct release];
    [_displayBin release];
    [_displayHex release];
    [_baseButtons release];
    [_binaryButtons release];
    [_octalButtons release];
    [_decimalButtons release];
    [_hexButtons release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setDisplayField:nil];
    [self setDisplayOct:nil];
    [self setDisplayBin:nil];
    [self setDisplayHex:nil];
    [self setBaseButtons:nil];
    [self setBinaryButtons:nil];
    [self setOctalButtons:nil];
    [self setDecimalButtons:nil];
    [self setHexButtons:nil];
    [super viewDidUnload];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        calculator = [[PCCalculator alloc] init];
    }
    return self;
}
- (IBAction)basePress:(id)sender {
    NSString *p = [[NSBundle mainBundle]pathForResource:@"beep-30" ofType:@"mp3"];
    AVAudioPlayer *theAudio = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:p]error:NULL];
    [theAudio play];//plays sound with base button press
    
     
    int tag = [sender tag];
    [calculator setBase:tag];
    if (tag == 0)
    {
        for (UIButton *b in _hexButtons)
            [b setHidden:YES];
        for (UIButton *b in _decimalButtons)
            [b setHidden:NO];
    }
    
    if (tag == 1)
    {
        for (UIButton *b in _hexButtons)
            [b setHidden:YES];
        for (UIButton *b in _octalButtons)
            [b setHidden:NO];
    }
    if (tag == 2)
    {
        for (UIButton *b in _hexButtons)
            [b setHidden:YES];
        for (UIButton *b in _binaryButtons)
            [b setHidden:NO];
    }
    if (tag == 3)
    {
        for (UIButton *b in _hexButtons)
            [b setHidden:NO];        
    }
    [calculator clear];
   

}
@end
