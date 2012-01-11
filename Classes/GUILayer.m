//
//  GUILayer.m
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/28/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "GUILayer.h"
#import "SceneManager.h"

@implementation GUILayer

@synthesize exitButton;
@synthesize pauseButton;

-(id)init {
	self = [super init];
	if (self != nil) {
		exitButton = [Sprite spriteWithFile:@"exit button.png"];
		pauseButton = [Sprite spriteWithFile:@"pause button.png"];
		[exitButton setPosition:cpv(450, 280)];
		[pauseButton setPosition:cpv(450, 255)];
		[self addChild:exitButton];
		[self addChild:pauseButton];
		isTouchEnabled = YES;
	}
	return self;
}

-(BOOL)ccTouchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
	UITouch* touch = [touches anyObject];
	CGPoint location = [touch locationInView: [touch view]];
	location = [[Director sharedDirector] convertCoordinate: location];
	
	if (CGRectContainsPoint(boundingBox(exitButton), location)) {
		NSLog(@"Touches ended in GUILayer:exitButton at (%f, %f)", location.x, location.y);
		MenuScene* ms = [[SceneManager instance] menuScene];
		[[Director sharedDirector] replaceScene:ms];
		return kEventHandled;
	} else if (CGRectContainsPoint(boundingBox(pauseButton), location)) {
		NSLog(@"Touches ended in GUILayer:pauseButton at (%f, %f)", location.x, location.y);
		//MenuScene* ms = [[SceneManager instance] menuScene];
		//[[Director sharedDirector] replaceScene:ms];
		return kEventHandled;
	}
	return kEventIgnored;
}

-(void)dealloc {
	NSLog(@"GUILayer dealloc started..");
	[pauseButton release];
	[exitButton release];
	[super dealloc];
}

@end
