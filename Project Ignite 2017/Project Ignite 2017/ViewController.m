//
//  ViewController.m
//  Project Ignite 2017
//
//  Created by ProjectIgnite on 1/29/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import "ViewController.h"
#import "FiltersViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (![UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView *myAlertView  =
        [[UIAlertView alloc] initWithTitle:@"Error"
                                                               message:@"Device has no camera"
                                                              delegate:nil
                                                            cancelButtonTitle:@"OK"
                                                             otherButtonTitles: nil];
        [myAlertView show];
                                    
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)CapturePhoto:(UIButton *)sender {
    UIImagePickerController *picker =[[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)ChoosePhoto:(UIButton *)sender {
    NSLog(@"clicked choose photo");
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)Filters:(id)sender {
    [self performSegueWithIdentifier:@"FilterSegue" sender:self];
}
    
#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    self.ImageView.image = chosenImage;
    self.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

#pragma mark - Segue delegate methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"FilterSegue"])
    {
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        FiltersViewController *vc = (FiltersViewController *)navController.topViewController;
        [vc setImage:self.image];
    }
}
@end
 
