//
//  MenuLayer.h
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/28/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "GameScene.h"

@interface MenuLayer : Layer {
	GameScene* gameScene;
	Menu* menu;
	MenuItem* start;
	MenuItem* help;
	//MenuItem* quit;
}

@property (nonatomic, retain) GameScene* gameScene;
@property (nonatomic, retain) Menu* menu;
@property (nonatomic, retain) MenuItem* start;
@property (nonatomic, retain) MenuItem* help;
//@property (nonatomic, retain) MenuItem* quit;

-(void)startGame: (id)sender;
-(void)help: (id)sender;
//-(void)quit: (id)sender;

@end

