//
//  GameScene.m
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/26/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "GameScene.h"
#import "MenuScene.h"

@implementation GameScene

@synthesize bg;
@synthesize gameLayer;

-(id)init {
	self = [super init];
	if (self != nil) {
		bg = [Sprite spriteWithFile:@"game.png"];
		gameLayer = [GameLayer node];
		[bg setPosition:cpv(240, 160)];
		[self addChild:bg z:0];
		[self addChild:gameLayer z:1];
		NSLog(@"GameScene init success");
	}
	return self;
}

-(void)dealloc {
	NSLog(@"GameScene dealloc started");
	[bg release];
	[gameLayer release];
	[super dealloc];
}

@end
