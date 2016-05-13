//
//  MediaCell.m
//  Daniel Hickey Assign 2
//
//  Created by Daniel Hickey on 04/11/2013.
//  Copyright (c) 2013 Daniel Hickey. All rights reserved.
//

#import "MediaCell.h"

@implementation MediaCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
