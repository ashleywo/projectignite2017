//
//  ViewController.m
//  Project Ignite 2017
//
//  Created by Bronwyn Thomas on 1/29/17.
//  Copyright © 2017 Bronwyn Thomas. All rights reserved.
//

#import "ViewController.h"
#import "filterViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    if(![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView  *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                               message:@"Device has no camera"
                                                              delegate:nil
                                                     cancelButtonTitle:@"Ok"
                                                     otherButtonTitles: nil];
        [myAlertView show];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttoncam:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)photolibrary:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];

}

- (IBAction)editbutton:(id)sender {
    [self performSegueWithIdentifier:@"filterSegue" sender:self];
}

#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    self.ImageView.image = chosenImage;
    self.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
#pragma mark - segue delegate methods
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"filterSegue"])
    {
        UINavigationController *navController = (UINavigationController *)
        segue.destinationViewController;
        filterViewController *vc = (filterViewController *)navController.
        topViewController;
        [vc setImage:self.image];
    }
}
@end
