//
//  StandardPalerController.h
//  palyer
//
//  Created by 杨绍鑫 on 2016/11/15.
//  Copyright © 2016年 macMini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Player.h"
#import <AVFoundation/AVFoundation.h>

@interface StandardPlayer : AVPlayer <Player>
@property (nonatomic ,assign ,readonly) NSInteger totalTime;
@property (nonatomic ,assign ,readonly) NSInteger currentTime;
@property (nonatomic ,assign) BOOL isReady;

- (void)play;

- (void)pause;

- (void)next;

- (void)theLast;


- (void)addPlayerItmeWithURL:(NSURL*)url;
- (void)addPlayerItmesWithArrary:(NSArray*)itmes;
@end
