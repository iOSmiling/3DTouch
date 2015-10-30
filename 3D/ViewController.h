//
//  ViewController.h
//  3D
//
//  Created by 薛坤龙 on 15/10/30.
//  Copyright © 2015年 薛坤龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


/*
 
 1: （可选） UIApplicationShortcutItemIconType触发3D Touch时显示的图标类型
 
            UIApplicationShortcutIconTypeShare显示分享的图标
 
 2: （必须） UIApplicationShortcutItemTitle 显示菜单项名字的
 
 3: （可选）UIApplicationShortcutItemSubtitle：这个表示菜单项的子标题
 
 4: （必须） UIApplicationShortcutItemType相当于项目中的Bundle Identifier唯一的，通过这个标示我们可以判断点相应的那一项触发相应的操作
 
 5:（可选） UIApplicationShortcutItemUserInfo  这个代表了菜单项点击后，传入的用户信息，也是可选的
 
 6:（可选）UIApplicationShortcutItemIconFile：这个属性表示菜单图标的文件名，和 UIApplicationShortcutItemIconType 相对应，这个属性可以让你指定自己的文件作为菜单图标，更加灵活。
 
 */

@end

