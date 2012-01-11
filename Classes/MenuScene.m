//
//  MenuScene.m
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/25/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "MenuScene.h"
#import "GameScene.h"

@implementation MenuScene

@synthesize bg;
@synthesize menuLayer;

-(id)init {
	self = [super init];
	if (self != nil) {
		bg = [Sprite spriteWithFile:@"menu.png"];
		menuLayer = [MenuLayer node];
		[bg setPosition:cpv(240, 160)];
		[self addChild:bg z:0];
		[self addChild:menuLayer z:1];
		NSLog(@"MenuScene init success");
	}
	return self;
}

-(void)dealloc {
	NSLog(@"MenuScene dealloc started..");
	[menuLayer release];
	[bg release];
	[super dealloc];
}

@end
