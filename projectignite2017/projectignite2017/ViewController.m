//
//  ViewController.m
//  projectignite2017
//
//  Created by Ashley Wong on 1/28/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import "ViewController.h"
#import "GPUImage.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//        
//        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                              message:@"Device has no camera"
//                                                             delegate:nil
//                                                    cancelButtonTitle:@"OK"
//                                                    otherButtonTitles: nil];
//        
//        [myAlertView show];
//        
//    }
//
    self.cameraImageView.image = self.image;
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
}

//- (IBAction)capturePhoto:(UIButton *)sender {
//    
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.delegate = self;
//    picker.allowsEditing = YES;
//    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//    
//    [self presentViewController:picker animated:YES completion:NULL];
//    
//}

//- (IBAction)choosePhoto:(UIButton *)sender {
//    
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.delegate = self;
//    picker.allowsEditing = YES;
//    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    
//    [self presentViewController:picker animated:YES completion:NULL];
//    
//    
//}

//#pragma mark - Image Picker Controller delegate methods
//
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//    
//    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
//    self.cameraImageView.image = chosenImage;
//    
//    [picker dismissViewControllerAnimated:YES completion:NULL];
//    
//}
//
//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
//    
//    [picker dismissViewControllerAnimated:YES completion:NULL];
//    
//}

- (IBAction)pressedDownload:(id)sender{
    if (self.image != nil)
    {
        UIImageWriteToSavedPhotosAlbum(self.image, nil, nil, nil);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!"
                                                        message:@"Saved to camera roll"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    
}

- (IBAction)pressedEdit:(id)sender {
}

- (IBAction)pressedUpload:(id)sender {
    NSData *photoData = [[NSUserDefaults standardUserDefaults] objectForKey:@"photos"];
    NSArray *photoArray = [NSKeyedUnarchiver unarchiveObjectWithData:photoData];
    NSMutableArray *photoAddArray = [NSMutableArray arrayWithArray:photoArray];
    [photoAddArray addObject:self.image];
    NSData *encodedPhotos = [NSKeyedArchiver archivedDataWithRootObject:photoAddArray];
    [[NSUserDefaults standardUserDefaults] setObject:encodedPhotos forKey:@"photos"];
}

- (IBAction)pressedBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

