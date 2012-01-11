//
//  ZOrderings.h
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 4/4/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

typedef enum _ZOrderings {
	ZOrdering_Unknown = 0,
	ZOrdering_Environment,
	ZOrdering_Enemy,
	ZOrdering_Player,
	ZOrdering_Enemy_Projectile,
	ZOrdering_Player_Projectile,
	ZOrdering_Particle,
	ZOrdering_GUI	// maybe GUI should always be on top
} ZOrderings;
