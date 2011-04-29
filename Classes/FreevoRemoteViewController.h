//
//  FreevoRemoteViewController.h
//  FreevoRemote
//
//  Created by blunderer on 30/11/09.
//  Copyright blunderer 2009. All rights reserved.
//


#define CMD_UP			0
#define CMD_DOWN		1
#define CMD_LEFT		2
#define CMD_RIGHT		3
#define CMD_SELECT		4
#define CMD_ENTER		5
#define CMD_EJECT		6
#define CMD_EXIT		7
#define CMD_MENU		8
#define CMD_MUTE		9
#define CMD_DISPLAY		10
#define CMD_CHP			11
#define CMD_CHM			12
#define CMD_VOLP		13
#define CMD_VOLM		14
#define CMD_PLAY		15
#define CMD_STOP		16
#define CMD_PAUSE		17
#define CMD_REC			18
#define CMD_REW			19
#define CMD_FFWD		20
#define CMD_LANG		21
#define CMD_SUBTITLE	22
#define CMD_ANGLE		23
#define CMD_GUIDE		24
#define CMD_VIDEOS		25
#define CMD_MUSIC		26
#define CMD_TV			27
#define CMD_PICTURES	28
#define CMD_SHUTDOWN	29
#define CMD_0			30
#define CMD_1			31
#define CMD_2			32
#define CMD_3			33
#define CMD_4			34
#define CMD_5			35
#define CMD_6			36
#define CMD_7			37
#define CMD_8			38
#define CMD_9			39

#import <UIKit/UIKit.h>

@interface FreevoRemoteViewController : UITabBarController <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {
	int soc;
	int is_dirty;
	int connectPort;
	NSString * connectAddr;
	int connectProtocol;

	int slideControlPanel;
	int slideControlNumber;
	int slideControlType;
	int slideControlXprev;
	int slideControlYprev;
	int slideControlXorg;
	int slideControlYorg;
	int slideControlMulti;
	int slideControlDirection;
	double slideControlDist;
	double slideControlLastDist;
	
	IBOutlet UIPickerView *protocolPicker;
	IBOutlet UILabel *status;
	IBOutlet UIView *optionsView;
	IBOutlet UIView *controlView;
	IBOutlet UIImageView *topWidget;
	IBOutlet UISegmentedControl *protocolToggle;
	IBOutlet UISegmentedControl *displayModeToggle;
	IBOutlet UITextField *addressField;
	IBOutlet UITextField *portField;
	IBOutlet UINavigationBar *titleBar;	

	IBOutlet UIButton * btnUP;	
	IBOutlet UIButton * btnDOWN;
	IBOutlet UIButton * btnLEFT;
	IBOutlet UIButton * btnRIGHT;
	IBOutlet UIButton * btnSELECT;
	IBOutlet UIButton * btnENTER;
	IBOutlet UIButton * btnEJECT;
	IBOutlet UIButton * btnEXIT;
	IBOutlet UIButton * btnMENU;
	IBOutlet UIButton * btnMUTE;
	IBOutlet UIButton * btnDISPLAY;
	IBOutlet UIButton * btnCHP;
	IBOutlet UIButton * btnCHM;
	IBOutlet UIButton * btnVOLP;
	IBOutlet UIButton * btnVOLM;
	IBOutlet UIButton * btnPLAY;
	IBOutlet UIButton * btnSTOP;
	IBOutlet UIButton * btnPAUSE;
	IBOutlet UIButton * btnREC;
	IBOutlet UIButton * btnREW;
	IBOutlet UIButton * btnFFWD;
	IBOutlet UIButton * btnLANG;
	IBOutlet UIButton * btnSUBTITLE;
	IBOutlet UIButton * btnANGLE;
	IBOutlet UIButton * btnGUIDE;
	IBOutlet UIButton * btnVIDEOS;
	IBOutlet UIButton * btnMUSIC;
	IBOutlet UIButton * btnTV;
	IBOutlet UIButton * btnPICTURES;
	IBOutlet UIButton * btnSHUTDOWN;
	IBOutlet UIButton * btn0;
	IBOutlet UIButton * btn1;
	IBOutlet UIButton * btn2;
	IBOutlet UIButton * btn3;
	IBOutlet UIButton * btn4;
	IBOutlet UIButton * btn5;
	IBOutlet UIButton * btn6;
	IBOutlet UIButton * btn7;
	IBOutlet UIButton * btn8;
	IBOutlet UIButton * btn9;
}

@property (nonatomic) int connectPort;
@property (nonatomic, retain) NSString *connectAddr;
@property (nonatomic) int connectProtocol;

@property (nonatomic, retain) UIView *optionsView;
@property (nonatomic, retain) UIView *controlView;
@property (nonatomic, retain) UINavigationBar *titleBar;
@property (nonatomic, retain) UIPickerView *protocolPicker;

@property (nonatomic, retain)  UILabel *status;
@property (nonatomic, retain)  UIImageView *topWidget;
@property (nonatomic, retain)  UISegmentedControl *protocolToggle;
@property (nonatomic, retain)  UISegmentedControl *displayModeToggle;
@property (nonatomic, retain)  UITextField *addressField;
@property (nonatomic, retain)  UITextField *portField;

@property (nonatomic, retain)  UIButton * btnUP;	
@property (nonatomic, retain)  UIButton * btnDOWN;
@property (nonatomic, retain)  UIButton * btnLEFT;
@property (nonatomic, retain)  UIButton * btnRIGHT;
@property (nonatomic, retain)  UIButton * btnSELECT;
@property (nonatomic, retain)  UIButton * btnENTER;
@property (nonatomic, retain)  UIButton * btnEJECT;
@property (nonatomic, retain)  UIButton * btnEXIT;
@property (nonatomic, retain)  UIButton * btnMENU;
@property (nonatomic, retain)  UIButton * btnMUTE;
@property (nonatomic, retain)  UIButton * btnDISPLAY;
@property (nonatomic, retain)  UIButton * btnCHP;
@property (nonatomic, retain)  UIButton * btnCHM;
@property (nonatomic, retain)  UIButton * btnVOLP;
@property (nonatomic, retain)  UIButton * btnVOLM;
@property (nonatomic, retain)  UIButton * btnPLAY;
@property (nonatomic, retain)  UIButton * btnSTOP;
@property (nonatomic, retain)  UIButton * btnPAUSE;
@property (nonatomic, retain)  UIButton * btnREC;
@property (nonatomic, retain)  UIButton * btnREW;
@property (nonatomic, retain)  UIButton * btnFFWD;
@property (nonatomic, retain)  UIButton * btnLANG;
@property (nonatomic, retain)  UIButton * btnSUBTITLE;
@property (nonatomic, retain)  UIButton * btnANGLE;
@property (nonatomic, retain)  UIButton * btnGUIDE;
@property (nonatomic, retain)  UIButton * btnVIDEOS;
@property (nonatomic, retain)  UIButton * btnMUSIC;
@property (nonatomic, retain)  UIButton * btnTV;
@property (nonatomic, retain)  UIButton * btnPICTURES;
@property (nonatomic, retain)  UIButton * btnSHUTDOWN;
@property (nonatomic, retain)  UIButton * btn0;
@property (nonatomic, retain)  UIButton * btn1;
@property (nonatomic, retain)  UIButton * btn2;
@property (nonatomic, retain)  UIButton * btn3;
@property (nonatomic, retain)  UIButton * btn4;
@property (nonatomic, retain)  UIButton * btn5;
@property (nonatomic, retain)  UIButton * btn6;
@property (nonatomic, retain)  UIButton * btn7;
@property (nonatomic, retain)  UIButton * btn8;
@property (nonatomic, retain)  UIButton * btn9;



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

- (IBAction) resetDefaults;
- (IBAction) showOptions;
- (IBAction) setDisplayMode:(id)control;
- (IBAction) setProtocol:(id)control;
- (IBAction) connectToMP;
- (void) setEasy;
- (void) setFull;
- (void) closeAll;
- (void) execCmd:(int)cmd;

- (IBAction)togglePanel;

- (IBAction) cmdUP;	
- (IBAction) cmdDOWN;
- (IBAction) cmdLEFT;
- (IBAction) cmdRIGHT;
- (IBAction) cmdSELECT;
- (IBAction) cmdENTER;
- (IBAction) cmdEJECT;
- (IBAction) cmdEXIT;
- (IBAction) cmdMENU;
- (IBAction) cmdMUTE;
- (IBAction) cmdDISPLAY;
- (IBAction) cmdCHP;
- (IBAction) cmdCHM;
- (IBAction) cmdVOLP;
- (IBAction) cmdVOLM;
- (IBAction) cmdPLAY;
- (IBAction) cmdSTOP;
- (IBAction) cmdPAUSE;
- (IBAction) cmdREC;
- (IBAction) cmdREW;
- (IBAction) cmdFFWD;
- (IBAction) cmdLANG;
- (IBAction) cmdSUBTITLE;
- (IBAction) cmdANGLE;
- (IBAction) cmdGUIDE;
- (IBAction) cmdVIDEOS;
- (IBAction) cmdMUSIC;
- (IBAction) cmdTV;
- (IBAction) cmdPICTURES;
- (IBAction) cmdSHUTDOWN;
- (IBAction) cmd0;
- (IBAction) cmd1;
- (IBAction) cmd2;
- (IBAction) cmd3;
- (IBAction) cmd4;
- (IBAction) cmd5;
- (IBAction) cmd6;
- (IBAction) cmd7;
- (IBAction) cmd8;
- (IBAction) cmd9;

- (void) sendCmd:(int)cmd;

@end

