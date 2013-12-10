//
//  LLXViewController.m
//  AFNetworkingDemo
//
//  Created by 刘理想 on 13-12-10.
//  Copyright (c) 2013年 刘理想. All rights reserved.
//

#import "LLXViewController.h"
#import "AFApiClient.h"

static int i = 0;

@interface LLXViewController ()

@end

@implementation LLXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[AFApiClient sharedClient] setToken:@"Hello"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    [[AFApiClient sharedClient] GET:@"get"
                         parameters:nil
                            success:^(NSURLSessionDataTask *task, id responseObject) {
                                NSLog(@"request header: %@", [[[AFApiClient sharedClient] requestSerializer] HTTPRequestHeaders]);
                                NSLog(@"response: %@", responseObject);
                                NSString *token = [responseObject valueForKeyPath:@"headers.Token"];
                                NSLog(@"token:%@", token);
                                NSString *newToken = [NSString stringWithFormat:@"token-%d", i];
                                [[AFApiClient sharedClient] setToken: newToken];
                            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                NSLog(@"error: %@", error);
                            }];
}
@end
