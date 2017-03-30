//
//  MainViewController.m
//  projectignite2017
//
//  Created by Anika Sinha on 3/26/17.
//  Copyright © 2017 Project Ignite. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSData *tempArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"photos"];
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:tempArray];
    if (array.count == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome!"
                                                        message:@"It looks like you don't have any photos right now. Take a picture or choose one to get started!"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        self.images = [NSMutableArray arrayWithArray:array];
    }
    NSLog(@"%lu", (unsigned long)self.images.count);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor purpleColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self
                            action:@selector(getPhotos)
                  forControlEvents:UIControlEventValueChanged];
    [self.collectionView addSubview:self.refreshControl];
    self.collectionView.alwaysBounceVertical = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)reloadData
{
    [self.collectionView reloadData];
    
    if (self.refreshControl)
    {
        [self.refreshControl endRefreshing];
    }
}

- (void)getPhotos
{
    NSData *tempArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"photos"];
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:tempArray];
    if (array.count != 0)
    {
        self.images = [NSMutableArray arrayWithArray:array];
    }
    [self reloadData];
}

- (IBAction)capturePhoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)choosePhoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

#pragma mark - Collection View Delegate Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CollectionViewCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    
    UIImage *image;
    long row = [indexPath row];
    
    image = self.images[row];
    myCell.imageView.image = image;
    self.image = image;
    
    return myCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"viewControllerSegue" sender:self];
}

#pragma mark - Segue Delegate Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"viewControllerSegue"])
    {
        if (![self.source isEqualToString:@"imagePicker"])
        {
            NSIndexPath *indexPath = [self.collectionView.indexPathsForSelectedItems objectAtIndex:0];
            CollectionViewCell *cell = (CollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
            self.image = cell.imageView.image;
        }
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        ViewController *vc = (ViewController *)navController.topViewController;
        [vc setImage:self.image];
    }
}

#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = [info valueForKey:UIImagePickerControllerOriginalImage];
    self.image = chosenImage;
    NSData *photoData = [[NSUserDefaults standardUserDefaults] objectForKey:@"photos"];
    NSArray *photoArray = [NSKeyedUnarchiver unarchiveObjectWithData:photoData];
    NSMutableArray *photos = [NSMutableArray arrayWithArray:photoArray];
    self.images = photos;
    [photos addObject:self.image];
    NSData *encodedArray = [NSKeyedArchiver archivedDataWithRootObject:photos];
    [[NSUserDefaults standardUserDefaults] setObject:encodedArray forKey:@"photos"];
    
    self.source = @"imagePicker";
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    [self performSegueWithIdentifier:@"viewControllerSegue" sender:self];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
@end
