//
//  MediaDetailsViewController.m
//  Daniel Hickey Assign 2
//
//  Created by Daniel Hickey on 04/11/2013.
//  Copyright (c) 2013 Daniel Hickey. All rights reserved.
//

#import "MediaDetailsViewController.h"
#import "Media.h"

@interface MediaDetailsViewController ()

@end

@implementation MediaDetailsViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        NSLog(@"init MediaDetailsViewController");
    }
    return self;
}
- (void)dealloc
{
    NSLog(@"dealloc MediaDetailsViewController");
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.mediaToEdit != nil)
    {
        self.title = @"Edit media";
        self.titleTextField.text = self.mediaToEdit.title;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
        [self.titleTextField becomeFirstResponder];//says the user tapped in the first cell
}

- (IBAction)cancel:(id)sender
{
    [self.delegate mediaDetailsViewControllerDidCancel:self];
}
- (IBAction)done:(id)sender
{
    if (self.mediaToEdit != nil)
    {
        self.mediaToEdit.title = self.titleTextField.text;
        [self.delegate mediaDetailsViewController: self didEditMedia:self.mediaToEdit];
    }
    else
    {
        Media *media = [[Media alloc] init];
        media.title = self.titleTextField.text;
        [self.delegate mediaDetailsViewController :self didAddMedia:media];
    }
}
@end
