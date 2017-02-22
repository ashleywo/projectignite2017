//
//  testViewController.m
//  Project Ignite 2017
//
//  Created by Ashley Wong on 2/12/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()
{
    UIImage *originalImage;
}

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc]initWithTitle:@"Error"
                                                             message:@"Device has no camera."
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles: nil];
        self.cameraButton.enabled = NO;
        [myAlertView show];
    }
    self.filterSlider.hidden = YES;
    if (self.image != nil)
    {
        self.selectedImageView.image = self.image;
        originalImage = self.image;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressedBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)photoFromAlbum {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)photoFromCamera {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}
- (IBAction)applyImageFilter:(id)sender {
    UIActionSheet *filterActionSheet = [[UIActionSheet alloc] initWithTitle:@"Select Filter"
                                                                   delegate:self
                                                          cancelButtonTitle:@"Cancel"
                                                     destructiveButtonTitle:nil
                                                          otherButtonTitles:@"Grayscale", @"Sepia", @"Sketch", @"Pixelate", @"Color Invert", @"Toon", @"Pinch Distort", @"Brightness", @"Exposure", @"Contrast", @"Saturation", @"RGB", @"None", nil];
    [filterActionSheet showFromBarButtonItem:sender animated:YES];
}

- (IBAction)saveToAlbum:(id)sender {
    if (self.image != nil)
    {
        UIImageWriteToSavedPhotosAlbum(self.image, nil, nil, nil);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!"
                                                        message:@"Saved to camera roll."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"No picture available."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)updateFilter:(id)sender {
    if ([self.filter isEqualToString:@"sepia"])
    {
        [(GPUImageSepiaFilter *)self.selectedFilter setIntensity:[(UISlider *)sender value]];
    }
    else if ([self.filter isEqualToString:@"sketch"])
    {
        [(GPUImageSketchFilter *)self.selectedFilter setEdgeStrength:[(UISlider *)sender value]];
    }
    else if ([self.filter isEqualToString:@"pixelate"])
    {
        [(GPUImagePixellateFilter *)self.selectedFilter setFractionalWidthOfAPixel:[(UISlider *)sender value]];
    }
    else if ([self.filter isEqualToString:@"pinchdistortion"])
    {
        [(GPUImagePinchDistortionFilter *)self.selectedFilter setScale:[(UISlider *)sender value]];
    }
    else if ([self.filter isEqualToString:@"brightness"])
    {
        [(GPUImageBrightnessFilter *)self.selectedFilter setBrightness:[(UISlider *)sender value]];
    }
    else if ([self.filter isEqualToString:@"exposure"])
    {
        [(GPUImageExposureFilter *)self.selectedFilter setExposure:[(UISlider *)sender value]];
    }
    else if ([self.filter isEqualToString:@"contrast"])
    {
        [(GPUImageContrastFilter *)self.selectedFilter setContrast:[(UISlider *)sender value]];
    }
    else if ([self.filter isEqualToString:@"saturation"])
    {
        [(GPUImageSaturationFilter *)self.selectedFilter setSaturation:[(UISlider *)sender value]];
    }
    else
    {
        [(GPUImageRGBFilter *)self.selectedFilter setGreen:[(UISlider *)sender value]];
    }
    self.selectedImageView.image = [self.selectedFilter imageByFilteringImage:originalImage];
}


#pragma Image Picker Controller Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    self.saveButton.enabled = YES;
    self.filterButton.enabled = YES;
    
    originalImage = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [self.selectedImageView setImage:originalImage];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

#pragma Action Sheet Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    GPUImageFilter *selectedFilter;
    
    switch (buttonIndex) {
        case 0:
            selectedFilter = [[GPUImageGrayscaleFilter alloc] init];
            self.filterSlider.hidden = YES;
            self.filter = @"grayscale";
            break;
        case 1:
            selectedFilter = [[GPUImageSepiaFilter alloc] init];
            self.filterSlider.hidden = NO;
            
            [self.filterSlider setValue:1.0];
            [self.filterSlider setMinimumValue:0.0];
            [self.filterSlider setMaximumValue:1.0];
            self.filter = @"sepia";
            break;
        case 2:
            selectedFilter = [[GPUImageSketchFilter alloc] init];
            self.filterSlider.hidden = NO;
            
            [self.filterSlider setMinimumValue:0.0];
            [self.filterSlider setMaximumValue:1.0];
            [self.filterSlider setValue:0.25];
            self.filter = @"sketch";
            break;
        case 3:
            selectedFilter = [[GPUImagePixellateFilter alloc] init];
            self.filterSlider.hidden = NO;
            
            [self.filterSlider setValue:0.05];
            [self.filterSlider setMinimumValue:0.0];
            [self.filterSlider setMaximumValue:0.3];
            self.filter = @"pixelate";
            break;
        case 4:
            selectedFilter = [[GPUImageColorInvertFilter alloc] init];
            self.filterSlider.hidden = YES;
            self.filter = @"colorinvert";
            break;
        case 5:
            selectedFilter = [[GPUImageToonFilter alloc] init];
            self.filterSlider.hidden = YES;
            self.filter = @"toon";
            break;
        case 6:
            selectedFilter = [[GPUImagePinchDistortionFilter alloc] init];
            self.filterSlider.hidden = NO;
            
            [self.filterSlider setMinimumValue:-2.0];
            [self.filterSlider setMaximumValue:2.0];
            [self.filterSlider setValue:0.5];
            self.filter = @"pinchdistortion";
            break;
        case 7:
            selectedFilter = [[GPUImageBrightnessFilter alloc] init];
            self.filterSlider.hidden = NO;
            
            [self.filterSlider setMinimumValue:-1.0];
            [self.filterSlider setMaximumValue:1.0];
            [self.filterSlider setValue:0.0];
            self.filter = @"brightness";
            break;
        case 8:
            selectedFilter = [[GPUImageExposureFilter alloc] init];
            self.filterSlider.hidden = NO;
            
            [self.filterSlider setMinimumValue:-4.0];
            [self.filterSlider setMaximumValue:4.0];
            [self.filterSlider setValue:0.0];
            self.filter = @"exposure";
            break;
        case 9:
            selectedFilter = [[GPUImageContrastFilter alloc] init];
            self.filterSlider.hidden = NO;
            
            [self.filterSlider setMinimumValue:0.0];
            [self.filterSlider setMaximumValue:4.0];
            [self.filterSlider setValue:1.0];
            self.filter = @"contrast";
            break;
        case 10:
            selectedFilter = [[GPUImageSaturationFilter alloc] init];
            self.filterSlider.hidden = NO;
            
            [self.filterSlider setValue:1.0];
            [self.filterSlider setMinimumValue:0.0];
            [self.filterSlider setMaximumValue:2.0];
            self.filter = @"saturation";
            break;
        case 11:
            selectedFilter = [[GPUImageRGBFilter alloc] init];
            self.filterSlider.hidden = NO;
            
            [self.filterSlider setMinimumValue:0.0];
            [self.filterSlider setMaximumValue:2.0];
            [self.filterSlider setValue:1.0];
            self.filter = @"rgb";
            break;
        case 12:
            selectedFilter = [[GPUImageFilter alloc] init];
            self.filter = @"nofilter";
            break;
        default:
            break;
    }
    
    self.selectedFilter = selectedFilter;
    UIImage *filteredImage = [selectedFilter imageByFilteringImage:originalImage];
    self.image = filteredImage;
    [self.selectedImageView setImage:filteredImage];
}

@end
