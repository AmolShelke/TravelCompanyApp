//
//  fourthViewController.m
//  TravelCompany
//
//  Created by Student P_04 on 11/04/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "fourthViewController.h"
#import "DatabaseLib.h"

@interface fourthViewController ()

@end

@implementation fourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *query=[NSString stringWithFormat:@"select * from booking where passanger_spot=\"%@\"",self.picnicSpot];
    self.bookSeatsArray=[[DatabaseLib getSharedObj]getAllPassangerSeatRecords:query];
    NSString *seat;
    for(seat in self.bookSeatsArray)
    {
        if([seat isEqualToString:self.seat1buttonOutlet.titleLabel.text])
        {
            self.seat1buttonOutlet.backgroundColor=[UIColor redColor];
        }
        else if([seat isEqualToString:self.seat2buttonOutlet.titleLabel.text])
        {
            self.seat2buttonOutlet.backgroundColor=[UIColor redColor];
        }
        else if([seat isEqualToString:self.seat3buttonOutlet.titleLabel.text])
        {
            self.seat3buttonOutlet.backgroundColor=[UIColor redColor];
        }
        else if([seat isEqualToString:self.seat4buttonOutlet.titleLabel.text])
        {
            self.seat4buttonOutlet.backgroundColor=[UIColor redColor];
        }
        else if([seat isEqualToString:self.seat5buttonOutlet.titleLabel.text])
        {
            self.seat5buttonOutlet.backgroundColor=[UIColor redColor];
        }
        else if([seat isEqualToString:self.seat6buttonOutlet.titleLabel.text])
        {
            self.seat6buttonOutlet.backgroundColor=[UIColor redColor];
        }
        else if([seat isEqualToString:self.seat7buttonOutlet.titleLabel.text])
        {
            self.seat7buttonOutlet.backgroundColor=[UIColor redColor];
        }
        else if([seat isEqualToString:self.seat8buttonOutlet.titleLabel.text])
        {
            self.seat8buttonOutlet.backgroundColor=[UIColor redColor];
        }
        else if([seat isEqualToString:self.seat9buttonOutlet.titleLabel.text])
        {
            self.seat9buttonOutlet.backgroundColor=[UIColor redColor];
        }
        else if([seat isEqualToString:self.seat10buttonOutlet.titleLabel.text])
        {
            self.seat10buttonOutlet.backgroundColor=[UIColor redColor];
        }
        else if([seat isEqualToString:self.seat11buttonOutlet.titleLabel.text])
        {
            self.seat11buttonOutlet.backgroundColor=[UIColor redColor];
        }
        else if([seat isEqualToString:self.seat12buttonOutlet.titleLabel.text])
        {
            self.seat12buttonOutlet.backgroundColor=[UIColor redColor];
        }



    }
    
    NSLog(@"%@",self.bookSeatsArray);
    
    
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
-(void)showDetails
{
    NSString *name=self.username;
    NSString *cno=self.cno;
    NSString *picLoc=self.picnicSpot;
     NSLog(@"Pic location%@",picLoc);
    NSString *picDur=self.dur;
    NSString *picPrice=self.price;
    NSString *seatNumber=self.seatNo;
   
    NSString *passanger=[@"Passanger Name:"stringByAppendingString:name];
    NSString *number=[@"\nContact Number:"stringByAppendingString:cno];
    NSString *picSpot=[@"\nPicnic Spot:"stringByAppendingString:picLoc];
    NSString *picDuration=[@"\nDuration of Trip:"stringByAppendingString:picDur];
    NSString *picMoney=[@"\nPrice:"stringByAppendingString:picPrice];
    NSString *seatNum=[@"\nSeat No:"stringByAppendingString:seatNumber];
    
    
    NSString *finalDetail=[passanger stringByAppendingString:number];
    finalDetail=[finalDetail stringByAppendingString:picSpot];
    finalDetail=[finalDetail stringByAppendingString:picDuration];
    finalDetail=[finalDetail stringByAppendingString:picMoney];
    finalDetail=[finalDetail stringByAppendingString:seatNum];
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Details of Trip" message:finalDetail preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        nil;
        
        
    }];
    UIAlertAction *bookAction=[UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        nil;
        
        NSString *query=[NSString stringWithFormat:@"insert into booking(passanger_name,passanger_no,passanger_spot,seat_no)values(\"%@\",\"%@\",\"%@\",\"%@\")",name,cno,picLoc,seatNumber];
        int isSuccess=[[DatabaseLib getSharedObj]executeQuery:query];
        if(isSuccess)
        {
            NSLog(@"Passanger Info Inserted Successfully");
            
            //self.seat1buttonOutlet.backgroundColor=[UIColor redColor];
            
            if([seatNumber isEqualToString:self.seat1buttonOutlet.titleLabel.text])
            {
                self.seat1buttonOutlet.backgroundColor=[UIColor redColor];
            }
            else if([seatNumber isEqualToString:self.seat2buttonOutlet.titleLabel.text])
            {
                self.seat2buttonOutlet.backgroundColor=[UIColor redColor];
            }
            else if([seatNumber isEqualToString:self.seat3buttonOutlet.titleLabel.text])
            {
                self.seat3buttonOutlet.backgroundColor=[UIColor redColor];
            }
            else if([seatNumber isEqualToString:self.seat4buttonOutlet.titleLabel.text])
            {
                self.seat4buttonOutlet.backgroundColor=[UIColor redColor];
            }
            else if([seatNumber isEqualToString:self.seat5buttonOutlet.titleLabel.text])
            {
                self.seat5buttonOutlet.backgroundColor=[UIColor redColor];
            }
            else if([seatNumber isEqualToString:self.seat6buttonOutlet.titleLabel.text])
            {
                self.seat6buttonOutlet.backgroundColor=[UIColor redColor];
            }
            else if([seatNumber isEqualToString:self.seat7buttonOutlet.titleLabel.text])
            {
                self.seat7buttonOutlet.backgroundColor=[UIColor redColor];
            }
            else if([seatNumber isEqualToString:self.seat8buttonOutlet.titleLabel.text])
            {
                self.seat8buttonOutlet.backgroundColor=[UIColor redColor];
            }
            else if([seatNumber isEqualToString:self.seat9buttonOutlet.titleLabel.text])
            {
                self.seat9buttonOutlet.backgroundColor=[UIColor redColor];
            }
            else if([seatNumber isEqualToString:self.seat10buttonOutlet.titleLabel.text])
            {
                self.seat10buttonOutlet.backgroundColor=[UIColor redColor];
            }
            else if([seatNumber isEqualToString:self.seat11buttonOutlet.titleLabel.text])
            {
                self.seat11buttonOutlet.backgroundColor=[UIColor redColor];
            }
            else if([seatNumber isEqualToString:self.seat12buttonOutlet.titleLabel.text])
            {
                self.seat12buttonOutlet.backgroundColor=[UIColor redColor];
            }

            
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
}

- (IBAction)selectSeatsButton:(id)sender
{
    UIButton *button=sender;
    NSString *seatno=button.titleLabel.text;
    NSString *query=[NSString stringWithFormat:@"select * from booking where passanger_spot=\"%@\"",self.picnicSpot];
    self.bookSeatsArray=[[DatabaseLib getSharedObj]getAllPassangerSeatRecords:query];
    NSLog(@"%@",self.bookSeatsArray);
   if([self.bookSeatsArray containsObject:seatno])
   {
       UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"This Seat Already Booked!!!" message:@"Please Select Other Seat" preferredStyle:UIAlertControllerStyleAlert];
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
       UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Book Now!!!" message:@"" preferredStyle:UIAlertControllerStyleAlert];
       UIAlertAction *bookAction=[UIAlertAction actionWithTitle:@"BOOK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
           nil;
           self.username=self.mytextField.text;
           self.cno=self.numtextField.text;
           
           
           NSLog(@"user name:%@",self.username);
           
           if(self.mytextField.text.length>0&&self.numtextField.text.length==10)
           {
               self.seatNo=seatno;
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
       }];
   }
}
@end
