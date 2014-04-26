//
//  DetailViewController.m
//  MasterDetail
//
//  Created by student on 4/20/14.
//  Copyright (c) 2014 student. All rights reserved.
//

#import "DetailViewController.h"
#import "Course.h"
@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController
@synthesize idField=_idField,descField=_descField,lecturerField=_lecturerField;
@synthesize editingCourse=_editingCourse;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [_idField setText:[_editingCourse courseId]];
    [_descField setText:[_editingCourse courseDesc]];
    [_lecturerField setText:[_editingCourse lecturer]];
    [[self navigationItem] setTitle:[editingCourse courseId]];
    
}

-(void) viewWillDisappear:(BOOL)animated{
    [idField resignFirstResponder];
    [descField resignFirstResponder];
    [lecturerField resignFirstResponder];
    
    [_editingCourse setCourseId:[_idField text]];
    [_editingCourse setCourseDesc:[_descField text]];
    [_editingCourse setLecturer:[_lecturerField text]];
    
}






@end
