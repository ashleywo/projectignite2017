//
//  EditViewController.h
//  Project Ignite 2017
//
//  Created by HaNa Pohl-Cummings on 2/19/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"

@interface EditViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *EditorImageView;
@property (strong, nonatomic) UIImage *Image;

- (IBAction)pressedSepia:(id)sender;
- (IBAction)pressedCustom:(id)sender;

@end



