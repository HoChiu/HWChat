//
//  NSString+Extension.m
//  Chat
//
//  Created by Howe on 15/12/3.
//  Copyright © 2015年 HW. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (CGSize)sizeWithFont:(UIFont *)font WithMaxSize:(CGSize)maxSize
{
    //设置号文字的属性
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = font;
    //设置好文字的区域范围，最大宽度固定，高度默认无限高
    //将文字的区域范围传入，选择属性，传入文字的属性
    CGSize realSize = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    return realSize;
}
@end
