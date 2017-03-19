//
//  ViewController.m
//  Project Ignite 2017
//
//  Created by HaNa Pohl-Cummings on 1/29/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import "ViewController.h"
#import "EditViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
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

- (IBAction)capturePhoto: (UIButton*)sender {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
    [self presentViewController:picker animated:YES completion:NULL];
}
       
- (IBAction)choosePhoto: (UIButton *)sender {
           UIImagePickerController *picker = [[UIImagePickerController alloc] init];
           picker.delegate = self;
           picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
           
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)pressedEdit:(id)sender { [self performSegueWithIdentifier:@"editorSegue" sender:self];
}
       
#pragma mark - Image Picker Controller delegate methods
       
- (void)imagePickerController:(UIImagePickerController *)picker   didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    self.ImageView.image = chosenImage;
    self.Image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
       
- (void)imagePickerControllerDidCancel: (UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Segue delegate methods

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if  ([[segue identifier] isEqualToString:@"editorSegue"])
    {
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        EditViewController *vc = (EditViewController *)navController.topViewController;
        [vc setImage:self.Image];
    }
}



@end
