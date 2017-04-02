//
//  editViewController.h
//  projectignite2017
//
//  Created by Ashley Wong on 3/30/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"

@interface editViewController : UIViewController <UINavigationControllerDelegate>

@property (strong, nonatomic) UIImage *image;
@property (weak, nonatomic) IBOutlet UIButton *Brightness;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UIButton *Cartoon;
@property (weak, nonatomic) IBOutlet UIButton *Contrast;
@property (weak, nonatomic) IBOutlet UIButton *Crop;
@property (weak, nonatomic) IBOutlet UIButton *Saturation;
@property (weak, nonatomic) IBOutlet UIButton *Hue;
@property (weak, nonatomic) IBOutlet UISlider *Slider;
@property (weak, nonatomic) IBOutlet UIScrollView *filterScroll;


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
