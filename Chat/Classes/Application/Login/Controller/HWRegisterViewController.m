//
//  HWRegisterViewController.m
//  Chat
//
//  Created by Howe on 15/11/25.
//  Copyright © 2015年 HW. All rights reserved.
//

#import "HWRegisterViewController.h"

@interface HWRegisterViewController ()
@property (weak, nonatomic) IBOutlet UIButton *regBtn;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *nextPasswordTextField;

@end

@implementation HWRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (IBAction)regAction:(id)sender
{
    NSString *username = self.usernameTextField.text;
    NSString *passwrod = self.passwordTextField.text;
    NSString *nextPassword = self.nextPasswordTextField.text;
    if(username == nil || passwrod == nil || nextPassword == nil || username.length == 0 || passwrod.length == 0 ||nextPassword.length == 0)
    {
        [KVNProgress showErrorWithStatus:@"信息未填完!"];
        return;
    }
    if (![passwrod isEqual:nextPassword])
    {
        [KVNProgress showErrorWithStatus:@"两次密码输入不一致!"];
        return;
    }
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
