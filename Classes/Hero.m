//
//  Hero.m
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/26/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "Hero.h"


@implementation Hero

@synthesize isSelected;
@synthesize target;

-(id)init {
	self = [super initWithSprite:@"tank.png" position:cpv(110, 220) type:PhysicsBodyType_Player];
	weapon = [[Weapon alloc] initWithFile:@"weapon 1.png" withParent:self];
	isTouchEnabled = YES;
	return self;
}

-(void)setPosition:(CGPoint)newPosition {
	//NSLog(@"Set Hero position to (%f, %f)", newPosition.x, newPosition.y);
	[super setPosition:newPosition];
	[weapon setPosition:newPosition];
}

-(void)moveTo:(CGPoint)newPosition withinDuration:(float)seconds {
	NSLog(@"Moving Hero to (%f, %f) in %d seconds", newPosition.x, newPosition.y, seconds);
	[super moveTo:newPosition withinDuration:seconds];
	[weapon moveTo:newPosition withinDuration:seconds];
}

-(void)fire {
	NSLog(@"hero firing to (%d, %d) from (%d, %d)", [target position].x, [target position].y, [self position].x, [self position].y);
	[weapon fireTo:target];
}

-(void)dealloc {
	[target release];
	[super dealloc];
}
		
@end
