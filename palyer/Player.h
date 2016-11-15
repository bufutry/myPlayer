//
//  Palyer.h
//  palyer
//
//  Created by 杨绍鑫 on 2016/11/15.
//  Copyright © 2016年 macMini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerView.h"

@protocol Player <NSObject>

@property (nonatomic ,assign ,readonly) NSInteger totalTime;
@property (nonatomic ,assign ,readonly) NSInteger currentTime;
@property (nonatomic ,assign ,readonly) BOOL isReady;

- (void)play;
- (void)pause;
- (void)next;
- (void)theLast;
@end

@protocol PlayerViewProtocol <NSObject>

@property (nonatomic ,weak) id<PlayerView> delegat;

- (void)show;

@end
