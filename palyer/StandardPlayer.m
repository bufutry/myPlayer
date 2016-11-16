//
//  StandardPalerController.m
//  palyer
//
//  Created by 杨绍鑫 on 2016/11/15.
//  Copyright © 2016年 macMini. All rights reserved.
//

#import "StandardPlayer.h"

@interface StandardPlayer()

@property (nonatomic ,assign) NSInteger totalTime;
@property (nonatomic ,assign) NSInteger currentTime;
@property (nonatomic ,strong) NSTimer *timer;

@property (nonatomic ,strong) NSMutableArray *itmes;
@property (nonatomic ,strong) AVPlayerItem *currentItme;

//@property (nonatomic ,assign) BOOL isReady;

@end

@implementation StandardPlayer 

- (instancetype)init
{
    self = [super init];
    if (self) {
        _itmes = [NSMutableArray array];
        return  self;
    }
    return nil;
}

- (void)setCurrentItme:(AVPlayerItem *)currentItme
{
    _currentItme = currentItme;
    self.isReady = NO;
   // [_currentItme removeObserver:self forKeyPath:@"status"];
    [_currentItme addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)addPlayerItmeWithURL:(NSURL*)url
{
    [self _addItme:url];
    if (_itmes.count==1) {
        self.currentItme =  _itmes.firstObject;
        [self replaceCurrentItemWithPlayerItem:_currentItme];
    }
}

- (void)addPlayerItmesWithArrary:(NSArray*)itmes
{
    @try {
        for (NSURL *url in itmes) {
            [self _addItme:url];
        }
        if (!_currentItme) {
             self.currentItme = _itmes.firstObject;
            [self replaceCurrentItemWithPlayerItem:_currentItme];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@",exception);
    } @finally {
        
    }
}

#pragma mark - OB
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"]) {
        if ([change[NSKeyValueChangeNewKey] integerValue] == AVPlayerItemStatusReadyToPlay) {
            self.isReady = YES;
            AVPlayerItem *itme  = (AVPlayerItem*)object;
            _totalTime = itme.asset.duration.value/itme.asset.duration.timescale;
        }
    }
    
}

#pragma mark - OP
- (void)play
{
    [self _play];
}

- (void)pause
{
   [_timer invalidate];
    [super pause];
}

- (void)next
{
    
}

- (void)theLast
{

}

#pragma mark - Priavte
- (void)_play
{
    [_timer invalidate];
    [super play];
}

- (void)_addItme:(NSURL*)url
{
    AVPlayerItem *itme = [[AVPlayerItem alloc] initWithURL:url];
    [_itmes addObject:itme];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
