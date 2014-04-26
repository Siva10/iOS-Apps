//
//  DetailViewController.h
//  MasterDetail
//
//  Created by student on 4/20/14.
//  Copyright (c) 2014 student. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Course;

@interface DetailViewController : UIViewController{
    IBOutlet UITextField *idField;
    IBOutlet UITextField *descField;
    IBOutlet UITextField *lecturerField;
    Course *editingCourse;
}

@property (strong, nonatomic) id detailItem;

@property(weak,nonatomic)IBOutlet UITextField *idField;
@property(weak,nonatomic)IBOutlet UITextField *descField;
@property(weak,nonatomic)IBOutlet UITextField *lecturerField;
@property(weak,nonatomic)Course *   editingCourse;





@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
