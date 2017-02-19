//
//  filterViewController.h
//  Project Ignite 2017
//
//  Created by Bronwyn Thomas on 2/19/17.
//  Copyright © 2017 Bronwyn Thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface filterViewController : UIViewController <UIImagePickerControllerDelegate>


@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet UIImageView *imageVIewer;

- (IBAction)filter1:(id)sender;
- (IBAction)filter2:(id)sender;
- (IBAction)filter3:(id)sender;
- (IBAction)filter4:(id)sender;

@end




