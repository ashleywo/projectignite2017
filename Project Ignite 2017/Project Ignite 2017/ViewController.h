//
//  ViewController.h
//  Project Ignite 2017
//
//  Created by Bronwyn Thomas on 1/29/17.
//  Copyright © 2017 Bronwyn Thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *ImageView;


- (IBAction)buttoncam:(UIButton *)sender;

- (IBAction)photolibrary:(UIButton *)sender;

@end

