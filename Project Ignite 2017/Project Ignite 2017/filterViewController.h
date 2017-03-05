//
//  filterViewController.h
//  Project Ignite 2017
//
//  Created by ProjectIgnite2 on 3/5/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "GPUImage.h"

@interface filterViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIImage *image;
@property (weak, nonatomic) IBOutlet UIButton *chooseAnotherPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIButton *chooseFilter;

- (IBAction)choosePhoto:(id)sender;
- (IBAction)chooseFilter:(id)sender;

@end
