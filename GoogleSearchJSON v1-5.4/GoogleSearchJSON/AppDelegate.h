//
//  AppDelegate.h
//  GoogleSearchJSON
//
//  Created by Ouh Eng Lieh on 2/1/14.
//  Copyright (c) 2014 Ouh Eng LIeh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SearchResults;
@interface AppDelegate : UIResponder <UIApplicationDelegate> 

@property (strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) SearchResults *searchResults;

-(void) switchWebView;
-(void) switchResultView;

@end
