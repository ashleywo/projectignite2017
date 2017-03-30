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

    self.cameraImageView.image = self.image;
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
}


- (IBAction)pressedDownload:(id)sender{
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
}

- (IBAction)pressedBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

