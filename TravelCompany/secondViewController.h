//
//  secondViewController.h
//  TravelCompany
//
//  Created by Student P_04 on 07/04/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface secondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *picnicSpotText;
@property (weak, nonatomic) IBOutlet UITextField *priceText;
@property (weak, nonatomic) IBOutlet UITextField *durationText;
@property NSString *buttonPress;
- (IBAction)submitButton:(id)sender;
@property NSString *picnic,*price,*dur;
@end
