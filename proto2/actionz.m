//
//  actionz.m
//  proto2
//
//  Created by Havana on 2/2/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "actionz.h"

CCSprite *fish;
CCSprite *bg;


@implementation actionz
+(id)scene{
	CCScene *scene = [CCScene node];
	actionz *layer = [actionz node];
	[scene addChild: layer];
	return scene;
}
-(id)init{
    if((self=[super init])) {
        CCMenuItemImage *undoButton = [CCMenuItemImage itemWithNormalImage:@"previous.png"
                                                             selectedImage:@"previous.png"
                                                                    target:self
                                                                  selector:@selector(backFish)];
        CCMenuItemImage *redButton = [CCMenuItemImage itemWithNormalImage:@"red_button.png"
                                                            selectedImage:@"red_button.png"
                                                                   target:self
                                                                 selector:@selector(methodCalled)];
        CCMenuItemImage *arrow = [CCMenuItemImage itemWithNormalImage:@"next.png"
                                                        selectedImage:@"next.png"
                                                               target:self
                                                             selector:@selector(moveFish)];
        CCMenuItemImage *gButton = [CCMenuItemImage itemWithNormalImage:@"green_button.png"
                                                          selectedImage:@"green_button.png"
                                                                 target:self
                                                               selector:@selector(sequenceAction)];
        CCMenuItemImage *bButton = [CCMenuItemImage itemWithNormalImage:@"blue_play.png"
                                                          selectedImage:@"blue_play.png"
                                                                 target:self
                                                               selector:@selector(repeatAction)];
        
        CCMenu *menu = [CCMenu menuWithItems:undoButton, redButton, gButton, bButton, arrow, nil];
        [menu setPosition:ccp(450, 150)];
        //[menu alignItemsHorizontallyWithPadding:5];
        [menu alignItemsVerticallyWithPadding:5];
        [self addChild:menu];
        
        fish = [CCSprite spriteWithFile:@"fish.png"];
        fish.position = ccp(200, 150);
        [self addChild:fish];
        
        //background
        bg = [CCSprite spriteWithFile:@"blue.png"];
        CGSize screensize = [[CCDirector sharedDirector]winSize];
        bg.position = ccp(screensize.width/2, screensize.height/2);
        [self addChild:bg z:-1];
    }
    return self;
}
//id is a data type that can store any type of object
-(void)methodCalled{
    //[fish runAction:[CCMoveBy actionWithDuration:.3 position:ccp((arc4random() % 40), 20)]];
    
    //id theAction = [CCJumpBy actionWithDuration:1 position:ccp(0,0) height:185 jumps:2];
    
    //id theAction = [CCScaleBy actionWithDuration:1 scale:3.0];
    //you can rotate 'to' 90 or 'by' 90 degrees
    id theAction1 = [CCRotateBy actionWithDuration:1 angle:90];
    id theAction2 = [CCJumpBy actionWithDuration:1 position:ccp(0,0) height:185 jumps:2];
    id theAction3 = [CCScaleTo actionWithDuration:2 scale:1.5];
    
    [fish runAction:theAction1];
    [fish runAction:theAction2];
    [fish runAction:theAction3];
}
-(void)moveFish{
    id moveForward = [CCMoveBy actionWithDuration:1 position:ccp(40, 0)];
    [fish runAction:moveForward];
}
-(void)backFish{
    id action1 = [CCMoveBy actionWithDuration:1 position:ccp(40, 0)];
    id reverseAct = [action1 reverse];
    [fish runAction:reverseAct];
}
-(void)sequenceAction{
    id action1 = [CCMoveBy actionWithDuration:1 position:ccp(40, 0)];
    id action2 = [CCJumpBy actionWithDuration:1 position:ccp(0,0) height:185 jumps:2];
    id action3 = [CCMoveBy actionWithDuration:2 position:ccp(0, -40)];
    
    //CCSequence performs actions in a sequence
    //CCSpawn performs all actinos at the same time
    [fish runAction:[CCSequence actions:action1, action2, action3,
                     [CCSpawn actions:[action1 reverse], [action3 reverse], nil], nil]];
}
-(void)repeatAction{
    id a1 = [CCRotateBy actionWithDuration:1 angle:360];
    id repeat = [CCRepeat actionWithAction:a1 times:5];
    //to repeat forever
    //id repeat1 = [CCRepeatForever actionWithAction:a1];
    
    //ease - slow accelerationa and decelleration. More Natural Movement
    id ease = [CCEaseInOut actionWithAction:a1 rate:5];
    [fish runAction:ease];
}
@end
