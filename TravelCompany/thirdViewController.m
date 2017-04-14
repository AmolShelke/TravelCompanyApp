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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    bookTableCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    self.picName=cell.passangerSpotLabel.text;
    self.seatNo=cell.passangerSeatnoLabel.text;
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

- (IBAction)deleteButton:(id)sender
{
    NSString *query=[NSString stringWithFormat:@"delete from booking where passanger_spot=\"%@\" and seat_no=\"%@\"",self.picName,self.seatNo];
  int success = [[DatabaseLib getSharedObj]executeQuery:query];
    if(success)
    {
        NSLog(@"Record Deleted Successfully");
        NSString *query=@"select * from booking";
        self.bookingNameArray=[[DatabaseLib getSharedObj]getAllPassangerNameRecords:query];
        
        self.bookingCnoArray=[[DatabaseLib getSharedObj]getAllPassangerCnoRecords:query];
        
        self.bookingSpotArray=[[DatabaseLib getSharedObj]getAllPassangerSpotRecords:query];
        
        self.bookingSeatArray=[[DatabaseLib getSharedObj]getAllPassangerSeatRecords:query];
        
        [self.bookingTableView reloadData];
        
    }
    else
    {
        NSLog(@"Record Not deleted");
    }
}

- (IBAction)ClearAllButton:(id)sender
{
    NSString *query=@"delete from booking";
    int success = [[DatabaseLib getSharedObj]executeQuery:query];
    if(success)
    {
        NSLog(@"Table Deleted Successfully");
        NSString *query=@"select * from booking";
        self.bookingNameArray=[[DatabaseLib getSharedObj]getAllPassangerNameRecords:query];
        
        self.bookingCnoArray=[[DatabaseLib getSharedObj]getAllPassangerCnoRecords:query];
        
        self.bookingSpotArray=[[DatabaseLib getSharedObj]getAllPassangerSpotRecords:query];
        
        self.bookingSeatArray=[[DatabaseLib getSharedObj]getAllPassangerSeatRecords:query];
        
        [self.bookingTableView reloadData];
    }
    else
    {
        NSLog(@"Table Not deleted");
    }
}
@end
