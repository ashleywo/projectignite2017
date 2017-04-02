//
//  filterViewController.m
//  Project Ignite 2017
//
//  Created by Bronwyn Thomas on 2/19/17.
//  Copyright © 2017 Bronwyn Thomas. All rights reserved.
//

#import "filterViewController.h"

@interface filterViewController ()

@end

@implementation filterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageVIewer.image = self.image;
     self.filterSlider.hidden = YES;
    self.currentImage = self.image;
    self.nofilterImage = self.image;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)adjustFilter:(id)sender {
    if ([self.filter isEqualToString:@"filter1"])
    {
     [(GPUImageBrightnessFilter *)self.selectedFilter setBrightness:[(UISlider *)sender value]];
    }
    else if ([self.filter isEqualToString:@"filter2"])
    {
     [(GPUImageSharpenFilter *)self.selectedFilter setSharpness:[(UISlider *)sender value]];
    }
    self.imageVIewer.image = [self.selectedFilter imageByFilteringImage:self.image];
    self.currentImage = self.imageVIewer.image;
}

- (IBAction)filter2:(id)sender {
    
    self.image = self.currentImage;
    
    self.filterSlider.hidden = NO;
    [self.filterSlider setValue:0.0];
    [self.filterSlider setMinimumValue:-4.0];
    [self.filterSlider setMaximumValue:4.0];
    
    self.filter = @"filter2";

    GPUImageFilter *selectedFilter = [[GPUImageSharpenFilter alloc] init];
    self.selectedFilter = selectedFilter;
    UIImage *filteredImage = [selectedFilter imageByFilteringImage:self.image];
    self.image = filteredImage;
    [self.imageVIewer setImage:self.image];

    
}

- (IBAction)filter1:(UIButton *)sender {
    
    self.image = self.currentImage;
    
    self.filterSlider.hidden = NO;
    [self.filterSlider setValue:0.0];
    [self.filterSlider setMinimumValue:-1.0];
    [self.filterSlider setMaximumValue:1.0];
    
    self.filter = @"filter1";
    
    GPUImageFilter *selectedFilter = [[GPUImageBrightnessFilter alloc] init];
    self.selectedFilter = selectedFilter;
    UIImage *filteredImage = [selectedFilter imageByFilteringImage:self.image];
    self.image = filteredImage;
    [self.imageVIewer setImage:self.image];
}

- (IBAction)resetFilters:(id)sender {
    self.filterSlider.hidden = YES;
    self.imageVIewer.image = self.nofilterImage;
    
    }

@end
