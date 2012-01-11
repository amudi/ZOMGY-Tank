//
//  PhysicsCollisions.m
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 4/4/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

int playerHitEnvironment(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data) {
	NSLog(@"playerHitEnvironment");
	return 0;
}

int playerHitPlayer(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data) {
	NSLog(@"playerHitPlayer");
	return 0;
}

int playerHitEnemy(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data) {
	NSLog(@"playerHitEnemy");
	return 0;
}

int playerHitEnemyProjectile(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data) {
	NSLog(@"playerHitEnemyProjectile");
	return 0;
}

int playerHitPlayerProjectile(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data) {
	NSLog(@"playerHitPlayerProjectile");
	return 0;
}


int enemyHitEnvironment(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data) {
	NSLog(@"enemyHitEnvironment");
	return 0;
}

int enemyHitPlayer(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data) {
	NSLog(@"enemyHitPlayer");
	return 0;
}

int enemyHitEnemy(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data) {
	NSLog(@"enemyHitEnemy");
	return 0;
}

int enemyHitEnemyProjectile(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data) {
	NSLog(@"enemyHitEnemyProjectile");
	return 0;
}

int enemyHitPlayerProjectile(cpShape *a, cpShape *b, cpContact *contacts, int numContacts, cpFloat normal_coef, void *data) {
	NSLog(@"enemyHitPlayerProjectile");
	return 0;
}
