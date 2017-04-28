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
    
    self.imagedisplay.image = self.image;
    self.filterslider.hidden = YES;
    self.currentImage = self.image;
    self.nofilterImage = self.image;
}

- (void)didReceiveMemoryWarning {
    [self didReceiveMemoryWarning];
}

// TO-DO: write filter functions
- (IBAction)pressedSlider:(id)sender {
 
}
- (IBAction)pressedSaturation:(id)sender {
    
}
- (IBAction)pressedContrast:(id)sender {
    
}
- (IBAction)pressedCrop:(id)sender {
    
}
- (IBAction)pressedCartoon:(id)sender {
    
}
- (IBAction)pressedBrightness:(id)sender {
    
}
- (IBAction)pressedHue:(id)sender {
    
}

- (IBAction)pressedBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
