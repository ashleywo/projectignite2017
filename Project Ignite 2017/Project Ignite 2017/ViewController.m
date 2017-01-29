//
//  ViewController.m
//  Project Ignite 2017
//
//  Created by ProjectIgnite2 on 1/29/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:<#(nullable NSString *)#> message:<#(nullable NSString *)#> delegate:<#(nullable id)#> cancelButtonTitle:<#(nullable NSString *)#> otherButtonTitles:<#(nullable NSString *), ...#>, nil
    }
                            
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)capturephoto:(UIButton *)sender {
    UIImagePickerController *picker = [{UIImagePickerController alloc] [[init]; picker.delegate = self;
                                                                        picker.allowsEditing = self;
                                                                        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                                                                        [self presentViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#> completion:<#^(void)completion#>]

- (IBAction)choosephoto:(UIButton *)sender {
}
@end
