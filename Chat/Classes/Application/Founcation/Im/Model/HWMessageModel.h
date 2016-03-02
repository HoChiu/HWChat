//
//  HWMessageModel.h
//  Chat
//
//  Created by Howe on 15/12/3.
//  Copyright © 2015年 HW. All rights reserved.
//  消息数据模型

#import <Foundation/Foundation.h>
typedef enum
{
    HWMessageModelTypeMe,
    HWMessageModelTypeOther
}HWMessageModelType;

@interface HWMessageModel : NSObject
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, assign) HWMessageModelType messageType;
@end
