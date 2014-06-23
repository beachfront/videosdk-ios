//
//  BFMVideosViewController.m
//  BFVideoExample
//
//  Created by Todd Kuehnl on 6/16/14.
//  Copyright (c) 2014 Beachfront Media, LLC. All rights reserved.
//

#import "BFMVideosViewController.h"
#import "BFVideoSDK.h"
#import "BFMVideoDetailController.h"
#import "BFMVideoCell.h"

@interface BFMVideosViewController ()

@end

@implementation BFMVideosViewController

@synthesize tableView;
@synthesize channelID;

NSArray *_videos;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[BFVideoSDK sharedManager]getChannelVideosWith:channelID pageNum:0 success:^(NSDictionary *videoInfo){
        NSLog(@"getChannelVideos");
        _videos = [videoInfo valueForKey:@"videos"];
        [tableView reloadData];
    }failure:^(NSError *error){
        NSLog(@"Error loading channel videos: %@", error.description);
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_videos count];
}

- (UITableViewCell *)tableView:(UITableView *)ttableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"VideoCell";
    
    BFMVideoCell *cell = [ttableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"VideoCell" bundle:nil] forCellReuseIdentifier:@"VideoCell" ];
        cell = [tableView dequeueReusableCellWithIdentifier:@"VideoCell"];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)ttableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180.0;
}

- (void)tableView:(UITableView *)ttableView willDisplayCell:(BFMVideoCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.titleLabel.text = [[_videos objectAtIndex:indexPath.row]valueForKey:@"_title"];
    cell.thumbnailView.image = [UIImage imageNamed:@"placeholder.png"];
 
    // Load the image with an GCD block executed in another thread
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[[_videos objectAtIndex:indexPath.row]valueForKey:@"_thumbnail"]]];
        
        if (imageData) {
            UIImage *thumbImage = [UIImage imageWithData:imageData];
            if (thumbImage) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    BFMVideoCell *updateCell = (id)[ttableView cellForRowAtIndexPath:indexPath];
                    if (updateCell) {
                        updateCell.thumbnailView.image = thumbImage;
                    }
                });
            }
        }
    });

}

- (void)tableView:(UITableView *)ttableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [self performSegueWithIdentifier:@"showVideoDetail" sender:nil];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showVideoDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BFMVideoDetailController *destViewController = segue.destinationViewController;
        destViewController.video = [_videos objectAtIndex:indexPath.row];
    }
}

@end
