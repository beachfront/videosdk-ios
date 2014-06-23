//
//  BFMVideoCell.m
//  BFVideoExample
//
//  Created by Todd Kuehnl on 6/17/14.
//  Copyright (c) 2014 Beachfront Media, LLC. All rights reserved.
//

#import "BFMVideoCell.h"

@implementation BFMVideoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
