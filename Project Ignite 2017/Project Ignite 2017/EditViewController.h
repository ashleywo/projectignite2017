//
//  EditViewController.h
//  Project Ignite 2017
//
//  Created by HaNa Pohl-Cummings on 2/19/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController <UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UISlider *BrightnessSlide;
@property (weak, nonatomic) IBOutlet UISlider *ContrastSlide;
@property (weak, nonatomic) IBOutlet UIImageView *EditorImageView;

- (IBAction)BrightnessSlide:(id)sender;

- (IBAction)ContrastSlide:(id)sender;

@end
