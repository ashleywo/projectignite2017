//
//  ViewController.h
//  Project Ignite 2017
//
//  Created by HaNa Pohl-Cummings on 1/29/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *ImageView;

- (IBAction)capturePhoto:(UIButton *)sender;
- (IBAction)choosePhoto:(UIButton *)sender;

@end

