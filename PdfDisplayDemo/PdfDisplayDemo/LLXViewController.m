//
//  LLXViewController.m
//  PdfDisplayDemo
//
//  Created by 刘理想 on 14-1-28.
//  Copyright (c) 2014年 刘理想. All rights reserved.
//

#import "LLXViewController.h"

@interface LLXViewController ()

@end

@implementation LLXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.webView.autoresizesSubviews = YES;
    //self.webView.autoresizingMask=(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AFNetworking_2.0_-_CocoaHeads_Raleigh___Durham" ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
