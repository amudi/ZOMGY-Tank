//
//  Projectile.h
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/28/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "PhysicsBodyTypes.h";

@interface Projectile : Sprite {
	PhysicsBodyTypes type;
	NSInteger velocity;
	ParticleSystem* particleEffect;
}

@property (nonatomic, assign) PhysicsBodyTypes type;
@property (nonatomic, assign) NSInteger velocity;
@property (nonatomic, retain) ParticleSystem* particleEffect;

@end
