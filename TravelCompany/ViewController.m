//
//  ViewController.m
//  TravelCompany
//
//  Created by Student P_04 on 07/04/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "ViewController.h"
#import "DatabaseLib.h"
#import "secondViewController.h"
#import "myTableCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *query=@"select * from travel";
    self.picArray=[[DatabaseLib getSharedObj]getAllPicnicRecords:query];
    self.priceArray=[[DatabaseLib getSharedObj]getAllPriceRecords:query];
    self.durationArray=[[DatabaseLib getSharedObj]getAllDurationRecords:query];
    [self.myTableView reloadData];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    NSString *query=@"select * from travel";
    self.picArray=[[DatabaseLib getSharedObj]getAllPicnicRecords:query];
    self.priceArray=[[DatabaseLib getSharedObj]getAllPriceRecords:query];
    self.durationArray=[[DatabaseLib getSharedObj]getAllDurationRecords:query];
    [self.myTableView reloadData];
    

    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.picArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    myTableCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    
    cell.picnicLabel.text=[self.picArray objectAtIndex:indexPath.row];
    cell.duration.text=[self.durationArray objectAtIndex:indexPath.row];
    cell.priceLabel.text=[self.priceArray objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    myTableCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    
    self.pic=cell.picnicLabel.text;
    self.price=cell.priceLabel.text;
    self.dur=cell.duration.text;
    NSLog(@"%@",self.pic);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addButton:(id)sender
{
    secondViewController *svc=[self.storyboard instantiateViewControllerWithIdentifier:@"secondViewController"];
    svc.buttonPress=@"add";
    [self.navigationController pushViewController:svc animated:YES];
}

- (IBAction)updateButton:(id)sender
{
    secondViewController *svc=[self.storyboard instantiateViewControllerWithIdentifier:@"secondViewController"];
    svc.buttonPress=@"update";
    svc.picnic=self.pic;
    svc.price=self.price;
    svc.dur=self.dur;
    
    [self.navigationController pushViewController:svc animated:YES];
}

- (IBAction)deleteButton:(id)sender
{
    
    NSString *query=[NSString stringWithFormat:@"delete from travel where pic_spot=\"%@\"",self.pic];
    int success= [[DatabaseLib getSharedObj]executeQuery:query];
    if(success)
    {
        NSLog(@"Deleted SuccessFully");
        NSString *query=@"select * from travel";
        self.picArray=[[DatabaseLib getSharedObj]getAllPicnicRecords:query];
        self.priceArray=[[DatabaseLib getSharedObj]getAllPriceRecords:query];
        self.durationArray=[[DatabaseLib getSharedObj]getAllDurationRecords:query];
        [self.myTableView reloadData];

        
    }
    else
    {
        NSLog(@"Deletion failed");
    }

}
@end
