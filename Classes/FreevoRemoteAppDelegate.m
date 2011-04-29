//
//  FreevoRemoteAppDelegate.m
//  FreevoRemote
//
//  Created by blunderer on 30/11/09.
//  Copyright blunderer 2009. All rights reserved.
//

#import "FreevoRemoteAppDelegate.h"
#import "FreevoRemoteViewController.h"
#import <sys/types.h>
#import <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h> 

@implementation FreevoRemoteAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize saveSession;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    saveSession = [[[NSUserDefaults standardUserDefaults] objectForKey:@"freevosession"] autorelease];
	printf("open session %p\n", saveSession);
	
	if(saveSession == nil) {
		saveSession = [[NSMutableDictionary alloc] initWithCapacity:10];
		[saveSession setObject:@"16310" forKey:@"port"];
		[saveSession setObject:@"192.168.0.1" forKey:@"address"];
		[saveSession setObject:@"UDP" forKey:@"protocol"];
		[saveSession setObject:@"LITE" forKey:@"displayMode"];
	}

	NSMutableDictionary *session = [(FreevoRemoteAppDelegate *)[[UIApplication sharedApplication] delegate] saveSession];
		
	printf("set destination %s://%s:%s using mode %s\n",
		   [[session objectForKey:@"protocol"] UTF8String], 
		   [[session objectForKey:@"address"] UTF8String], 
		   [[session objectForKey:@"port"] UTF8String],
		   [[session objectForKey:@"displayMode"] UTF8String]);
	
	[[tabBarController addressField] setText:[session objectForKey:@"address"]];
	[[tabBarController portField] setText:[session objectForKey:@"port"]];
	
	[tabBarController setConnectPort:atoi([[[tabBarController portField] text] UTF8String])];
	[tabBarController setConnectAddr:[[tabBarController addressField] text]];
	
	if([[session objectForKey:@"protocol"] isEqualToString:@"UDP"]) {
		printf("set UDP\n");
		[tabBarController setConnectProtocol:SOCK_DGRAM];
		[[tabBarController protocolToggle] setSelectedSegmentIndex:0];
	} else if([[session objectForKey:@"protocol"] isEqualToString:@"TCP"]) {
		printf("set TCP\n");
		[tabBarController setConnectProtocol:SOCK_STREAM];
		[[tabBarController protocolToggle] setSelectedSegmentIndex:1];
	}	
	[tabBarController setConnectProtocol:SOCK_DGRAM];
	
	if([[session objectForKey:@"displayMode"] isEqualToString:@"LITE"]) {
		printf("set easy\n");
		[tabBarController setEasy];
		[[tabBarController displayModeToggle] setSelectedSegmentIndex:0];
	} else if([[session objectForKey:@"displayMode"] isEqualToString:@"FULL"]) {
		printf("set full\n");
		[tabBarController setFull];
		[[tabBarController displayModeToggle] setSelectedSegmentIndex:1];
	}
	
	[tabBarController connectToMP];
	
	printf("init done\n");

    // Override point for customization after app launch    
	[window addSubview:tabBarController.view];

    [window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application {	
	[tabBarController closeAll];
	printf("-> %s\n", [[saveSession objectForKey:@"port"] UTF8String]);
	printf("-> %s\n", [[saveSession objectForKey:@"address"] UTF8String]);
	printf("-> %s\n", [[saveSession objectForKey:@"protocol"] UTF8String]);
	printf("-> %s\n", [[saveSession objectForKey:@"displayMode"] UTF8String]);
	[[NSUserDefaults standardUserDefaults] setObject:saveSession forKey:@"freevosession"];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)dealloc {
    [tabBarController release];
    [window release];
    [super dealloc];
}


@end
