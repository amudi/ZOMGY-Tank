//
//  MovableEntity.m
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/28/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "MovableEntity.h"
#import "InstantAction.h"
#import "IntervalAction.h"

@implementation MovableEntity

@synthesize speed;
@synthesize hp;
@synthesize maxHp;
@synthesize weapon;

-(void)setPosition:(CGPoint)newPosition {
	NSLog(@"Set position to (%f, %f)", newPosition.x, newPosition.y);
	[self shape]->body->p = newPosition;
	//[sprite setPosition:newPosition];
}

-(void)moveTo:(CGPoint)newPosition withinDuration:(float)seconds {
	NSLog(@"Moving to (%f, %f) in %d seconds", newPosition.x, newPosition.y, seconds);
	[self setFacing:newPosition withDuration:0];
	[sprite runAction:[MoveTo actionWithDuration:seconds position:newPosition]];
}

-(void)setFacing:(CGPoint)facing withDuration:(float)seconds {
	//float angle = atan2f((facing.y - position.y), (facing.x - position.x));
	float angle = RADIANS_TO_DEGREES(computeTheta([sprite position], facing));
	[sprite runAction:[RotateTo actionWithDuration:seconds angle:angle]];
}

-(void)dealloc {
	[weapon release];
	[super dealloc];
}

@end
