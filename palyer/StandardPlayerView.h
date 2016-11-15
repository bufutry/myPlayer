//
//  StandardPlayerView.h
//  palyer
//
//  Created by 杨绍鑫 on 2016/11/15.
//  Copyright © 2016年 macMini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface StandardPlayerView : UIView<PlayerViewProtocol>
@property (nonatomic ,weak) id<PlayerView> delegat;
@end
