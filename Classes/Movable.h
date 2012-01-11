//
//  Movable.h
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/27/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

@protocol Movable

-(void)setPosition:(CGPoint) newPosition;
-(void)moveTo:(CGPoint) newPosition withinDuration:(float) milliseconds;
-(void)setFacing:(CGPoint)facing withDuration:(float)seconds;

@end