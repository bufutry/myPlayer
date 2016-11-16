//
//  PlayerView.h
//  palyer
//
//  Created by 杨绍鑫 on 2016/11/15.
//  Copyright © 2016年 macMini. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PlayerView <NSObject>

- (void)didPlay;
- (void)didPause;
- (void)didNext;

- (NSArray*)singUrlsOfArray;
@end
