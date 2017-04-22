//
//  editViewController.m
//  projectignite2017
//
//  Created by Ashley Wong on 3/30/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import "editViewController.h"

@interface editViewController ()

@end

@implementation editViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TO-DO: set the image view to self.image here (i.e. self.photoImageView.image = self.image)
}

- (void)didReceiveMemoryWarning {
    [self didReceiveMemoryWarning];
}

// TO-DO: write filter functions

- (IBAction)pressedBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)pressedBrightness:(id)sender {
}

- (IBAction)pressedCartoon:(id)sender {
}

- (IBAction)pressedContrast:(id)sender {
}

- (IBAction)pressedCrop:(id)sender {
}

- (IBAction)pressedSaturation:(id)sender {
}

- (IBAction)pressedHue:(id)sender {
}

- (IBAction)pressedSlider:(id)sender {
}
@end
