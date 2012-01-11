//
//  Projectile.m
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/28/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "Projectile.h"


@implementation Projectile

@synthesize type;
@synthesize velocity;
@synthesize particleEffect;

-(void)dealloc {
	[particleEffect release];
	[super dealloc];
}

@end
