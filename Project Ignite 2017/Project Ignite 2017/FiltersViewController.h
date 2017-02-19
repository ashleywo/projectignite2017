//
//  FiltersViewController.h
//  Project Ignite 2017
//
//  Created by projectignite3 on 2/19/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FiltersViewController : UIViewController < UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *Home;

@property (weak, nonatomic) IBOutlet UIImageView *ImageView;

- (IBAction)Filter1:(id)sender;
- (IBAction)Filter2:(id)sender;
- (IBAction)Filter3:(id)sender;

@end



