//
//  ViewController.h
//  projectignite2017
//
//  Created by Ashley Wong on 1/28/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "editViewController.h"

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIImage *image;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (strong, nonatomic) IBOutlet UIImageView *cameraImageView;
@property (weak, nonatomic) IBOutlet UIButton *download;
@property (weak, nonatomic) IBOutlet UIButton *upload;
@property (weak, nonatomic) IBOutlet UIButton *edit;

- (IBAction)pressedDownload:(id)sender;
- (IBAction)pressedEdit:(id)sender;
- (IBAction)pressedUpload:(id)sender;
- (IBAction)pressedBack:(id)sender;

@end
