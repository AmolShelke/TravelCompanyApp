//
//  secondViewController.m
//  TravelCompany
//
//  Created by Student P_04 on 07/04/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "secondViewController.h"
#import "ViewController.h"
#import "DatabaseLib.h"
@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.picnicSpotText.text=self.picnic;
    self.priceText.text=self.price;
    self.durationText.text=self.dur;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)submitButton:(id)sender
{
    
    NSString *pic,*price,*dur;
    pic=self.picnicSpotText.text;
    price=self.priceText.text;
    dur=self.durationText.text;
    //dur=[dur stringByAppendingString:@"HR"];
    
    if([self.buttonPress isEqualToString:@"add"])
    {
        NSString *query=[NSString stringWithFormat:@"insert into travel(pic_spot ,pic_price,pic_duration)values(\"%@\",\"%@\",\"%@\")",pic,price,dur];
       int success= [[DatabaseLib getSharedObj]executeQuery:query];
        if(success)
        {
            NSLog(@"Inserted SuccessFully");
           
        }
        else
        {
            NSLog(@"Insertion failed");
        }
    }
    else
    {
        NSString *query=[NSString stringWithFormat:@"update travel set pic_price=\"%@\",pic_duration=\"%@\" where pic_spot=\"%@\"",price,dur,pic];
        int success= [[DatabaseLib getSharedObj]executeQuery:query];
        if(success)
        {
            NSLog(@"Updated SuccessFully");
            
        }
        else
        {
            NSLog(@"Updation failed");
        }
    }
   
  
   [self.navigationController popViewControllerAnimated:YES];
}
@end
