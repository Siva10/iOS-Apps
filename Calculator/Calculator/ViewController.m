//
//  ViewController.m
//  Calculator
//
//  Created by student on 4/19/14.
//  Copyright (c) 2014 student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction) sliderNumberOfYearsChanged:(id)sender{
    int myNewValue=sliderNumberOfYear.value;
    textFieldNumberOfYears.text=[NSString stringWithFormat:@"%d",myNewValue];
     [self displayAmount];
}

-(IBAction) sliderInterestRateChanged:(id)sender{
    float myNewValue=sliderInterestRate.value;
    textFieldInterestRate.text=[NSString stringWithFormat:@"%0.02f",myNewValue];
    [self displayAmount];
}

-(IBAction) displayAmount{
    float principalAmount=textFieldPrincipal.text.floatValue;
    int numberOfYear=textFieldNumberOfYears.text.intValue;
    float interestRate=textFieldInterestRate.text.floatValue/100;
    float finalAmount=principalAmount*pow((1+interestRate),numberOfYear);
    NSLog(@"%0.02f",finalAmount);
    labelAmount.text=[NSString stringWithFormat:@"%0.02f",finalAmount];
    [textFieldPrincipal resignFirstResponder];
  //  textFieldPrincipal.resignFirstResponder;
    textFieldPrincipal.delegate=self;
    textFieldInterestRate.delegate=self;
    textFieldNumberOfYears.delegate=self;

    
}

-(void) textFieldDidEndEditing:(UITextField *)myTextField{
    [self displayAmount];
}



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

@end
