//
//  ViewController.m
//  projectignite2017
//
//  Created by Ashley Wong on 1/28/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import "ViewController.h"
#import "editViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    
}

- (IBAction)capturePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)choosePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}

- (IBAction)editPicture:(id)sender {
    [self performSegueWithIdentifier:@"filterSegue" sender:self];
}

#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    self.cameraImageView.image = chosenImage;
    self.image =chosenImage;
    
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
#pragma mark - Segue delegate methods
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id) sender
{
    if ([[segue identifier] isEqualToString:@"filterSegue"])
    {
        UINavigationController *navController = (UINavigationController *) segue.destinationViewController;
        editViewController *vc = (editViewController *) navController. topViewController;
        [vc setImage:self.image];
    }
}

@end

