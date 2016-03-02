//
//  HWFriendCell.m
//  Chat
//
//  Created by Howe on 15/11/27.
//  Copyright © 2015年 HW. All rights reserved.
//

#import "HWFriendCell.h"
@interface HWFriendCell()
//头像
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
//昵称
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
//签名
@property (weak, nonatomic) IBOutlet UILabel *signatureLabel;
//在线状态
@property (weak, nonatomic) IBOutlet UILabel *onLineStateLabel;

@end
@implementation HWFriendCell

- (void)awakeFromNib {


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
