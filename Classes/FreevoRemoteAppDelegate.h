//
//  FreevoRemoteAppDelegate.h
//  FreevoRemote
//
//  Created by blunderer on 30/11/09.
//  Copyright blunderer 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FreevoRemoteViewController;

@interface FreevoRemoteAppDelegate : NSObject <UIApplicationDelegate, UITabBarDelegate> {
    UIWindow *window;
	NSMutableDictionary *saveSession;
    FreevoRemoteViewController *tabBarController;
;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FreevoRemoteViewController *tabBarController;
@property (nonatomic, retain) NSMutableDictionary *saveSession;

@end

