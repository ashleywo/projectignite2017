//
//  testViewController.h
//  Project Ignite 2017
//
//  Created by Ashley Wong on 2/12/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"

@interface testViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate>

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *filter;
@property (strong, nonatomic) GPUImageOutput<GPUImageInput> *selectedFilter;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UIImageView *selectedImageView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *filterButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cameraButton;
@property (weak, nonatomic) IBOutlet UISlider *filterSlider;

- (IBAction)pressedBack:(id)sender;
- (IBAction)photoFromAlbum;
- (IBAction)photoFromCamera;
- (IBAction)applyImageFilter:(id)sender;
- (IBAction)saveToAlbum:(id)sender;
- (IBAction)updateFilter:(id)sender;

@end
