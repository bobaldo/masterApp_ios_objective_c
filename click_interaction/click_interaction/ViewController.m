//
//  ViewController.m
//  click_interaction
//
//  Created by System Administrator on 12/7/14.
//  Copyright (c) 2014 click_interaction. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController
- (IBAction)click:(id)sender {
    self.label.text = @"PD";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
