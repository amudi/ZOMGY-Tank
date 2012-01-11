//
//  MovableEntity.h
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/28/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "Entity.h"
#import "Movable.h"
#import "Weapon.h"

@interface MovableEntity : Entity <Movable> {
	NSInteger speed;
	NSInteger hp;
	NSInteger maxHp;
	Weapon* weapon;
}

@property (nonatomic, assign) NSInteger speed;
@property (nonatomic, assign) NSInteger hp;
@property (nonatomic, assign) NSInteger maxHp;
@property (nonatomic, retain) Weapon* weapon;

-(void)setPosition:(CGPoint)newPosition;
-(void)moveTo:(CGPoint)newPosition withinDuration:(float)seconds;

@end
