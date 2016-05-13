//
//  MediaViewController.m
//  Daniel Hickey Assign 2
//
//  Created by Daniel Hickey on 03/11/2013.
//  Copyright (c) 2013 Daniel Hickey. All rights reserved.
//

#import "MediaViewController.h"
#import "Media.h"
#import "MediaCell.h"
#import "IWAppDelegate.h"

@interface MediaViewController ()

@end

@implementation MediaViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

//Method to enable swipe-to-delete on the table
- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.media removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
    // Sets the colour of the navigation bar and tab bar
    [self.navigationController.navigationBar setTintColor:[UIColor darkGrayColor]];
    [self.navigationController.tabBarController.tabBar setTintColor:[UIColor darkTextColor]];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.media count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MediaCell"]; //gets a new cell
    
    Media *media = (self.media)[indexPath.row];
    
    cell.textLabel.text = media.title;
    // Configure the cell...
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - MediaDetailsViewControllerDelegate
//2 methods below closes the screen when "done" or "cancel" is pressed.
- (void) mediaDetailsViewControllerDidCancel: (MediaDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)mediaDetailsViewController: (MediaDetailsViewController *)controller didAddMedia:(Media *)media
{
    if([media.title length]){
        [self.media addObject:media];
       
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES selector:@selector(caseInsensitiveCompare:)];
        [self.media sortUsingDescriptors:[NSArray arrayWithObject:sort]];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.media count] - 1) inSection:0];//finds the index path for the cell that was tapped
        
        [self.tableView insertRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView reloadData];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


// Makes the media screen tell the MediaDetailsViewController that it is now its delegate.
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddMedia"])
    {
        UINavigationController *navigationController = segue.destinationViewController;
        MediaDetailsViewController *mediaDetailsViewController = [navigationController viewControllers][0];
        mediaDetailsViewController.delegate = self;
    }else if ([segue.identifier isEqualToString:@"EditMedia"])
        
    {
        UINavigationController *navigationController = segue.destinationViewController;
        
        MediaDetailsViewController *mediaDetailsViewController = [navigationController viewControllers][0];
        
        mediaDetailsViewController.delegate = self;
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Media *media = self.media[indexPath.row];
        
        mediaDetailsViewController.mediaToEdit = media;
    }
    
}

//This method reloads the cell for that player so that its labels get updated and then closes the edit player screen
- (void) mediaDetailsViewController:(MediaDetailsViewController *)controller didEditMedia:(Media *)media
{
    if([media.title length]){
        NSUInteger index = [self.media indexOfObject:media];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES selector:@selector(caseInsensitiveCompare:)];
        [self.media sortUsingDescriptors:[NSArray arrayWithObject:sort]];
        
        
        [self.tableView reloadRowsAtIndexPaths:@[indexPath]
                              withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView reloadData];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
