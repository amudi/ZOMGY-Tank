//
//  SceneManager.m
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/28/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "SceneManager.h"

@implementation SceneManager

//@synthesize menuScene;
//@synthesize gameScene;

static SceneManager* gInstance = nil;

-(id)init {
	self = [super init];
	if (self != nil) {
		NSLog(@"SceneManager init success");
	}
	return self;
}

-(MenuScene*)menuScene {
	if (menuScene != nil)
		return menuScene;
	menuScene = [MenuScene node];
	[menuScene retain];
	return menuScene;
}

-(GameScene*)gameScene {
	if (gameScene != nil)
		return gameScene;
	gameScene = [GameScene node];
	[gameScene retain];
	return gameScene;
}

-(void)dealloc {
	NSLog(@"SceneManager dealloc started");
	[gameScene release];
	[menuScene release];
	[super dealloc];
}

+(SceneManager*)instance {
	@synchronized(self) {
		if (gInstance == nil) {
			NSLog(@"SceneManager has not initialized, initializing now..");
			[[self alloc] init];
		}
	}
	return (gInstance);
}

+ (id)allocWithZone:(NSZone*)zone
{
    @synchronized(self) {
        if (gInstance == nil) {
			cpInitChipmunk();	// initialize chipmunk physics engine
            gInstance = [super allocWithZone:zone];
            return gInstance;  // assignment and return on first allocation
        }
    }
    return nil; //on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone*)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (unsigned)retainCount
{
    return UINT_MAX;  //denotes an object that cannot be released
} 

- (void)release
{
    //do nothing
}

- (id)autorelease
{
    return self;
}

@end
