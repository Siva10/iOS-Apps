//
//  WebView.h
//  GoogleSearchJSON
//
//  Created by Ouh Eng Lieh on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SearchResults;
@interface GoogleResultWebViewController : UIViewController <UIWebViewDelegate> {
	UIWebView *webView;
}
@property(strong, nonatomic) IBOutlet UIWebView *webView;
@property(weak, nonatomic) SearchResults *searchResults;
@property(weak,nonatomic) IBOutlet UITextField *urlString;
@end
