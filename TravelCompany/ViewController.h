//
//  ViewController.h
//  TravelCompany
//
//  Created by Student P_04 on 07/04/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

- (IBAction)addButton:(id)sender;
- (IBAction)updateButton:(id)sender;
- (IBAction)deleteButton:(id)sender;
- (IBAction)bookButton:(id)sender;
- (IBAction)seeBookingButton:(id)sender;
- (IBAction)logOutButton:(id)sender;


@property NSArray *picArray;
@property NSArray *priceArray;
@property NSArray *durationArray;
@property NSString *pic,*dur,*price;
@property (strong, nonatomic) IBOutlet UIButton *deleteBut;
@property (strong, nonatomic) IBOutlet UIButton *updateBut;
@property (strong, nonatomic) IBOutlet UIButton *bookBut;

@property (strong, nonatomic) IBOutlet UIButton *addBut;
@property (weak, nonatomic) IBOutlet UIButton *seeBookBut;
@property (weak, nonatomic) IBOutlet UIButton *logOutBut;

@property NSString *isUser;
@property NSString *username;
@property NSString *cno;
@property UITextField *mytextField;
@property UITextField *numtextField;
@end

