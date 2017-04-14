//
//  fourthViewController.h
//  TravelCompany
//
//  Created by Student P_04 on 11/04/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fourthViewController : UIViewController
- (IBAction)selectSeatsButton:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *seat1buttonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *seat2buttonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *seat3buttonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *seat4buttonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *seat5buttonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *seat6buttonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *seat7buttonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *seat8buttonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *seat9buttonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *seat10buttonOutlet;

@property (weak, nonatomic) IBOutlet UIButton *seat11buttonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *seat12buttonOutlet;







@property NSString *picnicSpot;
@property NSArray *bookSeatsArray;
@property  NSString *username;
@property NSString *cno;
//@property NSString *pic;
@property NSString *dur;
@property NSString *price;
@property NSString *seatNo;
@property UITextField *mytextField;
@property UITextField *numtextField;
@end
