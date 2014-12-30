//
//  FirstViewController.h
//  PhoneAppSkin
//
//  Created by steventai on 12/9/5.
//  Copyright (c) 2012年 steventai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (retain, nonatomic) IBOutlet UILabel *numlabel;


@property(nonatomic, retain) NSString *phoneNumberString;
-(IBAction)numberButtonPressed:(UIButton *)pressedButton;
-(IBAction)deleteButtonPressed:(UIButton *)pressedButton;
-(IBAction)dialButtonPressed:(UIButton *)pressedButton;
//111111
-(void)displayPhoneNumber;
@end
