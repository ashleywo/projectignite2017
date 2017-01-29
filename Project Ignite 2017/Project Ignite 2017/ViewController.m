//
//  ViewController.m
//  Project Ignite 2017
//
//  Created by HaNa Pohl-Cummings on 1/29/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"<#(nullable NSString *)#> message:@"Device has no camera" <#(nullable NSString *)#> delegate:<#(nullable id)#> cancelButtonTitle:@"Okay"<#(nullable NSString *)#> otherButtonTitles:<#(nullable NSString *), ...#>, nil]
        
        [myAlertView show];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    - [(IBAction)capturePhoto: (UIButton *)sender {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init]; picker.delegate = self; picker.allowsEditing = YES; picker.sourceType = UIImagePickerControllerSourceTypeCamera
    }
    
    
@end
