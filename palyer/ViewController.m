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
    StandardPlayerView *player = [[StandardPlayerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,130)];
    
    player.delegat = self;
    [self.view addSubview:player];
    [player show];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.frame = CGRectMake(10, 300, 50, 50);
    bt.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:bt];
    [bt addTarget:self action:@selector(fu) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)fu{
    [self shouldAutorotate];
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

- (BOOL)shouldAutorotate
{
    return YES;
}

#pragma mark - 
//-(BOOL)shouldAutorotate
//{
//    return self;
//}

@end
