//
//  UISlideWidget.m
//
//  Created by blunderer on 09/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "UISlideWidget.h"

@implementation UISlideWidget

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	printf("1\n");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	printf("2\n");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	printf("3\n");
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	printf("4\n");
}

@end
