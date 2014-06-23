//
//  BFMVideosViewController.h
//  BFVideoExample
//
//  Created by Todd Kuehnl on 6/16/14.
//  Copyright (c) 2014 Beachfront Media, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BFMVideosViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    __weak IBOutlet UITableView *tableView;
}
@property (nonatomic, weak ) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSString *channelID;
@end
