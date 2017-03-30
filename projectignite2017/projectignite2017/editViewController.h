//
//  editViewController.h
//  projectignite2017
//
//  Created by Ashley Wong on 3/30/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"

@interface editViewController : UIViewController <UINavigationControllerDelegate>

@property (strong, nonatomic) UIImage *image;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;

- (IBAction)pressedBack:(id)sender;
// TO-DO: add properties (outlets) and actions appropriately

@end
