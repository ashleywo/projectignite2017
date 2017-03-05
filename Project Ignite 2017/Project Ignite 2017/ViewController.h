//
//  ViewController.h
//  Project Ignite 2017
//
//  Created by ProjectIgnite2 on 1/29/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) IBOutlet UIImageView *cameraImageView;

- (IBAction)capturephoto:(UIButton *)sender;
- (IBAction)choosephoto:(UIButton *)sender;
- (IBAction)clickEdit:(id)sender;

@end

