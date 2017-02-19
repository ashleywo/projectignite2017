//
//  menuViewController.h
//  Project Ignite 2017
//
//  Created by Ashley Wong on 2/12/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "collectionViewCell.h"

@interface menuViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSMutableArray *images;

@end
