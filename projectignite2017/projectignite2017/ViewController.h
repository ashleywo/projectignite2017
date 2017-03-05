//
//  ViewController.h
//  projectignite2017
//
//  Created by Ashley Wong on 1/28/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong,nonatomic) UIImage *image;
@property (strong, nonatomic) IBOutlet UIImageView *cameraImageView;
@property (strong, nonatomic) IBOutlet UIImageView *editPicture;

- (IBAction)capturePhoto:  (UIButton *)sender;
- (IBAction)choosePhoto:(UIButton *)sender;
- (IBAction)editPicture:(id)sender;

@end