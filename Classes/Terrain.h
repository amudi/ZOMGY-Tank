//
//  Terrain.h
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/26/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

@interface Terrain {
	NSMutableArray* tiles;	// array of TerrainTile
	
}
@property (nonatomic, retain) NSMutableArray* tiles;

-(void)draw;

@end

@interface TerrainTile : Layer {
	NSString* imageFilename;
}

@end
