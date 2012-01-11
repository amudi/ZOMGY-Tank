//
//  ZOMGY_TankAppDelegate.m
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/25/09.
//  Copyright amudi.org 2009. All rights reserved.
//

#import "ZOMGY_TankAppDelegate.h"
#import "SceneManager.h"

@implementation ZOMGY_TankAppDelegate


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	UIWindow* window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[window setUserInteractionEnabled:YES];
	[window setMultipleTouchEnabled:YES];
	[[Director sharedDirector] setLandscape:YES];
	[[Director sharedDirector] attachInView:window];
	
	[window makeKeyAndVisible];
	SceneManager* sm = [SceneManager instance];
	MenuScene* ms = [sm menuScene];
	if (ms != nil) {
		NSLog(@"Starting app with MenuScene...");
		[[Director sharedDirector] runWithScene:ms];
	}
}

// getting a call, pause the game
-(void) applicationWillResignActive:(UIApplication *)application
{
	[[Director sharedDirector] pause];
}

// call got rejected
-(void) applicationDidBecomeActive:(UIApplication *)application
{
	[[Director sharedDirector] resume];
}

// purge memroy
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
	[[TextureMgr sharedTextureMgr] removeAllTextures];
}

// next delta time will be zero
-(void) applicationSignificantTimeChange:(UIApplication *)application
{
	[[Director sharedDirector] setNextDeltaTimeZero:YES];
}

@end
