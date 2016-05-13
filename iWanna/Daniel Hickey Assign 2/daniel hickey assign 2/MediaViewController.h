//
//  MediaViewController.h
//  Daniel Hickey Assign 2
//
//  Created by Daniel Hickey on 03/11/2013.
//  Copyright (c) 2013 Daniel Hickey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaDetailsViewController.h"

@interface MediaViewController : UITableViewController <MediaDetailsViewControllerDelagate>

@property (nonatomic, strong) NSMutableArray *media;


@end
