//
//  Entity.h
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/27/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

@interface Entity : Layer {
	cpShape* shape;
	Sprite* sprite;
	PhysicsBodyTypes type;
}

@property (nonatomic, readonly) cpShape* shape;
@property (nonatomic, retain) Sprite* sprite;

-(id)initWithSprite:(NSString*)spriteName position:(CGPoint)initialPosition type:(PhysicsBodyTypes)entityType;
-(void)setType:(PhysicsBodyTypes)newType;

@end
