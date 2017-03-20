//
//  EditViewController.m
//  Project Ignite 2017
//
//  Created by HaNa Pohl-Cummings on 2/19/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.EditorImageView.image = self.Image;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)pressedSepia:(id)sender {
    GPUImageFilter *sepia = [[GPUImageSepiaFilter alloc] init];
    UIImage *filteredImage = [sepia imageByFilteringImage:self.Image];
    self.Image = filteredImage;
    [self.EditorImageView setImage:self.Image];
}

- (IBAction)pressedCustom:(id)sender {
}

@end
