//
//  MainViewController.h
//  projectignite2017
//
//  Created by Anika Sinha on 3/26/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"

@interface MainViewController : UIViewController < UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSMutableArray *images;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) NSString *source;
@property (weak, nonatomic) IBOutlet UIButton *cameraButton;
@property (weak, nonatomic) IBOutlet UIButton *libraryButton;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

- (IBAction)capturePhoto:(id)sender;
- (IBAction)choosePhoto:(id)sender;

@end

