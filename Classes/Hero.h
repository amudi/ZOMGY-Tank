//
//  Hero.h
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/26/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "MovableEntity.h"

// hero class, singleton
@interface Hero : MovableEntity {
	BOOL isSelected;
	Entity* target;	// current enemy target
}

@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, retain) Entity* target;

-(void)fire;

@end
