//
//  FiltersViewController.m
//  Project Ignite 2017
//
//  Created by projectignite3 on 2/19/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import "FiltersViewController.h"

@interface FiltersViewController ()
{
    UIImage *originalImage;
}

@end

@implementation FiltersViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.ImageView.image = self.image;
}

- (IBAction)Filter1:(id)sender {
}

- (IBAction)Filter2:(id)sender {
}

- (IBAction)Filter3:(id)sender {
}
@end


