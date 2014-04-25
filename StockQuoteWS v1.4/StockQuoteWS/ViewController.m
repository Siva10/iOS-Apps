//
//  ViewController.m
//  StockQuoteWS
//
//  Created by Ouh Eng Lieh on 2/1/14.
//  Copyright (c) 2014 Ouh Eng LIeh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
bool dateFound;
bool priceFound;
NSURLConnection *conn;
}

@end



@implementation ViewController
@synthesize stockDate, stockLastPrice, stockSymbol, activityIndicatorView,buffer,parser;
- (IBAction) lookup {
    NSString *symbol=stockSymbol.text;
    NSString *soapRequest=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><GetQuote xmlns=\"http://www.webserviceX.NET/\"><symbol>%@</symbol></GetQuote></soap:Body></soap:Envelope>",symbol];
    
    NSLog(@"Soap Request :%@" ,soapRequest);
    
    NSURL *url=[NSURL URLWithString:@"http://www.webservicex.net/stockquote.asmx"];
    NSMutableURLRequest *req=[NSMutableURLRequest requestWithURL:url];
    [req addValue:@"text/xml;utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue:@"http://www.webservicex.net/stockquote.asmx/GetQuote" forHTTPHeaderField:@"SOAPAction"];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody:[soapRequest dataUsingEncoding:NSUTF8StringEncoding]];
    conn=[[NSURLConnection alloc] initWithRequest:req delegate:self];
    if(conn)
    {
        self.buffer=[NSMutableData data];
        [activityIndicatorView startAnimating];
    }
    
    
}
-(void) connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *) response {
	[buffer setLength:0];
}
-(void) connection:(NSURLConnection *) connection didReceiveData:(NSData *) data {
	[buffer appendData:data];
}
-(void) connection:(NSURLConnection *) connection didFailWithError:(NSError *) error {
	[activityIndicatorView stopAnimating];
}

-(void) connectionDidFinishLoading:(NSURLConnection *) connection {
	NSLog(@"Done with bytes %d", [buffer length]);
	[activityIndicatorView stopAnimating];
    
}

-(void) parser:(NSXMLParser *) parser didStartElement:(NSString *) elementName
  namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *) qName attributes:(NSDictionary *) attributeDict {
	if ([elementName isEqualToString:@"Date"]) {
		dateFound = YES;
	} else 	if ([elementName isEqualToString:@"Last"]) {
		priceFound = YES;
	}
}

- (void) parser:(NSXMLParser *) parser foundCharacters:(NSString *) string {
	if (dateFound) {
		stockDate.text = string;
		dateFound = NO;
	} else if (priceFound) {
		stockLastPrice.text = string;
		priceFound = NO;
	}
}

-(void) parser:(NSXMLParser *) parser didEndElement:(NSString *) elementName
  namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *) qName{
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
