//
//  Enemy.h
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/29/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "MovableEntity.h"

@interface Enemy : MovableEntity {
	BOOL isTargeted;
}

@property (nonatomic, assign) BOOL isTargeted;

@end
