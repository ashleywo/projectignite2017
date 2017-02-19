//
//  menuViewController.m
//  Project Ignite 2017
//
//  Created by Ashley Wong on 2/12/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import "menuViewController.h"

@interface menuViewController ()

@end

@implementation menuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.images = [[NSMutableArray alloc] initWithObjects:
                   [UIImage imageNamed:@"eric1"],
                   [UIImage imageNamed:@"eric2"],
                   [UIImage imageNamed:@"eric3"],
                   [UIImage imageNamed:@"eric4"],
                   [UIImage imageNamed:@"eric5"],
                   [UIImage imageNamed:@"eric6"],
                   [UIImage imageNamed:@"eric7"], nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    collectionViewCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    
    UIImage *image;
    long row = [indexPath row];
    
    image = self.images[row];
    
    myCell.imageView.image = image;
    
    return myCell;
}







@end
