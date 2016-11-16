//
//  StandardPlayerView.m
//  palyer
//
//  Created by 杨绍鑫 on 2016/11/15.
//  Copyright © 2016年 macMini. All rights reserved.
//

#import "StandardPlayerView.h"
#import <AVFoundation/AVFoundation.h>
#import "StandardPlayer.h"


@interface StandardPlayerView()
@property (nonatomic ,strong) StandardPlayer *player;
@property (nonatomic ,strong) UIButton *playerButton;
@property (nonatomic ,strong) UISlider *slider;
@property (nonatomic ,strong) UIButton *fullButton;
@end

@implementation StandardPlayerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.player = [[StandardPlayer alloc] init];
        AVPlayerLayer *layer = (AVPlayerLayer*) self.layer;
        layer.player = self.player;
        [self _setupUI];
        return self;
    }
    return nil;
}

- (void)_setupUI
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 50, 50, 50);
    [self addSubview:button];
    self.playerButton = button;
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(playerSing) forControlEvents:UIControlEventTouchUpInside];
    
    self.fullButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _fullButton.frame = CGRectMake(self.frame.size.width-30, 0, 30, 30);
    [self addSubview:_fullButton];
    
    _fullButton.backgroundColor = [UIColor blueColor];
    
    [_fullButton addTarget:self action:@selector(landscape:) forControlEvents:UIControlEventTouchUpInside];
    
}

+ (Class)layerClass
{
    return [AVPlayerLayer class];
}

- (void)landscape:(UIButton*)send
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    send.selected = !send.selected;
//    if (send.isSelected) {
 //       size = CGSizeMake(size.height, size.width);
//    }
    [UIView animateWithDuration:3 animations:^{
       CGRect r = self.frame;
       r.size = size;
       self.frame = r;
        self.transform = CGAffineTransformRotate(self.transform, M_PI_2*(send.selected?1:-1));
   }];
}

- (void)playerSing
{
    [_player play];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"isReady"]) {
        BOOL isr = [change[NSKeyValueChangeNewKey] boolValue];
        _playerButton.enabled = isr;
    }
}

- (void)show
{
    if ([self.delegat respondsToSelector:@selector(singUrlsOfArray)]) {
        [self.player addObserver:self forKeyPath:@"isReady" options:NSKeyValueObservingOptionNew context:nil];
        [_player addPlayerItmesWithArrary:[self.delegat singUrlsOfArray]];
    }
    else
    {
    
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
