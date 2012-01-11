//
//  MenuLayer.m
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/28/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "MenuLayer.h"
#import "SceneManager.h"

@implementation MenuLayer

@synthesize gameScene;
@synthesize menu;
@synthesize start;
@synthesize help;
//@synthesize quit;

-(id)init {
	self = [super init];
	if (self != nil) {
		[MenuItemFont setFontSize:20];
		[MenuItemFont setFontName:@"Helvetica"];
		start = [MenuItemFont itemFromString:@"Start Game" target:self selector:@selector(startGame:)];
		help = [MenuItemFont itemFromString:@"Help" target:self selector:@selector(help:)];
		//quit = [MenuItemFont itemFromString:@"Quit" target:self selector:@selector(quit:)];
		menu = [Menu menuWithItems:start, help, nil];
		[menu alignItemsVertically];
		[self addChild:menu];
		NSLog(@"MenuLayer init success");
	}
	return self;
}

-(void)startGame:(id)sender {
	NSLog(@"Start Game");
	gameScene = [[SceneManager instance] gameScene];
	[[Director sharedDirector] replaceScene:gameScene];
}

-(void)help:(id)sender {
	NSLog(@"Help");
}

//-(void)quit:(id)sender {
//	NSLog(@"Quit");
//}

-(void)dealloc {
	NSLog(@"MenuLayer dealloc started..");
	//[quit release];
	[help release];
	[start release];
	[menu release];
	[gameScene release];
	[super dealloc];
}

@end
