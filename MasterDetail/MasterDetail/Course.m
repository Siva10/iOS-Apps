//
//  Course.m
//  MasterDetail
//
//  Created by student on 4/20/14.
//  Copyright (c) 2014 student. All rights reserved.
//

#import "Course.h"

@implementation Course

@synthesize courseId,courseDesc,lecturer;

+(NSMutableArray *) getExistingCourses{
    NSMutableArray *courses=[[NSMutableArray alloc]init];
    [courses addObject:[[Course alloc]initWithId:@"S-OOAD"]];
    [courses addObject:[[Course alloc]initWithId:@"S-PMIS"]];
    [courses addObject:[[Course alloc]initWithId:@"S-JAVA EE"]];
    [courses addObject:[[Course alloc]initWithId:@"S-CSCRUM"]];

    return courses;
}

-(id) initWithId:(NSString *)myId{
    self=[super init];
    if(self){
        self.courseId=myId;
        return self;
    }
    return self;
}


@end
