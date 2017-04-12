//
//  thirdViewController.m
//  TravelCompany
//
//  Created by Student P_04 on 11/04/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "thirdViewController.h"
#import "DatabaseLib.h"
#import "bookTableCell.h"
@interface thirdViewController ()

@end

@implementation thirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   NSString *query=@"select * from booking";
    self.bookingNameArray=[[DatabaseLib getSharedObj]getAllPassangerNameRecords:query];
    
    self.bookingCnoArray=[[DatabaseLib getSharedObj]getAllPassangerCnoRecords:query];
   
    self.bookingSpotArray=[[DatabaseLib getSharedObj]getAllPassangerSpotRecords:query];
    
    self.bookingSeatArray=[[DatabaseLib getSharedObj]getAllPassangerSeatRecords:query];
    
    [self.bookingTableView reloadData];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.bookingNameArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    bookTableCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    cell.passangerNameLabel.text=[self.bookingNameArray objectAtIndex:indexPath.row];
    cell.passangerCnoLabel.text=[self.bookingCnoArray objectAtIndex:indexPath.row];
    cell.passangerSpotLabel.text=[self.bookingSpotArray objectAtIndex:indexPath.row];
    cell.passangerSeatnoLabel.text=[self.bookingSeatArray objectAtIndex:indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
