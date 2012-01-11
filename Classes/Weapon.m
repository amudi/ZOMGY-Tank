//
//  Weapon.m
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/28/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "Weapon.h"


@implementation Weapon

@synthesize name;
@synthesize sprite;
@synthesize spriteName;
@synthesize damage;
@synthesize ammo;
@synthesize maxAmmo;
@synthesize range;
@synthesize particleEffect;
@synthesize projectile;

-(id)initWithFile:(NSString*)filename withParent:(Entity*)nodeParent {
	self = [super init];
	if (self != nil) {
		spriteName = filename;
		sprite = [Sprite spriteWithFile:spriteName];
		[sprite setPosition:[[nodeParent sprite] position]];
		particleEffect = [ParticleFire node];
		
		[self addChild:sprite z:[nodeParent zOrder]];
		[nodeParent addChild:self];
	}
	return self;
}

-(void)fireTo:(Entity*)target {
	[particleEffect setPosition:[[target sprite]position]];
	[self addChild:particleEffect z:ZOrdering_Particle tag:PhysicsBodyType_Particle];
}

-(void)stopFire {
	[self removeChild:particleEffect cleanup:NO];
}

-(void)moveTo:(CGPoint)newPosition withinDuration:(float)seconds {
	NSLog(@"Moving weapon to (%f, %f) in %d seconds", newPosition.x, newPosition.y, seconds);
	[self setFacing:newPosition withDuration:0];
	[sprite runAction:[MoveTo actionWithDuration:seconds position:newPosition]];
}

-(void)setFacing:(CGPoint)facing withDuration:(float)seconds {
	//float angle = atan2f((facing.y - position.y), (facing.x - position.x));
	float angle = RADIANS_TO_DEGREES(computeTheta([sprite position], facing));
	[sprite runAction:[RotateTo actionWithDuration:seconds angle:angle]];
}


-(void)dealloc {
	[projectile release];
	[particleEffect release];
	[super dealloc];
}

@end
