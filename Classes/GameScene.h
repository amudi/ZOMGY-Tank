//
//  GameScene.h
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/26/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "GameLayer.h"

@interface GameScene : Scene {
	Sprite* bg;
	GameLayer* gameLayer;
}

@property (nonatomic, retain) Sprite* bg;
@property (nonatomic, retain) GameLayer* gameLayer;

@end
