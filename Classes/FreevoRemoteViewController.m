//
//  FreevoRemoteViewController.m
//  FreevoRemote
//
//  Created by blunderer on 30/11/09.
//  Copyright blunderer 2009. All rights reserved.
//

#import <sys/types.h>
#import <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h> 
#import "FreevoRemoteAppDelegate.h"
#import "FreevoRemoteViewController.h"


char repetition[20] = {1, 1, 1, 1, 2, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9};

char commands[40][10] = {
	{ 'U', 'P', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// UP
	{ 'D', 'O', 'W', 'N', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// DOWN
	{ 'L', 'E', 'F', 'T', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// LEFT
	{ 'R', 'I', 'G', 'H', 'T', 0x0, 0x0, 0x0, 0x0, 0x0 },	// RIGHT
	{ 'S', 'E', 'L', 'E', 'C', 'T', 0x0, 0x0, 0x0, 0x0 },	// SELECT: FULL
	{ 'E', 'N', 'T', 'E', 'R', 0x0, 0x0, 0x0, 0x0, 0x0 },	// ENTER
	{ 'E', 'J', 'E', 'C', 'T', 0x0, 0x0, 0x0, 0x0, 0x0 },	// EJECT
	{ 'E', 'X', 'I', 'T', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// EXIT	
	{ 'M', 'E', 'N', 'U', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// MENU
	{ 'M', 'U', 'T', 'E', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// MUTE
	{ 'D', 'I', 'S', 'P', 'L', 'A', 'Y', 0x0, 0x0, 0x0 },	// DISPLAY: FULL
	{ 'C', 'H', '+', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// CH+
	{ 'C', 'H', '-', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// CH-
	{ 'V', 'O', 'L', '+', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// VOL+
	{ 'V', 'O', 'L', '-', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// VOL-
	{ 'P', 'L', 'A', 'Y', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// PLAY
	{ 'S', 'T', 'O', 'P', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// STOP
	{ 'P', 'A', 'U', 'S', 'E', 0x0, 0x0, 0x0, 0x0, 0x0 },	// PAUSE
	{ 'R', 'E', 'C', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// REC
	{ 'R', 'E', 'W', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// REW
	{ 'F', 'F', 'W', 'D', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// FFWD
	{ 'L', 'A', 'N', 'G', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// LANG: FULL
	{ 'S', 'U', 'B', 'T', 'I', 'T', 'L', 'E', 0x0, 0x0 },	// SUBTITLE: FULL
	{ 'A', 'N', 'G', 'L', 'E', 0x0, 0x0, 0x0, 0x0, 0x0 },	// ANGLE: FULL
	{ 'G', 'U', 'I', 'D', 'E', 0x0, 0x0, 0x0, 0x0, 0x0 },	// GUIDE: FULL
	{ 'V', 'I', 'D', 'E', 'O', 'S', 0x0, 0x0, 0x0, 0x0 },	// VIDEOS: FULL
	{ 'M', 'U', 'S', 'I', 'C', 0x0, 0x0, 0x0, 0x0, 0x0 },	// MUSIC: FULL
	{ 'T', 'V', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// TV: FULL
	{ 'P', 'I', 'C', 'T', 'U', 'R', 'E', 'S', 0x0, 0x0 },	// PICTURES: FULL
	{ 'S', 'H', 'U', 'T', 'D', 'O', 'W', 'N', 0x0, 0x0 },	// SHUTDOWN: FULL
	{ '0', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// 0
	{ '1', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// 1
	{ '2', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// 2
	{ '3', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// 3
	{ '4', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// 4
	{ '5', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// 5
	{ '6', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// 6
	{ '7', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// 7
	{ '8', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 },	// 8
	{ '9', 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 }	// 9
};

@implementation FreevoRemoteViewController

@synthesize status;
@synthesize connectPort;
@synthesize connectAddr;
@synthesize connectProtocol;
@synthesize titleBar;
@synthesize optionsView;
@synthesize controlView;
@synthesize addressField;
@synthesize portField;
@synthesize protocolToggle;
@synthesize displayModeToggle;
@synthesize topWidget;
@synthesize protocolPicker;

@synthesize btnUP;	
@synthesize btnDOWN;
@synthesize btnLEFT;
@synthesize btnRIGHT;
@synthesize btnSELECT;
@synthesize btnENTER;
@synthesize btnEJECT;
@synthesize btnEXIT;
@synthesize btnMENU;
@synthesize btnMUTE;
@synthesize btnDISPLAY;
@synthesize btnCHP;
@synthesize btnCHM;
@synthesize btnVOLP;
@synthesize btnVOLM;
@synthesize btnPLAY;
@synthesize btnSTOP;
@synthesize btnPAUSE;
@synthesize btnREC;
@synthesize btnREW;
@synthesize btnFFWD;
@synthesize btnLANG;
@synthesize btnSUBTITLE;
@synthesize btnANGLE;
@synthesize btnGUIDE;
@synthesize btnVIDEOS;
@synthesize btnMUSIC;
@synthesize btnTV;
@synthesize btnPICTURES;
@synthesize btnSHUTDOWN;
@synthesize btn0;
@synthesize btn1;
@synthesize btn2;
@synthesize btn3;
@synthesize btn4;
@synthesize btn5;
@synthesize btn6;
@synthesize btn7;
@synthesize btn8;
@synthesize btn9;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	slideControlPanel = 0;
	[status setText:@"Menu Mode"];
	[protocolPicker setDelegate:self];
	[protocolPicker setDataSource:self];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	switch(row) {
		case 0:
			return @"PowerPoint";
		case 1:
			return @"Keynote";
		case 2:
			return @"VLC";
		case 3:
			return @"Freevo";
		case 4:
			return @"XBMC";
	}
	return @"";
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return 4;
}


- (IBAction)togglePanel
{
	slideControlPanel = (slideControlPanel+1)%2;
	if(slideControlPanel == 0) {
		[status setText:@"Menu Mode"];
	} else {
		[status setText:@"Player Mode"];
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSArray * touchtable = [touches allObjects];
	UITouch * str = [touchtable objectAtIndex:0];

	if([self selectedIndex] != 0) {
		return;
	}
	
	if([touches count] > 1) {
		slideControlMulti = 1;
	}
	
	slideControlType = 0;
	CGPoint start_point = [str locationInView:topWidget];
	if(start_point.x < 80) {
		slideControlType = 1;
	}
	
	slideControlXprev = start_point.x; 
	slideControlYprev = start_point.y; 
	slideControlXorg = start_point.x; 
	slideControlYorg = start_point.y; 
	slideControlNumber = 0;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSArray * touchtable = [touches allObjects];
	UITouch * str = [touchtable objectAtIndex:0];
	CGPoint cur_point = [str locationInView:topWidget];

	if([self selectedIndex] != 0) {
		return;
	}
	
	if(slideControlNumber < 0) {
		return;
	}
	
	if([touches count] > 1) {
		slideControlMulti = 1;
	}
		
	int deltaX = slideControlXprev - cur_point.x;
	int deltaY = slideControlYprev - cur_point.y;
	slideControlXprev = cur_point.x; 
	slideControlYprev = cur_point.y;	
	slideControlNumber++;
	
	if(slideControlMulti == 0) {
		if(slideControlNumber < 2) {
			// don't do anything
		} if(slideControlNumber < 15) {
			// lock direction
			if(abs(deltaX) > abs(deltaY)) {
				if(deltaX > 0) {
					slideControlDirection = CMD_LEFT;				
				} else {
					slideControlDirection = CMD_RIGHT;				
				}
			} else if(abs(deltaY) > abs(deltaX)) {
				if(deltaY > 0) {
					slideControlDirection = CMD_UP;				
				} else {
					slideControlDirection = CMD_DOWN;				
				}		}
		} else if(slideControlNumber < 40) {
			// first repetition step
			if((slideControlNumber % 6) == 0) {
				[self execCmd:slideControlDirection];
			}
		} else if(slideControlNumber < 60) {
			// second repetition step
			if((slideControlNumber % 4) == 0) {
				[self execCmd:slideControlDirection];
			}	
		} else {
			// third repetition step
			if((slideControlNumber % 2) == 0) {
				[self execCmd:slideControlDirection];
			}
		}
	} else {
		if([touchtable count] > 1) {
			UITouch * str2 = [touchtable objectAtIndex:1];
			if(slideControlDist == 0) {
				CGPoint cur_point2 = [str2 locationInView:topWidget];
				float dx = cur_point2.x-cur_point.x;
				float dy = cur_point2.y-cur_point.y;
				float dx2 = dx*dx;
				float dy2 = dy*dy;
				slideControlDist = sqrt(dx2+dy2);
				slideControlLastDist = slideControlDist;
			} else {
				CGPoint cur_point2 = [str2 locationInView:topWidget];
				float dx = cur_point2.x-cur_point.x;
				float dy = cur_point2.y-cur_point.y;
				float dx2 = dx*dx;
				float dy2 = dy*dy;
				slideControlLastDist = sqrt(dx2+dy2);
			}
		}
	}
}
	
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSArray * touchtable = [touches allObjects];
	UITouch * str = [touchtable objectAtIndex:0];
	CGPoint stop_point = [str locationInView:topWidget];
	int deltaX = stop_point.x - slideControlXorg;
	int deltaY = stop_point.y - slideControlYorg;
	
	if([self selectedIndex] != 0) {
		return;
	}
	
	if(slideControlNumber < 0) {
		return;
	}
	
	if(slideControlMulti == 0) {
		if(slideControlNumber < 16) {
			if((abs(deltaX) < 40)&&(abs(deltaY) < 40)) {
				printf("%d clicks for %s\n",[str tapCount],slideControlType==0?"pad":"sound");
				[self execCmd:CMD_SELECT];
			} else {
				if(abs(deltaX) > abs(deltaY)) {
					printf("delta %d -> %s\n",deltaX, deltaX>0?"RIGHT":"LEFT");
					if(deltaX > 0) {
						[self execCmd:CMD_RIGHT];
					} else {
						[self execCmd:CMD_LEFT];
					}
				} else if(abs(deltaY) > abs(deltaX)) {
					printf("delta %d -> %s\n",deltaY, deltaY>0?"DOWN":"UP");
					if(deltaY > 0) {
						[self execCmd:CMD_DOWN];
					} else {
						[self execCmd:CMD_UP];
					}
				}
			}
		} else {
			printf("delta %d, %d\n",deltaX, deltaY);
		}
	} else {
		double endDist;
		if([touchtable count] > 1) {
			UITouch * str2 = [touchtable objectAtIndex:1];
			CGPoint cur_point2 = [str2 locationInView:topWidget];
			float dx = cur_point2.x-stop_point.x;
			float dy = cur_point2.y-stop_point.y;
			float dx2 = dx*dx;
			float dy2 = dy*dy;
			endDist = sqrt(dx2+dy2);			
		} else {
			endDist = slideControlLastDist;
		}

		if(endDist > slideControlDist) {
			[self execCmd:CMD_ENTER];
		} else {
			[self execCmd:CMD_EXIT];
		}
	}
	
	slideControlMulti = 0;
	slideControlLastDist = 0;
	slideControlDist = 0;
	slideControlNumber = -1;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	NSMutableDictionary *session = [(FreevoRemoteAppDelegate *)[[UIApplication sharedApplication] delegate] saveSession];

	connectPort = atoi([[portField text] UTF8String]);
	[connectAddr release];
	connectAddr = [addressField text];
	printf("set address to %s:%d\n",[connectAddr UTF8String],connectPort);
	
	[session setObject:[addressField text] forKey:@"address"];		
	[session setObject:[portField text] forKey:@"port"];
	
	is_dirty = 1;
	
	return YES;
}

- (IBAction) resetDefaults
{
	NSMutableDictionary *session = [(FreevoRemoteAppDelegate *)[[UIApplication sharedApplication] delegate] saveSession];

	[session setObject:@"16310" forKey:@"port"];
	[session setObject:@"192.168.0.1" forKey:@"address"];
	[session setObject:@"UDP" forKey:@"protocol"];
	[session setObject:@"LITE" forKey:@"displayMode"];
	
	[[self addressField] setText:[session objectForKey:@"address"]];
	[[self portField] setText:[session objectForKey:@"port"]];
	
	if([[session objectForKey:@"protocol"] isEqualToString:@"UDP"]) {
		printf("set UDP\n");
		[[self displayModeToggle] setSelectedSegmentIndex:0];
	} else if([[session objectForKey:@"protocol"] isEqualToString:@"TCP"]) {
		printf("set TCP\n");
		[[self displayModeToggle] setSelectedSegmentIndex:1];
	}	
	
	if([[session objectForKey:@"displayMode"] isEqualToString:@"LITE"]) {
		printf("set easy\n");
		[self setEasy];
		[[self protocolToggle] setSelectedSegmentIndex:0];
	} else if([[session objectForKey:@"displayMode"] isEqualToString:@"FULL"]) {
		printf("set full\n");
		[self setFull];
		[[self protocolToggle] setSelectedSegmentIndex:1];
	}
}

- (IBAction) setProtocol:(id)control
{
	NSMutableDictionary *session = [(FreevoRemoteAppDelegate *)[[UIApplication sharedApplication] delegate] saveSession];
	UISegmentedControl *c = (UISegmentedControl*)control;
	if([c selectedSegmentIndex] == 0) {
		printf("set UDP protocol\n");
		connectProtocol = SOCK_DGRAM;
		[session setObject:@"UDP" forKey:@"protocol"];
	} else {
		printf("set TCP protocol\n");
		connectProtocol = SOCK_STREAM;
		[session setObject:@"TCP" forKey:@"protocol"];
	}
	is_dirty = 1;
}

- (IBAction) setDisplayMode:(id)control
{
	NSMutableDictionary *session = [(FreevoRemoteAppDelegate *)[[UIApplication sharedApplication] delegate] saveSession];
	UISegmentedControl *c = (UISegmentedControl*)control;
	if([c selectedSegmentIndex] == 0) {
		[session setObject:@"LITE" forKey:@"displayMode"];
		[self setEasy];
	} else {
		[session setObject:@"FULL" forKey:@"displayMode"];
		[self setFull];
	}
}


- (IBAction) setEasy
{
	printf("show easy controls\n");
}

- (IBAction) setFull
{
	printf("show all controls\n");
}

- (void) closeAll
{
	if(soc >= 0) {
		printf("close connection\n");
		close(soc);
		soc = -1;
	}	
}


- (IBAction) connectToMP
{
	int status;
	struct hostent *server;
	struct sockaddr_in MP;
		
	if(soc >= 0) {
		printf("close previous connection\n");
		close(soc);
		soc = -1;
	}
	
	printf("trying to connect to %s:%d using mode %s\n",[connectAddr UTF8String],connectPort,(connectProtocol==SOCK_STREAM)?"TCP":"UDP");
	server = gethostbyname([connectAddr UTF8String]);
	
	if(server) {
		MP.sin_family = AF_INET;
		MP.sin_port = htons(connectPort);
		memcpy(&MP.sin_addr.s_addr, server->h_addr, server->h_length);
		
		soc = socket(PF_INET, connectProtocol, 0);
		printf("opened soc %d\n",soc);
		status = connect(soc, (const struct sockaddr *)&MP, sizeof(struct sockaddr_in));
		printf("connect returned %d\n",status);
		
		if(status < 0) {
			close(soc);
			soc = -1;
			is_dirty = 1;
		} else {
			is_dirty = 0;
		}
	}
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];	
}

- (void) execCmd:(int)cmd
{
	UIButton *dest = nil;
	int translatedCmd = cmd;
	
	if(slideControlType == 1) {
		if(translatedCmd == CMD_UP) { translatedCmd = CMD_VOLP; }
		if(translatedCmd == CMD_DOWN) { translatedCmd = CMD_VOLM; }
	}
	if(slideControlPanel == 1) {
		if(translatedCmd == CMD_UP) { translatedCmd = CMD_CHP; }
		if(translatedCmd == CMD_DOWN) { translatedCmd = CMD_CHM; }
		if(translatedCmd == CMD_LEFT) { translatedCmd = CMD_REW; }
		if(translatedCmd == CMD_RIGHT) { translatedCmd = CMD_FFWD; }
		if(translatedCmd == CMD_SELECT) { translatedCmd = CMD_PLAY; }
		if(translatedCmd == CMD_ENTER) { translatedCmd = CMD_ENTER; }
		if(translatedCmd == CMD_EXIT) { translatedCmd = CMD_EXIT; }
	}
	
	switch (translatedCmd) {
		case CMD_EXIT:
			dest = btnEXIT;
			break;
		case CMD_CHM:
			dest = btnVOLM;
			break;
		case CMD_CHP:
			dest = btnVOLP;
			break;
		case CMD_VOLM:
			dest = btnVOLM;
			break;
		case CMD_VOLP:
			dest = btnVOLP;
			break;
		case CMD_PLAY:
			dest = btnPLAY;
			break;
		case CMD_FFWD:
			dest = btnFFWD;
			break;
		case CMD_REW:
			dest = btnREW;
			break;
		case CMD_UP:
			dest = btnUP;
			break;
		case CMD_DOWN:
			dest = btnDOWN;
			break;
		case CMD_LEFT:
			dest = btnLEFT;
			break;
		case CMD_RIGHT:
			dest = btnRIGHT;
			break;
		case CMD_SELECT:
		case CMD_ENTER:
			dest = btnENTER;
			break;
		default:
			break;
	}
	
	if(dest) {
		[dest setAlpha:1.0];
		CGContextRef context = UIGraphicsGetCurrentContext();
		[UIView beginAnimations:nil context:context];
		[UIView setAnimationDuration:0.8];	
		[dest setAlpha:0.0];
		[UIView commitAnimations];	
	}
	[self sendCmd:translatedCmd];
}

- (void) sendCmd:(int)cmd
{
	if(is_dirty) {
		printf("reconnect\n");
		[self connectToMP];
	}
	
	printf("send command %d : '%s'\n", cmd, commands[cmd]);
	if(soc >= 0) {
		write(soc, commands[cmd], strlen(commands[cmd]));
	}
}

- (IBAction) showOptions {
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	[UIView beginAnimations:nil context:context];
	[UIView setAnimationDuration:0.7];
	if([[[self view ] subviews] objectAtIndex:1] == optionsView) {
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[self view] cache:YES];
	} else {
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[self view] cache:YES];
	}
	[[self view] exchangeSubviewAtIndex:0 withSubviewAtIndex:1];

	[UIView commitAnimations];

	if(is_dirty) {
		[self connectToMP];
	}

}

- (IBAction) cmdUP
{
	[self sendCmd:CMD_UP];
}

- (IBAction) cmdDOWN
{
	[self sendCmd:CMD_DOWN];
}

- (IBAction) cmdLEFT
{
	[self sendCmd:CMD_LEFT];
}

- (IBAction) cmdRIGHT
{
	[self sendCmd:CMD_RIGHT];
}

- (IBAction) cmdSELECT
{
	[self sendCmd:CMD_SELECT];
}

- (IBAction) cmdENTER
{
	[self sendCmd:CMD_ENTER];
}

- (IBAction) cmdEJECT
{
	[self sendCmd:CMD_EJECT];
}

- (IBAction) cmdEXIT
{
	[self sendCmd:CMD_EXIT];
}

- (IBAction) cmdMENU
{
	[self sendCmd:CMD_MENU];
}

- (IBAction) cmdMUTE
{
	[self sendCmd:CMD_MUTE];
}

- (IBAction) cmdDISPLAY
{
	[self sendCmd:CMD_DISPLAY];
}

- (IBAction) cmdCHP
{
	[self sendCmd:CMD_CHP];
}

- (IBAction) cmdCHM
{
	[self sendCmd:CMD_CHM];
}

- (IBAction) cmdVOLP
{
	[self sendCmd:CMD_VOLP];
}

- (IBAction) cmdVOLM
{
	[self sendCmd:CMD_VOLM];
}

- (IBAction) cmdPLAY
{
	[self sendCmd:CMD_PLAY];
}

- (IBAction) cmdSTOP
{
	[self sendCmd:CMD_STOP];
}

- (IBAction) cmdPAUSE
{
	[self sendCmd:CMD_PAUSE];
}

- (IBAction) cmdREC
{
	[self sendCmd:CMD_REC];
}

- (IBAction) cmdREW
{
	[self sendCmd:CMD_REW];
}

- (IBAction) cmdFFWD
{
	[self sendCmd:CMD_FFWD];
}

- (IBAction) cmdLANG
{
	[self sendCmd:CMD_LANG];
}

- (IBAction) cmdSUBTITLE
{
	[self sendCmd:CMD_SUBTITLE];
}

- (IBAction) cmdANGLE
{
	[self sendCmd:CMD_ANGLE];
}

- (IBAction) cmdGUIDE
{
	[self sendCmd:CMD_GUIDE];
}

- (IBAction) cmdVIDEOS
{
	[self sendCmd:CMD_VIDEOS];
}

- (IBAction) cmdMUSIC
{
	[self sendCmd:CMD_MUSIC];
}

- (IBAction) cmdTV
{
	[self sendCmd:CMD_TV];
}

- (IBAction) cmdPICTURES
{
	[self sendCmd:CMD_PICTURES];
}

- (IBAction) cmdSHUTDOWN
{
	[self sendCmd:CMD_SHUTDOWN];
}

- (IBAction) cmd0
{
	[self sendCmd:CMD_0];
}

- (IBAction) cmd1
{
	[self sendCmd:CMD_1];
}

- (IBAction) cmd2
{
	[self sendCmd:CMD_2];
}

- (IBAction) cmd3
{
	[self sendCmd:CMD_3];
}

- (IBAction) cmd4
{
	[self sendCmd:CMD_4];
}

- (IBAction) cmd5
{
	[self sendCmd:CMD_5];
}

- (IBAction) cmd6
{
	[self sendCmd:CMD_6];
}

- (IBAction) cmd7
{
	[self sendCmd:CMD_7];
}

- (IBAction) cmd8
{
	[self sendCmd:CMD_8];
}

- (IBAction) cmd9
{
	[self sendCmd:CMD_9];
}


- (void)dealloc {
    [super dealloc];
}

@end
