//
//  ViewController.m
//  PickerView
//
//  Created by student on 4/20/14.
//  Copyright (c) 2014 student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    courseDict=[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Object Oriented Analysis and design", @"OOAD",@"Certified Scrum Master",@"CSCRUM",@"Enterprise JAVA",@"JAVA EE",
                @"Project Management",@"PMIS",Nil];

    courseList=[[courseDict allKeys]mutableCopy];
    UIPickerView *pickerView=[[UIPickerView alloc]init];
    pickerView.dataSource=self;
    pickerView.delegate=self;
    [pickerView setBackgroundColor:[UIColor grayColor]];
    courseTextField.inputView=pickerView;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView{
    return 1;
}


-(NSInteger) pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component{
    return [courseList count];
}

-(NSString *) pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [courseList objectAtIndex:row];
}
-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    courseTextField.text=[courseList objectAtIndex:row];
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
