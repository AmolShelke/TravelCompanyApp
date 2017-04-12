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
#import "firstViewController.h"
#import "thirdViewController.h"
#import "fourthViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"%@",self.isUser);
    self.pic=@"null";
    if([self.isUser isEqualToString:@"yes"])
    {
        //self.deleteBut.enabled=NO;
        self.deleteBut.hidden=YES;
        self.addBut.hidden=YES;
        self.updateBut.hidden=YES;
        self.seeBookBut.hidden=YES;
        self.logOutBut.hidden=YES;
    }
    else
    {
        self.bookBut.hidden=YES;
    }
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
    

    self.pic=@"null";
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
/*-(void)showDetails
{
    NSString *name=self.username;
    NSString *cno=self.cno;
    NSString *picLoc=self.pic;
    NSString *picDur=self.dur;
    NSString *picPrice=self.price;
    
    NSString *passanger=[@"Passanger Name:"stringByAppendingString:name];
    NSString *number=[@"\nContact Number:"stringByAppendingString:cno];
    NSString *picSpot=[@"\nPicnic Spot:"stringByAppendingString:picLoc];
    NSString *picDuration=[@"\nDuration of Trip:"stringByAppendingString:picDur];
    NSString *picMoney=[@"\nPrice:"stringByAppendingString:picPrice];
    
    
    NSString *finalDetail=[passanger stringByAppendingString:number];
    finalDetail=[finalDetail stringByAppendingString:picSpot];
    finalDetail=[finalDetail stringByAppendingString:picDuration];
    finalDetail=[finalDetail stringByAppendingString:picMoney];
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Details of Trip" message:finalDetail preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        nil;
        
        
    }];
    UIAlertAction *bookAction=[UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        nil;
        
        NSString *query=[NSString stringWithFormat:@"insert into booking(passanger_name,passanger_no,passanger_spot)values(\"%@\",\"%@\",\"%@\")",name,cno,picLoc];
        int isSuccess=[[DatabaseLib getSharedObj]executeQuery:query];
        if(isSuccess)
        {
            NSLog(@"Passanger Info Inserted Successfully");
            
        }
        else
        {
            NSLog(@"Passanger Info not inserted sucessfully");
        }
        
    }];
    
    
    [alert addAction:cancelAction];
    [alert addAction:bookAction];
    [self presentViewController:alert animated:YES completion:^{
        nil;
    }];
    
    
    
}*/
- (IBAction)bookButton:(id)sender
{
   
    if([self.pic isEqualToString:@"null"])
    {
        //NSLog(@"ERROR");
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"" message:@"Please Select Picnic Spot First" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            nil;
            
        }];
      
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:^{
            nil;
        }];
    }
    else
    {
        
        fourthViewController *fvc=[self.storyboard instantiateViewControllerWithIdentifier:@"fourthViewController"];
        fvc.picnicSpot=self.pic;
        fvc.dur=self.dur;
        fvc.price=self.price;
        [self.navigationController pushViewController:fvc animated:YES];
        
        
        /*UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Book Now!!!" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *bookAction=[UIAlertAction actionWithTitle:@"BOOK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        nil;
            self.username=self.mytextField.text;
            self.cno=self.numtextField.text;
            
            
            NSLog(@"user name:%@",self.username);
         
            if(self.mytextField.text.length>0&&self.numtextField.text.length==10)
            {
                [self showDetails];
            }
            else
            {
                
                UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"" message:@"Please Enter all details" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    nil;
                    
                }];
                
                [alert addAction:okAction];
                [self presentViewController:alert animated:YES completion:^{
                    nil;
                }];
                

            }
        }];
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder=@"Enter Your Name";
            //self.username=textField.text;
            self.mytextField=textField;
        }];
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder=@"Enter Your 10 Digit Contact Number";
            //self.username=textField.text;
            self.numtextField=textField;
        }];

            [alert addAction:bookAction];
        [self presentViewController:alert animated:YES completion:^{
        nil;
        }];*/
    }
}

- (IBAction)seeBookingButton:(id)sender
{
    /*if([self.pic isEqualToString:@"null"])
    {
        //NSLog(@"ERROR");
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"" message:@"Please Select Picnic Spot First" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            nil;
            
        }];
        
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:^{
            nil;
        }];
    }
    else
    {*/
        thirdViewController *tvc=[self.storyboard instantiateViewControllerWithIdentifier:@"thirdViewController"];
        [self.navigationController pushViewController:tvc animated:YES];
    //}
}

- (IBAction)logOutButton:(id)sender
{
    //firstViewController *fvc=[[firstViewController alloc]init];
  
    [self.navigationController popViewControllerAnimated:YES];
}
@end
