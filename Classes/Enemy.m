//
//  Enemy.m
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/29/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "Enemy.h"

@implementation Enemy

@synthesize isTargeted;

-(id)init {
	self = [super initWithSprite:@"enemy tank.png" position:cpv(150, 170) type:PhysicsBodyType_Enemy];
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
	NSLog(@"Moving Enemy to (%f, %f) in %d seconds", newPosition.x, newPosition.y, seconds);
	[super moveTo:newPosition withinDuration:seconds];
	[weapon moveTo:newPosition withinDuration:seconds];
}

@end
