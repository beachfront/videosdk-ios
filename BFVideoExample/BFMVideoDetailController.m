//
//  BFMVideoDetailController.m
//  BFVideoExample
//
//  Created by Todd Kuehnl on 6/17/14.
//  Copyright (c) 2014 Beachfront Media, LLC. All rights reserved.
//

#import "BFMVideoDetailController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "BFVideoSDK.h"

@interface BFMVideoDetailController ()
@property (nonatomic,strong) BFVideoViewController *videoController;
@end

@implementation BFMVideoDetailController

@synthesize video;

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
    CGRect _rect = CGRectMake(0, 68, self.view.bounds.size.width, self.view.bounds.size.width * 0.7);
    self.videoController = [[BFVideoViewController alloc] initWithVideo:video andRect:_rect];
    [self.view addSubview:self.videoController.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
