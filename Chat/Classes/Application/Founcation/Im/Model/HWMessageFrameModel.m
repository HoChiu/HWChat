//
//  HWMessageFrameModel.m
//  Chat
//
//  Created by Howe on 15/12/3.
//  Copyright © 2015年 HW. All rights reserved.
//  消息Frame 计算模型

#import "HWMessageFrameModel.h"
#import "NSString+Extension.h"

#define headImageW 40.0f
#define headImageH 40.0f
#define marginX 10.0f
#define marginY 10.0f
#define msgFont [UIFont systemFontOfSize:14.0f]
@implementation HWMessageFrameModel
- (void)setMsgModel:(HWMessageModel *)msgModel
{
    _msgModel = msgModel;
    self.headImageFrame = CGRectMake(marginX, marginY, headImageW, headImageH);
    CGFloat msgX = CGRectGetMaxX(self.headImageFrame) + marginX;
    CGFloat msgMaxW = WIDTH - 2 * msgX;
    CGSize maxSize = CGSizeMake(msgMaxW, CGFLOAT_MAX);
    CGSize msgSize = [self sizeWithString:msgModel.msg Font:msgFont WithMaxSize:maxSize];
    self.msgFrame = CGRectMake(msgX, marginY, msgSize.width + 40.0f , msgSize.height + 20.0f);
    self.cellHegiht = CGRectGetMaxY(self.msgFrame) + marginY;
   

}

- (CGSize) sizeWithString:(NSString *)str Font:(UIFont *)font WithMaxSize:(CGSize)maxSize
{
//设置号文字的属性
NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
attributes[NSFontAttributeName] = font;
//设置好文字的区域范围，最大宽度固定，高度默认无限高
//将文字的区域范围传入，选择属性，传入文字的属性
CGSize realSize = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;

return realSize;
}
@end
