//
//  ViewController.m
//  projectignite2017
//
//  Created by Ashley Wong on 1/28/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.cameraImageView.image = self.image;
}

#pragma mark Actions

// Download current image to camera roll
- (IBAction)pressedDownload:(id)sender{
    // Save only if there is an image present
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
                                                        message:@"No image."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    
}

// Switch to editing mode
- (IBAction)pressedEdit:(id)sender {
    // Send data to editing page and present segue
    [self performSegueWithIdentifier:@"editViewControllerSegue" sender:self];
}

// Put image into collection view from menu (TO-DO: (ASHLEY ONLY) add Facebook functionality)
- (IBAction)pressedUpload:(id)sender {
    // Get encoded photo stream array
    NSData *photoData = [[NSUserDefaults standardUserDefaults] objectForKey:@"photos"];
    // Decode array
    NSArray *photoArray = [NSKeyedUnarchiver unarchiveObjectWithData:photoData];
    NSMutableArray *photoAddArray = [NSMutableArray arrayWithArray:photoArray];
    // Add new image to photo stream
    [photoAddArray addObject:self.image];
    // Encode again
    NSData *encodedPhotos = [NSKeyedArchiver archivedDataWithRootObject:photoAddArray];
    // Synchronize defaults
    [[NSUserDefaults standardUserDefaults] setObject:encodedPhotos forKey:@"photos"];
    
    // Alert the user to successful upload to photo stream
    if (self.image != nil)
    {
        UIImageWriteToSavedPhotosAlbum(self.image, nil, nil, nil);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!"
                                                        message:@"Uploaded to image stream."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    // TO-DO: (ASHLEY ONLY) add Facebook upload functionality
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [controller setInitialText:@"Check out my new Zoi photo!"];
        [controller addImage:self.image];
        [self presentViewController:controller animated:YES completion:nil];
    }
}

// Go back to menu
- (IBAction)pressedBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Segue methods

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Prepare to send image data to editing page
    if ([[segue identifier] isEqualToString:@"editViewControllerSegue"])
    {
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        editViewController *vc = (editViewController *)navController.topViewController;
        // Set editing page properties as needed
        [vc setImage:self.image];
    }
}

@end

