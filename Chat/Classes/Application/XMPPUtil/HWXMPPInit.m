//
//  HWXMPPInit.m
//  Chat
//
//  Created by Howe on 15/12/9.
//  Copyright © 2015年 HW. All rights reserved.
//

#import "HWXMPPInit.h"
#import "XMPP.h"
@interface HWXMPPInit()
@property (nonatomic, strong) XMPPStream *xmppStream;

@end
@implementation HWXMPPInit


/**
 *  单例
 *
 *  @return
 */

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static HWXMPPInit * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}

/**
 *  工厂方法
 *
 *  @return
 */
+ (instancetype)shareXmpp
{
    return [[[self class]alloc]init];
}


/**
 *  懒加载 XMPPStream
 *
 *  @return
 */
- (XMPPStream *)xmppStream
{
    if (_xmppStream == nil)
    {
        _xmppStream = [[XMPPStream alloc]init];
        
        [_xmppStream addDelegate:self delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    }
    return _xmppStream;
}
/**
 *  //////////////////////////////////////私有方法/////////////////////////////////////////////////
 */

#pragma mark private method


/**
 *  发送登录成功消息给服务器
 */
- (void)sendOnLineMsg
{
    XMPPPresence *onLineMsg = [XMPPPresence presence];
    [self.xmppStream sendElement:onLineMsg];
}

/**
 *  发送离线消息给服务器
 */
- (void)sendOutLineMsg
{
    XMPPPresence *outLineMsg = [XMPPPresence presenceWithType:@"unavailable"];
    [self.xmppStream sendElement:outLineMsg];

}


/**
 *  断开服务器连接
 */
- (void)closeServerConnection
{
    [self.xmppStream disconnect];

}

/**
 *  //////////////////////////////////////登陆/////////////////////////////////////////////////
 */
#pragma mark Login Method
/**
 *  登录
 * Login 1
 */
+ (void)xmppLogin
{
    [[self shareXmpp]closeServerConnection];
    [[self shareXmpp]loginConnectionToHost];
}

/**
 *  使用密码进行登录
 * Login 4
 */
- (void)loginWithPwd
{
    NSError *error = nil;
    id obj = [self.xmppStream valueForKey:@"state"];
    NSLog(@"%@",obj);
    NSString *password = [[NSUserDefaults standardUserDefaults]objectForKey:kPasswrod];
    [self.xmppStream authenticateWithPassword:password error:&error];

    if (error)
    {
        HWErrorLog(@"%@",error);
        [KVNProgress dismiss];
        [KVNProgress showErrorWithStatus:@"登录失败!"];
    }

}
/**
 *  登录连接到服务器
 * Login 2
 */
- (void)loginConnectionToHost
{
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:kUserName];
    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:kPasswrod];
    NSString *serverIP = [[NSUserDefaults standardUserDefaults] objectForKey:kServerIP];
    
    HWDebugLog(@"User:%@ password:%@ serverIP:%@",username,password,serverIP);
    
    self.xmppStream.myJID = [XMPPJID jidWithUser:username domain:@"howe.local" resource:@"叼咋天iPhone60"];
//    self.xmppStream.myJID = [XMPPJID jidWithString:@"zch@howe.local"];
    self.xmppStream.hostName = serverIP;
    self.xmppStream.hostPort = 5222;
    NSError *error = nil;
    [self.xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error];
    if (error)
    {
        HWErrorLog(@"%@",error);
    }
}

/**
 *  注册连接到服务器
 * Login 2
 */
- (void)regConnectionToHost
{
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:kUserName];
    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:kPasswrod];
    NSString *serverIP = [[NSUserDefaults standardUserDefaults] objectForKey:kServerIP];
    
    HWDebugLog(@"User:%@ password:%@ serverIP:%@",username,password,serverIP);
    
    self.xmppStream.myJID = [XMPPJID jidWithUser:username domain:@"howe.local" resource:@"叼咋天iPhone60"];
    //    self.xmppStream.myJID = [XMPPJID jidWithString:@"zch@howe.local"];
    self.xmppStream.hostName = serverIP;
    self.xmppStream.hostPort = 5222;
    NSError *error = nil;
    [self.xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error];
    if (error)
    {
        HWErrorLog(@"%@",error);
    }
}

/**
 *  //////////////////////////////////////登出/////////////////////////////////////////////////
 */

/**
 *  登出
 */
+ (void)xmppLogOut
{
    [[self shareXmpp]sendOutLineMsg];
    [[self shareXmpp ]closeServerConnection];
    
}

/**
 *  //////////////////////////////////////注册/////////////////////////////////////////////////
 */

/**
 *  注册
 */
+ (void)xmppRegUser
{


}

/**
 *  //////////////////////////////////////代理/////////////////////////////////////////////////
 */


#pragma mark XMPPStream Delegate

/**
 *  连接服务器成功
 * Login 3
 *  @param sender
 */
- (void)xmppStreamDidConnect:(XMPPStream *)sender
{
    HWDebugLog(@"服务器连接成功!");

    [self loginWithPwd];

}

/**
 *  登录成功
 * Login 5
 *  @param sender
 */
- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender
{
    HWDebugLog(@"用户登录成功!");

    dispatch_sync(dispatch_get_main_queue(), ^{
    [KVNProgress dismiss];
    [UIStoryboard showInControllerName:@"Main"];
    });
    [self sendOnLineMsg];

}
/**
 *  登录失败
 *
 *  @param sender
 *  @param error
 */
- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(NSXMLElement *)error
{
    HWErrorLog(@"登录失败%@",error);
}



























@end
