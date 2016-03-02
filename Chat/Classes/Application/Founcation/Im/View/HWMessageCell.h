//
//  HWMessageCell.h
//  Chat
//
//  Created by Howe on 15/12/3.
//  Copyright © 2015年 HW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWMessageFrameModel.h"

@interface HWMessageCell : UITableViewCell
@property(nonatomic, strong) HWMessageFrameModel *model;

+ (instancetype)createMessageCellWithTableView:(UITableView *)tableView MessageFrameModel:(HWMessageFrameModel *)model;
@end
