//
//  bookTableCell.h
//  TravelCompany
//
//  Created by Student P_04 on 11/04/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bookTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *passangerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *passangerCnoLabel;
@property (weak, nonatomic) IBOutlet UILabel *passangerSpotLabel;
@property (weak, nonatomic) IBOutlet UILabel *passangerSeatnoLabel;

@end
