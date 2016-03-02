//
//  UIStoryboard+Extension.m
//  Chat
//
//  Created by Howe on 15/11/26.
//  Copyright © 2015年 HW. All rights reserved.
//

#import "UIStoryboard+Extension.h"

@implementation UIStoryboard (Extension)
+ (void)showInControllerName:(NSString *)coltrolName
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:coltrolName bundle:nil];
    [UIApplication sharedApplication].keyWindow.rootViewController= [sb instantiateInitialViewController];

}
@end
