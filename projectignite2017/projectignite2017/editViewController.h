//
//  editViewController.h
//  projectignite2017
//
//  Created by Anika Sinha on 2/19/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "GPUImage.h"

@interface editViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong,nonatomic) UIImage *image;
@property (weak, nonatomic) IBOutlet UIImageView *UIImageView;
@property (weak, nonatomic) IBOutlet UIButton *ChooseAnotherPicture;
- (IBAction)ChooseAnotherPictureAction:(id)sender;

@end
