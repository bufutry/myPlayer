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
@end

@implementation StandardPlayerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.player = [[StandardPlayer alloc] init];
        return self;
    }
    return nil;
}

+ (Class)layerClass
{
    return [AVPlayerLayer class];
}

- (void)show
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
