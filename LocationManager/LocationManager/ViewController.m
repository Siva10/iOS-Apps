//
//  ViewController.m
//  LocationManager
//
//  Created by student on 4/26/14.
//  Copyright (c) 2014 student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) updateLocation:(NSString*) locationDesc{
    NSMutableString *newMessage=[[NSMutableString alloc]initWithCapacity:100];
    [newMessage appendString:[NSString stringWithFormat:@"Update #:%i\n",noUpdates]];
    [newMessage appendString:locationDesc];
    [newMessage appendString:@"\n"];
    [newMessage appendString:[textView text]];
    textView.text=newMessage;
}
-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    noUpdates++;
    if (noUpdates>=50){
        [locationManager stopUpdatingLocation];
         textView.text=@"Location manager stop running.....";
    }

         CLLocation *lastLocation=[locations lastObject];
    [self updateLocation:[lastLocation description]];
    
         }

-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"Could not locate location: %@",error);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    locationManager=[[CLLocationManager alloc]init];
    [locationManager setDelegate:self];
    [locationManager startUpdatingLocation];
    textView.text=@"Location manager start running....";


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
