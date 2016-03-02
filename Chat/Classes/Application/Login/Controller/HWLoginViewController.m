//
//  HWLoginViewController.m
//  Chat
//
//  Created by Howe on 15/11/25.
//  Copyright © 2015年 HW. All rights reserved.
//

#import "HWLoginViewController.h"
#import "UIStoryboard+Extension.h"
#import "HWXMPPInit.h"

@interface HWLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *serverAddTextField;

@end

@implementation HWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userTextField.text = [[NSUserDefaults standardUserDefaults]objectForKey:kUserName];
    self.passwordTextField.text = [[NSUserDefaults standardUserDefaults]objectForKey:kPasswrod];
    self.serverAddTextField.text = [[NSUserDefaults standardUserDefaults]objectForKey:kServerIP];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)loginAction:(id)sender
{
    [self.view endEditing:YES];
    NSString *username = self.userTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *serverIP = self.serverAddTextField.text;
    if (username == nil || password == nil || serverIP == nil || username.length == 0 || password.length == 0 || serverIP.length == 0)
    {
        [KVNProgress showErrorWithStatus:@"登陆失败!\n请检查用户名密码和服务器地址!"];
        return;
    }
    [KVNProgress show];
    [[NSUserDefaults standardUserDefaults] setObject:username forKey:kUserName];
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:kPasswrod];
    [[NSUserDefaults standardUserDefaults] setObject:serverIP forKey:kServerIP];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [HWXMPPInit xmppLogin];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
