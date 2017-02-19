//
//  ViewController.h
//  Project Ignite 2017
//
//  Created by Ashley Wong on 1/29/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) UIImage * image;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cameraButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *albumButton;
@property (weak, nonatomic) IBOutlet UIImageView *selectImageView;

- (IBAction)openCamera;
- (IBAction)openLibrary;
- (IBAction)savePhoto:(id)sender;
- (IBAction)pressedBack:(id)sender;


@end

