//
//  HWXMPPInit.h
//  Chat
//
//  Created by Howe on 15/12/9.
//  Copyright © 2015年 HW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWXMPPInit : NSObject

/**
 *  工厂方法
 */
+ (instancetype)shareXmpp;

/**
 *  登录
 */
+ (void)xmppLogin;

/**
 *  登出
 */
+ (void)xmppLogOut;

/**
 *  注册用户
 */
+ (void)xmppRegUser;
@end
