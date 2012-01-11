//
//  MenuScene.h
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/25/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "MenuLayer.h"

@interface MenuScene : Scene {
	Sprite* bg;
	MenuLayer* menuLayer;
}

@property (nonatomic, retain) Sprite* bg;
@property (nonatomic, retain) MenuLayer* menuLayer;

@end
