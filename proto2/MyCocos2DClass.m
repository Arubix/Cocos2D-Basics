//
//  MyCocos2DClass.m
//  proto2
//
//  Created by Havana on 2/2/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//


//!!!@@@iPhone 3g-4 dimensions are 320 x 480@@@!!!


#import "MyCocos2DClass.h"
#import "CCTouchDispatcher.h"

CCSprite *title;

@implementation MyCocos2DClass
+(id)scene{
    // 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MyCocos2DClass *layer = [MyCocos2DClass node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id)init{
    if((self=[super init])) {
        //menu tutorial
        CCMenuItemImage *item1 = [CCMenuItemImage itemWithNormalImage:@"panda1.png"
                                                        selectedImage:@"panda1.png"
                                                        target:self
                                                        selector:@selector(doThis:)];
        
        CCMenu *menu = [CCMenu menuWithItems:item1, nil];
        
        [self addChild:menu];
        //end menu tutorial
        
        title = [CCSprite spriteWithFile:@"title1.png"];
        title.position = ccp(800, 200);
        [self addChild:title];
        
        [self schedule:@selector(callEveryFrame:)];
    }
    return self;
}
//menu tutorial function
//function called when the menu item fireball is pressed
-(void) doThis:(id)sender{
    [title stopAllActions];
    [[CCDirector sharedDirector]replaceScene:[CCTransitionCrossFade transitionWithDuration:.5 scene:[HelloWorldLayer node]]];
}
-(void) callEveryFrame:(ccTime)dt{
    title.position = ccp(title.position.x - 100 * dt, title.position.y);
    
    //resets title to beginning when it goes offscreen
    //480 width is the width of the iphone
    //if(title.position.x < 480 + 30)
    //    title.position = ccp(-30, title.position.y);
}
@end
