//
//  SceneManager.h
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/28/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "MenuScene.h"
#import "GameScene.h"

@interface SceneManager : NSObject {
	MenuScene* menuScene;
	GameScene* gameScene;
}

-(MenuScene*)menuScene;
-(GameScene*)gameScene;
+(SceneManager*)instance;

@end
