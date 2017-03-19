//
//  filterViewController.h
//  Project Ignite 2017
//
//  Created by Bronwyn Thomas on 2/19/17.
//  Copyright © 2017 Bronwyn Thomas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"
@interface filterViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong,nonatomic) UIImage *image;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet UIImageView *imageVIewer;

- (IBAction)filter1:(id)sender;

@end




