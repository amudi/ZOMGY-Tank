//
//  GameLayer.h
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/28/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "Hero.h"
#import "GUILayer.h"

@interface GameLayer : Layer {
	cpSpace* gameSpace;
	Hero* hero;
	GUILayer* guiLayer;
	NSMutableArray* enemies;
	BOOL firingMode;
}

@property (nonatomic, readonly) cpSpace* gameSpace;
@property (nonatomic, retain) Hero* hero;
@property (nonatomic, retain) GUILayer* guiLayer;
@property (nonatomic, retain) NSMutableArray* enemies;

-(void)initSpace;
-(void)addEntity:(Entity*)newEntity z:(NSInteger)z;
-(void)step:(ccTime)delta;

@end
