//
//  UIImage+Extension.m
//  15QQ聊天界面
//
//  Created by 超豪 赵 on 15/1/15.
//  Copyright (c) 2015年 超豪 赵. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)resizableImage:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    CGFloat w = image.size.width * 0.5f;
    CGFloat h = image.size.height * 0.5f;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w) ];
}
@end
