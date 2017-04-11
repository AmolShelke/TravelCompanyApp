//
//  firstViewController.m
//  TravelCompany
//
//  Created by Student P_07 on 10/04/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "firstViewController.h"
#import "ViewController.h"
@interface firstViewController ()

@end

@implementation firstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.passwordText.secureTextEntry=YES;
    self.userNameText.placeholder=@"Enter User Name";
    self.passwordText.placeholder=@"Enter Password";
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated
{
    self.userNameText.text=@"";
    self.passwordText.text=@"";
    [self.userNameText becomeFirstResponder] ;
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
-(void)wrongPassword
{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"ERROR!!!!!!" message:@"You Enter Wrong User name or Password" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        nil;
        self.userNameText.text=@"";
        self.passwordText.text=@"";
    }];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:^{
        nil;
    }];
}
- (IBAction)logInButton:(id)sender
{
    NSString *userName,*password;
    userName=self.userNameText.text;
    password=self.passwordText.text;
    if([password isEqualToString:@"1234"]&&[userName isEqualToString:@"amol"])
    {
        ViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        vc.isUser=@"no";
        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
       
        [self wrongPassword];
    }
}

- (IBAction)userButton:(id)sender
{
    ViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    vc.isUser=@"yes";
    [self.navigationController pushViewController:vc animated:YES];
}
@end
