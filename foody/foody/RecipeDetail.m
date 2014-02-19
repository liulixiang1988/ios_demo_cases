//
//  RecipeDetail.m
//  foody
//
//  Created by 刘理想 on 14-2-19.
//  Copyright (c) 2014年 liulixiang. All rights reserved.
//

#import "RecipeDetail.h"

@interface RecipeDetail ()

@end

@implementation RecipeDetail

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
