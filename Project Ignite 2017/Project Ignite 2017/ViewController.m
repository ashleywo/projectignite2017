//
//  ViewController.m
//  Project Ignite 2017
//
//  Created by Ashley Wong on 1/29/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import "ViewController.h"
#import "testViewController.h"

@interface ViewController ()
{
    UIImage *originalImage;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc]initWithTitle:@"Error"
                                                             message:@"Device has no camera."
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        self.cameraButton.enabled = NO;
        [myAlertView show];
    }
    if (self.image == nil)
    {
        self.saveButton.enabled = NO;
    }
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    if (originalImage == nil)
//    {
//        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//        picker.delegate = self;
//        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//        
//        [self presentViewController:picker animated:YES completion:NULL];
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openCamera
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)openLibrary
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)savePhoto:(id)sender {
    if (self.image != nil)
    {
        UIImageWriteToSavedPhotosAlbum(self.image, nil, nil, nil);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!"
                                                        message:@"Saved to camera roll."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"No picture available."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)pressedBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)pressedEdit:(id)sender {
    [self performSegueWithIdentifier:@"filterSegue" sender:self];
}

#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    self.saveButton.enabled = YES;

    originalImage = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [self.selectImageView setImage:originalImage];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Segue delegate methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"filterSegue"])
    {
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        testViewController *vc = (testViewController *)navController.topViewController;
        [vc setImage:originalImage];
    }
}

@end
