//
//  Weapon.h
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/28/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "Entity.h"
#import "Movable.h"
#import "Projectile.h"

@interface Weapon : Layer <Movable> {
	NSString* name;
	Sprite* sprite;
	NSString* spriteName;
	NSInteger damage;
	NSInteger ammo;
	NSInteger maxAmmo;
	NSInteger range;
	ParticleSystem* particleEffect;
	Projectile* projectile;
}

@property (nonatomic, copy) NSString* name;
@property (nonatomic, retain) Sprite* sprite;
@property (nonatomic, copy) NSString* spriteName;
@property (nonatomic, assign) NSInteger damage;
@property (nonatomic, assign) NSInteger ammo;
@property (nonatomic, assign) NSInteger maxAmmo;
@property (nonatomic, assign) NSInteger range;
@property (nonatomic, retain) ParticleSystem* particleEffect;
@property (nonatomic, retain) Projectile* projectile;

-(id)initWithFile:(NSString*)filename withParent:(Entity*)nodeParent;
-(void)fireTo:(Entity*)target;
-(void)stopFire;

@end
