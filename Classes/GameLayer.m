//
//  GameLayer.m
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/28/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#import "GameLayer.h"
#import "SceneManager.h"
#import "Enemy.h"

static void eachShape(void *ptr, void* unused){
	cpShape *shape = (cpShape*) ptr;
	Sprite *sprite = shape->data;
	if(sprite) {
		cpBody *body = shape->body;
		[sprite setPosition: cpv( body->p.x, body->p.y)];
		[sprite setRotation: RADIANS_TO_DEGREES( -body->a )];
	}
}

extern int playerHitEnvironment(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data);
extern int playerHitPlayer(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data);
extern int playerHitEnemy(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data);
extern int playerHitEnemyProjectile(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data);
extern int playerHitPlayerProjectile(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data);
extern int enemyHitEnvironment(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data);
extern int enemyHitPlayer(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data);
extern int enemyHitEnemy(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data);
extern int enemyHitEnemyProjectile(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data);
extern int enemyHitPlayerProjectile(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data);

@implementation GameLayer

@synthesize gameSpace;
@synthesize hero;
@synthesize guiLayer;
@synthesize enemies;

-(id)init {
	self = [super init];
	if (self != nil) {
		[self initSpace];
		hero = [Hero node];
		guiLayer = [GUILayer node];
		enemies = [[NSMutableArray alloc] init];
		[enemies addObject:[Enemy node]];
		
		NSLog(@"Adding Hero to GameLayer");
		[self addEntity:hero z:ZOrdering_Player];
		for (NSInteger i = 0; i < [enemies count]; ++i) {
			NSLog(@"Adding enemies No.%d to GameLayer", i);
			[self addEntity:[enemies objectAtIndex:i] z:ZOrdering_Enemy];
		}
		
		[self addChild:guiLayer z:ZOrdering_GUI];
		isTouchEnabled = YES;
		[self schedule:@selector(step:)];
		NSLog(@"GameLayer init success");
	}
	return self;
}

-(void)initSpace {
	gameSpace = cpSpaceNew();
	//gameSpace->gravity = cpv(0, -500);
	cpSpaceResizeStaticHash(gameSpace, 400.0f, 40);
	cpSpaceResizeActiveHash(gameSpace, 100, 600);
	
	/*
	 Collision Pair Function for:
	 PhysicsBodyType_Environment,
	 PhysicsBodyType_Enemy,
	 PhysicsBodyType_Player,
	 PhysicsBodyType_Enemy_Projectile,
	 PhysicsBodyType_Player_Projectile,
	 PhysicsBodyType_Particle
	 */
	cpSpaceAddCollisionPairFunc(gameSpace, PhysicsBodyType_Player, PhysicsBodyType_Environment, &playerHitEnvironment, nil);
	cpSpaceAddCollisionPairFunc(gameSpace, PhysicsBodyType_Player, PhysicsBodyType_Player, &playerHitPlayer, nil);
	cpSpaceAddCollisionPairFunc(gameSpace, PhysicsBodyType_Player, PhysicsBodyType_Enemy, &playerHitEnemy, nil);
	cpSpaceAddCollisionPairFunc(gameSpace, PhysicsBodyType_Player, PhysicsBodyType_Enemy_Projectile, &playerHitEnemyProjectile, nil);
	cpSpaceAddCollisionPairFunc(gameSpace, PhysicsBodyType_Player, PhysicsBodyType_Player_Projectile, &playerHitPlayerProjectile, nil);
	
	cpSpaceAddCollisionPairFunc(gameSpace, PhysicsBodyType_Enemy, PhysicsBodyType_Environment, &enemyHitEnvironment, nil);
	cpSpaceAddCollisionPairFunc(gameSpace, PhysicsBodyType_Enemy, PhysicsBodyType_Player, &enemyHitPlayer, nil);
	cpSpaceAddCollisionPairFunc(gameSpace, PhysicsBodyType_Enemy, PhysicsBodyType_Enemy, &enemyHitEnemy, nil);
	cpSpaceAddCollisionPairFunc(gameSpace, PhysicsBodyType_Enemy, PhysicsBodyType_Enemy_Projectile, &enemyHitEnemyProjectile, nil);
	cpSpaceAddCollisionPairFunc(gameSpace, PhysicsBodyType_Enemy, PhysicsBodyType_Player_Projectile, &enemyHitPlayerProjectile, nil);
}

-(void)addEntity:(Entity*)newEntity z:(NSInteger)z {
	cpSpaceAddShape(gameSpace, [newEntity shape]);
	[self addChild:newEntity z:z];
}

-(void)step:(ccTime)delta {
	int steps = 2;
	cpFloat dt = delta/(cpFloat)steps;
	for(int i=0; i<steps; i++){
		cpSpaceStep(gameSpace, dt);
	}
	//cpSpaceHashEach(gameSpace->activeShapes, &eachShape, nil);
	//cpSpaceHashEach(gameSpace->staticShapes, &eachShape, nil);
}

-(BOOL)ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
	UITouch* touch = [touches anyObject];
	CGPoint location = [touch locationInView: [touch view]];
	location = [[Director sharedDirector] convertCoordinate: location];
	NSLog(@"Touches started in GameLayer at (%f, %f)", location.x, location.y);
	for (NSInteger i = 0; i < [enemies count]; ++i) {
		Enemy* currentEnemy = [enemies objectAtIndex:i];
		if (CGRectContainsPoint(boundingBox([currentEnemy sprite]), location)) {
			if ([currentEnemy isTargeted]) {
				NSLog(@"Targeted enemy selected, firing mode");
				firingMode = YES;
				[hero setTarget:currentEnemy];
				[hero fire];
				return kEventHandled;
			}
		} else {
			// touches began NOT in the enemies, start moving;
			NSLog(@"Touches began NOT in the enemies, start moving heroes");
			[hero moveTo:location withinDuration:3.0];
			//[hero shape]->body->p = location;
			//[hero shape]->body->a = [[hero sprite] rotation];
			return kEventHandled;
		}
	}
	
	return kEventIgnored;
}

-(BOOL)ccTouchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
	UITouch* touch = [touches anyObject];
	CGPoint location = [touch locationInView: [touch view]];
	location = [[Director sharedDirector] convertCoordinate: location];
	NSLog(@"Touches ended in GameLayer at (%f, %f)", location.x, location.y);
	
	if (firingMode) {
		NSLog(@"Stop firing mode");
		[[hero weapon] stopFire];
		firingMode = NO;
	}
	
	// touches ended on hero
	if (CGRectContainsPoint(boundingBox([hero sprite]), location)) {
		NSLog(@"Hero selected, untargetting all enemies now");
		for (NSInteger i = 0; i < [enemies count]; ++i) {
			[[enemies objectAtIndex:i] setIsTargeted:NO];
		}
		return kEventHandled;
	} else {
		for (NSInteger i = 0; i < [enemies count]; ++i) {
			// touches ended on one of the enemies
			Enemy* currentEnemy = [enemies objectAtIndex:i];
			if (CGRectContainsPoint(boundingBox([currentEnemy sprite]), location)) {
				NSLog(@"Enemy selected, targeting enemy now");
				[currentEnemy setIsTargeted:YES];
				return kEventHandled;
			}
		}
	}
	
	return kEventIgnored;
}

-(void)dealloc {
	NSLog(@"GameLayer dealloc started..");
	[enemies release];
	[hero release];
	[guiLayer release];
	cpSpaceFree(gameSpace);
	[super dealloc];
}

@end
