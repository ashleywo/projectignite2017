//
//  filterViewController.m
//  Project Ignite 2017
//
//  Created by ProjectIgnite2 on 2/19/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import "filterViewController.h"

@interface filterViewController ()

@end


@implementation filterViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.image != nil)
    {
        self.photoImageView.image = self.image;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)chooseFilter:(id)sender {
}

- (IBAction)choosePhoto:(id)sender {
}

@end
