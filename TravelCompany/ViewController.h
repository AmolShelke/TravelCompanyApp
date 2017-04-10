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
@property NSArray *picArray;
@property NSArray *priceArray;
@property NSArray *durationArray;
@property NSString *pic,*dur,*price;


@end

