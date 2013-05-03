//
//  HelloWorldLayer.m
//  proto2
//
//  Created by Havana on 2/2/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "CCTouchDispatcher.h"

CCSprite *panda;
CCSprite *bamboo1;
CCSprite *bamboo2;
CCSprite *bamboo3;

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "actionz.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if((self=[super init])) {
        //sprites
		panda = [CCSprite spriteWithFile:@"panda.png"];
        panda.position = ccp(150, 150);
        [self addChild:panda];
        
        bamboo1 = [CCSprite spriteWithFile:@"Bamboo.PNG"];
        bamboo1.position = ccp(250, 150);
        [self addChild:bamboo1];
        
        bamboo2 = [CCSprite spriteWithFile:@"Bamboo.PNG"];
        bamboo2.position = ccp(450, 150);
        [self addChild:bamboo2];
        
        bamboo3 = [CCSprite spriteWithFile:@"Bamboo.PNG"];
        bamboo3.position = ccp(350, 150);
        [self addChild:bamboo3];
        
        //menu items
        CCMenuItem *changeScene = [CCMenuItemImage itemWithNormalImage:@"next.png"
                                                        selectedImage:@"next.png"
                                                        target:self
                                                        selector:@selector(nextScene:)];
        CCMenu *helloMenu = [CCMenu menuWithItems:changeScene, nil];
        [helloMenu setPosition:ccp(420, 20)];
        [self addChild:helloMenu];
                
        [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];

	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    return YES;
}
-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint location = [touch locationInView:[touch view]];
    CGPoint convertedLocation = [[CCDirector sharedDirector]convertToGL:location];
    
    [panda stopAllActions];
    [panda runAction:[CCMoveTo actionWithDuration:0 position:convertedLocation]];
}
-(void)nextScene:(id)sender{
    /*[title stopAllActions];
     [[CCDirector sharedDirector]replaceScene:[CCTransitionCrossFade transitionWithDuration:1 scene:[HelloWorldLayer node]]];*/
    [self stopAllActions];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:.5 scene:[actionz node]]];
}
@end
