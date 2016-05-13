//
//  MediaDetailsViewController.h
//  Daniel Hickey Assign 2
//
//  Created by Daniel Hickey on 04/11/2013.
//  Copyright (c) 2013 Daniel Hickey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MediaDetailsViewController;
@class Media;

@protocol MediaDetailsViewControllerDelagate <NSObject>

- (void)mediaDetailsViewController:(MediaDetailsViewController *)controller didEditMedia:(Media *)media;

- (void) mediaDetailsViewControllerDidCancel:(MediaDetailsViewController *)controller;

//adds media when done button is pressed
- (void) mediaDetailsViewController:(MediaDetailsViewController *)controller didAddMedia:(Media *)media;

@end

@interface MediaDetailsViewController : UITableViewController

@property (nonatomic, weak) id <MediaDetailsViewControllerDelagate> delegate;
@property (strong, nonatomic) Media *mediaToEdit;


@property (weak, nonatomic) IBOutlet UITextField *titleTextField;


- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;  
@end

