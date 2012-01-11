//
//  Util.h
//  ZOMGY Tank
//
//  Created by Amudi Sebastian on 3/28/09.
//  Copyright 2009 amudi.org. All rights reserved.
//

#ifdef __OBJC__
static inline CGRect boundingBox(Sprite* sprite) {
	return CGRectMake([sprite position].x-([sprite contentSize].width/2), [sprite position].y-([sprite contentSize].height/2), [sprite contentSize].width , [sprite contentSize].height);
}

/* Degrees / Radians conversion */
#define DEGREES_TO_RADIANS(__ANGLE__) ((__ANGLE__) / 180.0f * M_PI)
#define RADIANS_TO_DEGREES(__ANGLE__) ((__ANGLE__) / M_PI * 180.0f)

/*
 float CalcTheta( const JVEC2 Point1, const JVEC2 Point2 )
 {
 float Theta;
 if ( Point2.x - Point1.x == 0 )
 if ( Point2.y > Point1.y )
 Theta = 0;
 else
 Theta = static_cast<float>( PI );
 else
 {
 Theta = std::atan( (Point2.y - Point1.y) / (Point2.x - Point1.x) );
 if ( Point2.x > Point1.x )
 Theta = static_cast<float>( PI ) / 2.0f - Theta;
 else
 Theta = static_cast<float>( PI ) * 1.5f - Theta;
 };
 return Theta;
 }
 */
static float computeTheta(CGPoint p1, CGPoint p2) {
	float theta;
	if (p2.x - p1.x == 0) {
		if (p2.y > p1.y) {
			theta = 0;
		} else {
			theta = M_PI;
		}
	} else {
		theta = atanf((p2.y - p1.y) / (p2.x - p1.x));
		if (p2.x > p1.x) {
			theta = M_PI / 2.0f - theta;
		} else {
			theta = M_PI * 1.5f - theta;
		}
	}
	return theta;
}

#endif
