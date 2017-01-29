//
//  ViewController.m
//  Project Ignite 2017
//
//  Created by Bronwyn Thomas on 1/29/17.
//  Copyright © 2017 Bronwyn Thomas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    if(![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView  *myAlertView = [[UIAlertView alloc] intiWithTitle:@"Error"
                                                               message:@"Device has no camera"
                                                              delegate:nil
                                     cancelButtonTitle]
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttoncam:(UIButton *)sender {
}

- (IBAction)photolibrary:(UIButton *)sender {
}
@end
