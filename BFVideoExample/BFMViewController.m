//
//  BFMViewController.m
//  BFVideoExample
//
//  Created by Todd Kuehnl on 6/13/14.
//  Copyright (c) 2014 Beachfront Media, LLC. All rights reserved.
//

#import "BFMViewController.h"
#import "BFMVideosViewController.h"
#import "BFVideoSDK.h"

@interface BFMViewController ()

@end

@implementation BFMViewController

@synthesize tableView;

NSArray *_channels;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[BFVideoSDK sharedManager]getAppChannels:^(NSArray *channels){
        _channels = channels;
        [tableView reloadData];
    }failure:^(NSError *error){
        NSLog(@"Error loading channels: %@",error.description);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_channels count];
}

- (UITableViewCell *)tableView:(UITableView *)ttableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"ChannelCell";
    
    UITableViewCell *cell = [ttableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSString *channel_name = [[_channels objectAtIndex:indexPath.row] valueForKey:@"_name"];
    cell.textLabel.text = channel_name;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showChannelVideos"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BFMVideosViewController *destViewController = segue.destinationViewController;
        destViewController.channelID = [[_channels objectAtIndex:indexPath.row] valueForKey:@"_channelID"];
    }
}

@end
