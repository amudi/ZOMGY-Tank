//
//  GUILayer.h
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/28/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

@interface GUILayer : Layer {
	Sprite* exitButton;
	Sprite* pauseButton;
}

@property (nonatomic, retain) Sprite* exitButton;
@property (nonatomic, retain) Sprite* pauseButton;

@end
