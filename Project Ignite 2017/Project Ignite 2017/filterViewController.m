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
  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)filter1:(UIButton *)sender {
    
    GPUImageFilter *filter2 = [[GPUImagePosterizeFilter alloc] init];
    UIImage *filteredImage = [filter2 imageByFilteringImage:self.image];
    self.image = filteredImage;
    [self.imageVIewer setImage:self.image];
}

@end
