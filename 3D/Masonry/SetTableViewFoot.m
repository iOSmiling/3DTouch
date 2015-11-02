//
//  SetTableViewFoot.m
//  BauDuMapTest
//
//  Created by 薛坤龙 on 15/6/23.
//  Copyright (c) 2015年 薛坤龙. All rights reserved.
//

#import "SetTableViewFoot.h"

@implementation SetTableViewFoot

+ (void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    
}

@end
