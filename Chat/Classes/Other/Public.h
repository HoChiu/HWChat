//
//  Public.h
//  Chat
//
//  Created by Howe on 15/11/29.
//  Copyright © 2015年 HW. All rights reserved.
//

#ifndef Public_h
#define Public_h


//--------------------------尺寸定义区----------------------------------

//屏幕宽高
#define WIDTH         [UIScreen mainScreen].bounds.size.width
#define HEIGHT        [UIScreen mainScreen].bounds.size.height
/**状态栏高度*/
#define STATUSH       [UIApplication sharedApplication].statusBarFrame.size.height
/**导航栏高度*/
#define NAVGATIONH    self.navigationController.navigationBar.frame.size.height
/**导航栏状态栏高度*/
#define NAVANDSTATEH  (self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height)

#define TABBARH       self.tabBarController.tabBar.frame.size.height
/**导航栏分栏状态栏高度*/
#define NAVANDTABANDSTATEH (NAVANDSTATEH + TABBARH)

//---------------------------方法定义区-----------------------------------
//RGB颜色 不带透明度
#define  HWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
//RGB颜色 带透明度
#define  HWColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
//随机色  不带透明度
#define  HWRandomColor HWColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
//随机色  带透明度
#define HWRandomColorAlpha(alpha) HWColorRGBA(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256),alpha)

//错误打印
#define HWErrorLog(format, ...) NSLog(@"\n####################Error####################line %d in function:%s\n" format,__LINE__,__FUNCTION__,## __VA_ARGS__)
//信息打印
#define HWDebugLog(format, ...) NSLog(@"\n#################### Msg ####################line %d in function:%s\n" format,__LINE__,__FUNCTION__,## __VA_ARGS__)


#endif /* Public_h */


