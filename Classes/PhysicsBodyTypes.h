//
//  EntityTypes.h
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/28/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

typedef enum _PhysicsBodyTypes {
	PhysicsBodyType_Unknown = 0,
	PhysicsBodyType_Environment,
	PhysicsBodyType_Enemy,
	PhysicsBodyType_Player,
	PhysicsBodyType_Enemy_Projectile,
	PhysicsBodyType_Player_Projectile,
	PhysicsBodyType_Particle
} PhysicsBodyTypes;
