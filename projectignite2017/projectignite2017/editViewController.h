//
//  editViewController.h
//  projectignite2017
//
//  Created by Ashley Wong on 3/30/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"

@interface editViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UISlider *filterslider;
@property (strong, nonatomic) GPUImageOutput<GPUImageInput> *selectedFilter;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (strong, nonatomic) NSString *filter;
@property (strong,nonatomic) UIImage *image;
@property (strong, nonatomic) IBOutlet UIImageView *imagedisplay;
@property (strong, nonatomic) UIImage *currentImage;
@property (strong, nonatomic) UIImage *nofilterImage;

- (IBAction)reset:(id)sender;
- (IBAction)pressedBack:(id)sender;
// TO-DO: add properties (outlets) and actions appropriately
- (IBAction)pressedBrightness:(id)sender;
- (IBAction)pressedCartoon:(id)sender;
- (IBAction)pressedContrast:(id)sender;
- (IBAction)pressedCrop:(id)sender;
- (IBAction)pressedSaturation:(id)sender;
- (IBAction)pressedHue:(id)sender;
- (IBAction)pressedSlider:(id)sender;

@end
