//
//  HelloWorldLayer.h
//  proto2
//
//  Created by Havana on 2/2/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


#import <GameKit/GameKit.h>
#import "MyCocos2DClass.h"

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>{
    
}
// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
