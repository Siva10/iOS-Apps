//
//  FirstViewController.h
//  GoogleSearchJSON
//
//  Created by Ouh Eng Lieh on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SearchResults;
@interface GoogleSearchViewController : UIViewController <NSURLSessionDataDelegate>{
	UITextField *searchString;
	UIActivityIndicatorView *activityIndicatorView;
    NSMutableData *buffer;
	NSURLConnection *conn;
}
@property(strong, nonatomic) IBOutlet UITextField *searchString;
@property(strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property(strong, nonatomic) NSMutableData *buffer;
@property(weak, nonatomic) SearchResults *searchResults;
- (IBAction) search;
- (void) processResponse:(NSMutableData *) data;

@end
