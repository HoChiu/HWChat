//
//  HWMessageFrameModel.h
//  Chat
//
//  Created by Howe on 15/12/3.
//  Copyright © 2015年 HW. All rights reserved.
//  消息Frame 计算模型

#import <Foundation/Foundation.h>
#import "HWMessageModel.h"

@interface HWMessageFrameModel : NSObject

@property (nonatomic, assign) CGRect headImageFrame;

@property (nonatomic, assign) CGRect msgFrame;

@property (nonatomic, assign) CGFloat cellHegiht;

@property (nonatomic, strong)  HWMessageModel *msgModel;
@end
