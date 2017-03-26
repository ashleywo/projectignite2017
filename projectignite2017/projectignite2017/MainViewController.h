//
//  MainViewController.h
//  projectignite2017
//
//  Created by Anika Sinha on 3/26/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController < UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSMutableArray *images;

@end

