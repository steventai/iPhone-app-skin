//
//  FirstViewController.m
//  PhoneAppSkin
//
//  Created by steventai on 12/9/5.
//  Copyright (c) 2012年 steventai. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize numlabel;
@synthesize phoneNumberString;

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        phoneNumberString = [[NSString alloc] init];
    }
    
    return self;
}

- (void)viewDidUnload
{


    [self setNumlabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (void)dealloc {
    [phoneNumberString release];

    [numlabel release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(IBAction)numberButtonPressed:(UIButton *)pressedButton
{
    NSLog(@"Number keypad button pressed.");
    self.phoneNumberString = [self.phoneNumberString stringByAppendingString:pressedButton.titleLabel.text];
    [self displayPhoneNumber];
}

-(void)displayPhoneNumber
{
    if([self.phoneNumberString length] >= 4 && [self.phoneNumberString length] <= 7)
    {
        NSRange  prefixRange   = {0, 3};
        NSString *prefixString = [self.phoneNumberString substringWithRange:prefixRange];
        NSString *lineNumberString = [self.phoneNumberString substringFromIndex:3];
        self.numlabel.text = [NSString stringWithFormat:@"%@-%@", prefixString, lineNumberString];
    }
    else if([self.phoneNumberString length] >= 8 && [self.phoneNumberString length] <= 10)
    {
        NSRange areaCodeRange = {0, 3};
        NSString *areaCodeString = [self.phoneNumberString substringWithRange:areaCodeRange];
        NSRange prefixRange = {3, 3};
        NSString *prefixString = [self.phoneNumberString substringWithRange:prefixRange];
        NSString *lineNumberString = [self.phoneNumberString substringFromIndex:6];
        self.numlabel.text = [NSString stringWithFormat:@"(%@) %@-%@", areaCodeString, prefixString, lineNumberString];
    }
    else
    {
        self.numlabel.text = self.phoneNumberString;
    }
}

-(IBAction)deleteButtonPressed:(UIButton *)numberButton
{
    if([self.phoneNumberString length] > 0)
    {
        self.phoneNumberString = [self.phoneNumberString substringToIndex:([self.phoneNumberString length] - 1)];
    }
    [self displayPhoneNumber];
}


@end
