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
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera."
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        self.cameraButton.enabled = NO;
    }
    
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
    
    self.selectedPhotos = [[NSMutableArray alloc] init];
    
    self.cancelButton.hidden = YES;
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

- (IBAction)pressedSelect:(id)sender {
    if (self.multipleSelectionEnabled)
    {
        if (self.selectedPhotos.count > 0)
        {
            [self.selectedPhotos sortedArrayUsingSelector:@selector(compare:)];
            NSLog(@"%@", self.selectedPhotos);
            for (NSNumber *indexPath in [self.selectedPhotos reverseObjectEnumerator])
            {
                NSInteger integerVal = [indexPath integerValue];
                [self.images removeObjectAtIndex:integerVal];
            }
        }
        
        // Deselect all selected items
        for (NSIndexPath *indexPath in self.collectionView.indexPathsForSelectedItems)
        {
            [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
        }
        
        // Remove all items from selectedPhotos array
        [self.selectedPhotos removeAllObjects];
        
        self.multipleSelectionEnabled = NO;
        self.collectionView.allowsMultipleSelection = NO;
        [self.selectButton setTitle:@"SELECT" forState:UIControlStateNormal];
        
        if (self.images.count == 0)
        {
            self.selectButton.enabled = NO;
        }
        
        [self.collectionView reloadData];
        
        NSData *encodedArray = [NSKeyedArchiver archivedDataWithRootObject:self.images];
        [[NSUserDefaults standardUserDefaults] setObject:encodedArray forKey:@"photos"];
        
        self.cancelButton.hidden = YES;
    }
    else
    {
        // Change multiple selection to YES and change button to delete
        self.multipleSelectionEnabled = YES;
        self.collectionView.allowsMultipleSelection = YES;
        [self.selectButton setTitle:@"DELETE" forState:UIControlStateNormal];
        self.cancelButton.hidden = NO;
    }
}

- (IBAction)pressedCancel:(id)sender {
    if (self.multipleSelectionEnabled)
    {
        self.multipleSelectionEnabled = NO;
        self.collectionView.allowsMultipleSelection = NO;
        [self.selectButton setTitle:@"SELECT" forState:UIControlStateNormal];
        self.cancelButton.hidden = YES;
    }
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
    myCell.checkmark.hidden = YES;
    
    return myCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.multipleSelectionEnabled)
    {
        long row = [indexPath row];
        int number = (int)row;
        NSNumber *index = [NSNumber numberWithInt:number];
        [self.selectedPhotos addObject:index];
        CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.checkmark.hidden = NO;
    }
    else
    {
        [self performSegueWithIdentifier:@"viewControllerSegue" sender:self];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.multipleSelectionEnabled)
    {
        long row = [indexPath row];
        int number = (int)row;
        NSNumber *index = [NSNumber numberWithInt:number];
        [self.selectedPhotos removeObject:index];
        CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.checkmark.hidden = YES;
    }
}

#pragma mark - Segue Delegate Methods

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"viewControllerSegue"])
    {
        if (self.multipleSelectionEnabled)
        {
            return NO;
        }
        else
        {
            return YES;
        }
    }
    else
    {
        return YES;
    }
}

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
    self.selectButton.enabled = YES;
    [self.collectionView reloadData];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    [self performSegueWithIdentifier:@"viewControllerSegue" sender:self];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
@end
