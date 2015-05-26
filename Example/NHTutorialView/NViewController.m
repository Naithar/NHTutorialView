//
//  NViewController.m
//  NHTutorialView
//
//  Created by Naithar on 05/26/2015.
//  Copyright (c) 2014 Naithar. All rights reserved.
//

#import "NViewController.h"
@import NHTutorialView;

@interface NViewController ()

@end

@implementation NViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [[[NHTutorialView alloc] initWithFrame:CGRectMake(10, 10, 200, 100)] showAtPoint:CGPointMake(150, 400) animated:YES inView:self.view];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
