//
//  ViewController.h
//  Project Ignite 2017
//
//  Created by HaNa Pohl-Cummings on 1/29/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *ImageView;
@property (strong, nonatomic) UIImage *Image;

- (IBAction)capturePhoto:(UIButton *)sender;
- (IBAction)choosePhoto:(UIButton *)sender;
- (IBAction)pressedEdit:(id)sender;


@end
