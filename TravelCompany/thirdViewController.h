//
//  thirdViewController.h
//  TravelCompany
//
//  Created by Student P_04 on 11/04/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface thirdViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *PicnicSpotLabel;
@property (weak, nonatomic) IBOutlet UITableView *bookingTableView;
@property NSArray *bookingNameArray;
@property NSArray *bookingCnoArray;
@property NSArray *bookingSpotArray;
@property NSArray *bookingSeatArray;
- (IBAction)deleteButton:(id)sender;

- (IBAction)ClearAllButton:(id)sender;

@property NSString *picName,*seatNo;

@end
