//
//  filterViewController.h
//  Project Ignite 2017
//
//  Created by Bronwyn Thomas on 2/19/17.
//  Copyright © 2017 Bronwyn Thomas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"
@interface filterViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) GPUImageOutput<GPUImageInput> *selectedFilter;
@property (weak, nonatomic) IBOutlet UISlider *filterSlider;
@property (strong, nonatomic) NSString *filter;
@property (strong,nonatomic) UIImage *image;
@property (strong, nonatomic) UIImage *currentImage;
@property (strong, nonatomic) UIImage *nofilterImage;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet UIImageView *imageVIewer;

- (IBAction)adjustFilter:(id)sender;
- (IBAction)filter2:(id)sender;

- (IBAction)filter1:(id)sender;
- (IBAction)resetFilters:(id)sender;

@end




