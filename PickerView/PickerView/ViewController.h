//
//  ViewController.h
//  PickerView
//
//  Created by student on 4/20/14.
//  Copyright (c) 2014 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

<UIPickerViewDataSource,UIPickerViewDelegate>{
    IBOutlet UITextField *courseTextField;
    NSMutableArray *courseList;
    NSDictionary *courseDict;
}
@end
