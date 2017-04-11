//
//  firstViewController.h
//  TravelCompany
//
//  Created by Student P_07 on 10/04/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface firstViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userNameText;
@property (strong, nonatomic) IBOutlet UITextField *passwordText;
- (IBAction)logInButton:(id)sender;
- (IBAction)userButton:(id)sender;

@end
