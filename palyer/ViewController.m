//
//  ViewController.m
//  palyer
//
//  Created by 杨绍鑫 on 2016/11/15.
//  Copyright © 2016年 macMini. All rights reserved.
//

#import "ViewController.h"
#import "StandardPlayerView.h"
#import "PlayerView.h"
@interface ViewController ()<PlayerView>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    StandardPlayerView *player = [[StandardPlayerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    
    player.delegat = self;
    [self.view addSubview:player];
    [player show];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - delegat

- (void)didPlay
{

}

- (void)didPause
{
    
}

- (void)didNext
{

}
- (void)didTheLast
{

}
- (NSArray*)singUrlsOfArray
{
    return @[[NSURL URLWithString:@"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4"]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
