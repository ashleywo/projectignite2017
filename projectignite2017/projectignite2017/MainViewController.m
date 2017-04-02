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
    
    // Check if device has a working camera
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera."
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        // Disable camera button if no camera available
        self.cameraButton.enabled = NO;
    }
    
    // Grab encoded data if any
    NSData *tempArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"photos"];
    // Decode data
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:tempArray];
    // If no data, present welcome message
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
        // Otherwise, set self.images to decoded data
        self.images = [NSMutableArray arrayWithArray:array];
    }
    
    // Current view controller contains delegate and data source for collection view
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    // Install pull-to-refresh controls (probably not needed, but in case)
    self.refreshControl = [[UIRefreshControl alloc] init];
    // Can change color here
    self.refreshControl.backgroundColor = [UIColor purpleColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    // Pull-to-refresh refreshes the photo stream
    [self.refreshControl addTarget:self
                            action:@selector(getPhotos)
                  forControlEvents:UIControlEventValueChanged];
    // Place refresh control within collection view and not ui view
    [self.collectionView addSubview:self.refreshControl];
    // In case there are not enough items in the collection view
    self.collectionView.alwaysBounceVertical = YES;
    
    // Initialize selected photos array for multiple selection
    self.selectedPhotos = [[NSMutableArray alloc] init];
    
    // Hide cancel button at first load
    self.cancelButton.hidden = YES;
    
    // Configure layout - remove interitem spacing and line spacing
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.itemSize = CGSizeMake(self.collectionView.bounds.size.width / 3, self.collectionView.bounds.size.width / 3);
    self.flowLayout.sectionInset = UIEdgeInsetsMake(20, 0, 10, 0);
    [self.flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.minimumLineSpacing = 0;
    [self.collectionView setCollectionViewLayout:self.flowLayout];
    self.collectionView.bounces = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)reloadData
{
    // Reload collection view
    [self.collectionView reloadData];
    
    // Stop refreshing
    if (self.refreshControl)
    {
        [self.refreshControl endRefreshing];
    }
}

// Refresh photo stream
- (void)getPhotos
{
    // Grab encoded data
    NSData *tempArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"photos"];
    // Decode data
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:tempArray];
    if (array.count != 0)
    {
        // Set self.images to decoded data
        self.images = [NSMutableArray arrayWithArray:array];
    }
    // Reload the view
    [self reloadData];
}

// Take photos with the camera
- (IBAction)capturePhoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    // Note: no editing so there is no cropping
}

// Choose a photo from library
- (IBAction)choosePhoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    // Note: no editing so there is no cropping
}

// Multiple photo selection
- (IBAction)pressedSelect:(id)sender {
    // Multiple selection enabled
    if (self.multipleSelectionEnabled)
    {
        // Multiple selected
        if (self.selectedPhotos.count > 0)
        {
            // Sort indices in ascending order
            NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES selector:@selector(compare:)];
            NSArray *photoArray = [NSArray arrayWithArray:self.selectedPhotos];
            NSArray *sortedArray = [photoArray sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
            self.selectedPhotos = [NSMutableArray arrayWithArray:sortedArray];
            for (NSNumber *indexPath in [self.selectedPhotos reverseObjectEnumerator])
            {
                NSInteger integerVal = [indexPath integerValue];
                // Remove from photo stream
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
        
        // Disable multiple selection and set button title back to select
        self.multipleSelectionEnabled = NO;
        self.collectionView.allowsMultipleSelection = NO;
        //[self.selectButton setTitle:@"SELECT" forState:UIControlStateNormal];
        [self.selectButton setImage:[UIImage imageNamed:@"Select"] forState:(UIControlStateNormal)];
        
        // If all photos in the stream are removed, disable the select button
        if (self.images.count == 0)
        {
            self.selectButton.enabled = NO;
        }
        
        // Reload
        [self.collectionView reloadData];
        
        // Encode the current photo stream array and synchronize defaults
        NSData *encodedArray = [NSKeyedArchiver archivedDataWithRootObject:self.images];
        [[NSUserDefaults standardUserDefaults] setObject:encodedArray forKey:@"photos"];
        
        // Hide cancel button after finishing
        self.cancelButton.hidden = YES;
    }
    else
    {
        // Change multiple selection to YES and change button to delete
        self.multipleSelectionEnabled = YES;
        self.collectionView.allowsMultipleSelection = YES;
        //[self.selectButton setTitle:@"DELETE" forState:UIControlStateNormal];
        [self.selectButton setImage:[UIImage imageNamed:@"Garbage"] forState:(UIControlStateNormal)];
        // Allow the cancel option
        self.cancelButton.hidden = NO;
    }
}

// If the user does not want to delete anything
- (IBAction)pressedCancel:(id)sender {
    if (self.multipleSelectionEnabled)
    {
        // Resets button titles and hides itself
        self.multipleSelectionEnabled = NO;
        self.collectionView.allowsMultipleSelection = NO;
        [self.selectButton setTitle:@"SELECT" forState:UIControlStateNormal];
        self.cancelButton.hidden = YES;
        
        for (NSNumber *indexPath in self.selectedPhotos)
        {
            NSUInteger index_int = [indexPath unsignedIntegerValue];
            NSIndexPath *index = [NSIndexPath indexPathWithIndex:index_int];
            CollectionViewCell *cell = (CollectionViewCell *)[self.collectionView cellForItemAtIndexPath:index];
            cell.checkmark.hidden = YES;
        }
        
        [self.selectedPhotos removeAllObjects];
        [self.collectionView reloadData];
    }
}

#pragma mark - Collection View Delegate Methods

// Number of sections (only need 1)
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// Number of images in photo stream
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    // Custom collection view cell
    CollectionViewCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    
    UIImage *image;
    long row = [indexPath row];
    
    image = self.images[row];
    // Set cell image based on photo stream
    myCell.imageView.image = image;
    self.image = image;
    // Nothing selected, hide checkmark
    myCell.checkmark.hidden = YES;
    myCell.layer.borderColor = [[UIColor blackColor] CGColor];
    myCell.layer.borderWidth = 0.5;
    
    return myCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.multipleSelectionEnabled)
    {
        NSLog(@"hi");
        // If multiple selection, enable checkmark to show selection and add index to selected photo array
        long row = [indexPath row];
        int number = (int)row;
        NSNumber *index = [NSNumber numberWithInt:number];
        [self.selectedPhotos addObject:index];
        CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.checkmark.hidden = NO;
    }
    else
    {
        // Single selection, send to photo page
        self.source = @"regular selection";
        [self performSegueWithIdentifier:@"viewControllerSegue" sender:self];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.multipleSelectionEnabled)
    {
        // Remove checkmark and remove index from selected photo array
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
        // Only perform the segue if it is single selection
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
        // Other segues
        return YES;
    }
}

// Pass data
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"viewControllerSegue"])
    {
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        ViewController *vc = (ViewController *)navController.topViewController;
        
        // If the image is not coming from library or camera
        if ([self.source isEqualToString:@"regular selection"])
        {
            NSLog(@"reg");
            self.image = nil;
            NSIndexPath *indexPath = [self.collectionView.indexPathsForSelectedItems objectAtIndex:0];
            // Grab cell image from selection
            CollectionViewCell *cell = (CollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
            self.image = cell.imageView.image;
            NSLog(@"%@", self.image);
            // Set next view controller image
            [vc setImage:self.image];
        }
        else
        {
            // Set next view controller image
            [vc setImage:self.image];
        }
    }
}

#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    // Sending unedited photo (no cropping)
    UIImage *chosenImage = [info valueForKey:UIImagePickerControllerOriginalImage];
    // Set private variable image
    self.image = chosenImage;
    // Load data from defaults
    NSData *photoData = [[NSUserDefaults standardUserDefaults] objectForKey:@"photos"];
    // Decode data
    NSArray *photoArray = [NSKeyedUnarchiver unarchiveObjectWithData:photoData];
    NSMutableArray *photos = [NSMutableArray arrayWithArray:photoArray];
    // Set photo stream
    self.images = photos;
    // Add new image
    [photos addObject:self.image];
    // Decode image and synchronize
    NSData *encodedArray = [NSKeyedArchiver archivedDataWithRootObject:photos];
    [[NSUserDefaults standardUserDefaults] setObject:encodedArray forKey:@"photos"];
    
    // Set source as camera or library and allow select button to be enabled since there is a photo in the stream
    // Reload the collection view
    self.source = @"imagePicker";
    self.selectButton.enabled = YES;
    [self.collectionView reloadData];
    
    // Dismiss the library or camera after selecting image or capture
    [picker dismissViewControllerAnimated:YES completion:NULL];
    // Send picture to photo page
    [self performSegueWithIdentifier:@"viewControllerSegue" sender:self];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    // Press cancel to go back to screen without taking picture or selecting picture
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
@end
