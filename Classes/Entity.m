//
//  Entity.m
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/27/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "Entity.h"

@implementation Entity

@synthesize shape;
@synthesize sprite;

-(id)init {
	self = [super init];
	if (self != nil) {
		
	}
	return self;
}

-(id)initWithSprite:(NSString*)spriteName position:(CGPoint)initialPosition type:(PhysicsBodyTypes)entityType {
	self = [super init];
	if (self != nil) {
		type = entityType;
		isTouchEnabled = YES;
		
		sprite = [Sprite spriteWithFile:spriteName];
		[sprite setPosition:initialPosition];
		NSInteger numVerts = 4;
		CGRect bound = boundingBox(sprite);
		cpVect verts[] = {cpv(bound.origin.x, bound.origin.y), cpv(bound.origin.x, bound.origin.y+bound.size.height), 
						  cpv(bound.origin.x+bound.size.width, bound.origin.y), cpv(bound.origin.x+bound.size.width, bound.origin.y+bound.size.height)};
		
		// physics body
		cpBody* body = cpBodyNew(1.0, cpMomentForPoly(1.0, numVerts, verts, cpvzero));
		body->p = cpv(initialPosition.x, initialPosition.y);
		shape = cpPolyShapeNew(body, 4, verts, cpv(0, 0));
		shape->data = sprite;
		shape->collision_type = type;
		
		[self addChild:sprite];
		
		NSLog(@"Entity with sprite:%s (%d, %d) boundingbox:[(%d, %d), %d, %d]", [spriteName cStringUsingEncoding:NSUTF8StringEncoding], [sprite position].x, [sprite position].y, boundingBox(sprite).origin.x, boundingBox(sprite).origin.y, boundingBox(sprite).size.width, boundingBox(sprite).size.height); 
	}
	return self;
}

-(void)setType:(PhysicsBodyTypes) newType {
	type = newType;
	shape->collision_type = type;
}

-(BOOL)ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
	return kEventIgnored;
}

-(BOOL)ccTouchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
	return kEventIgnored;
}

-(BOOL)ccTouchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
	return kEventIgnored;
}

// TODO: dealloc body and shape
-(void)dealloc {
	[sprite release];
	[super dealloc];
}

@end
