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
    if ([self.filter isEqualToString:@"brightness"])
    {
        [(GPUImageBrightnessFilter *)self.selectedFilter setBrightness:[(UISlider *)sender value]];
    } else if ([self.filter isEqualToString:@"saturation"])
    {
        [(GPUImageSaturationFilter *)self.selectedFilter setSaturation:[(UISlider *)sender value]];
    }

    self.imagedisplay.image = [self.selectedFilter imageByFilteringImage:self.image];
    self.currentImage = self.imagedisplay.image;

}
- (IBAction)pressedSaturation:(id)sender {
    self.image = self.currentImage;
    
    self.filterslider.hidden = NO;
    [self.filterslider setValue:0.0];
    [self.filterslider setMinimumValue:0.0];
    [self.filterslider setMaximumValue:2.0];
    
    self.filter = @"saturation";
    
    GPUImageFilter *selectedFilter = [[GPUImageSaturationFilter alloc] init];
    self.selectedFilter = selectedFilter;
    UIImage *filteredImage = [selectedFilter imageByFilteringImage:self.image];
    self.image = filteredImage;
    [self.imagedisplay setImage:self.image];
    
    
}
- (IBAction)pressedContrast:(id)sender {
    
}
- (IBAction)pressedCrop:(id)sender {
    
}
- (IBAction)pressedCartoon:(id)sender {
    
}
- (IBAction)pressedBrightness:(id)sender {
    self.image = self.currentImage;
    
    self.filterslider.hidden = NO;
    [self.filterslider setValue:0.0];
    [self.filterslider setMinimumValue:-1.0];
    [self.filterslider setMaximumValue:1.0];
    
    self.filter = @"brightness";
    
    GPUImageFilter *selectedFilter = [[GPUImageBrightnessFilter alloc] init];
    self.selectedFilter = selectedFilter;
    UIImage *filteredImage = [selectedFilter imageByFilteringImage:self.image];
    self.image = filteredImage;
    [self.imagedisplay setImage:self.image];
    
}
- (IBAction)pressedHue:(id)sender {
    
}

- (IBAction)pressedBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
