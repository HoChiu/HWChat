//
//  HWMessageCell.m
//  Chat
//
//  Created by Howe on 15/12/3.
//  Copyright © 2015年 HW. All rights reserved.
//

#import "HWMessageCell.h"
#import "UIImage+Extension.h"

@interface HWMessageCell()
@property(nonatomic, weak) UIImageView *headImageView;
@property(nonatomic, weak) UIButton *messageView;
@end
@implementation HWMessageCell

- (void)awakeFromNib {
    // Initialization code
}
+ (instancetype)createMessageCellWithTableView:(UITableView *)tableView MessageFrameModel:(HWMessageFrameModel *)model
{
    HWMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell = [[HWMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        [cell setupView];
        
    }
    cell.model = model;
    
    return cell;
}
- (void)setupView
{
    self.selectionStyle  = UITableViewCellSelectionStyleNone;
    UIImageView *headImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"headImage"]];
    [self.contentView addSubview:headImageView];
    self.headImageView = headImageView;
    
    UIButton *messageView = [[UIButton alloc]init];
    [messageView.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [messageView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    messageView.contentEdgeInsets = UIEdgeInsetsMake(20.0f, 10.0f, 20.0f, 10.0f);
    messageView.titleLabel.numberOfLines = 0;
    [self.contentView addSubview:messageView];
    self.messageView = messageView;

}
- (void)setModel:(HWMessageFrameModel *)model
{
    _model = model;
    self.headImageView.frame = model.headImageFrame;
    [self.headImageView.layer setCornerRadius:model.headImageFrame.size.height * 0.5f];
    [self.headImageView.layer setMasksToBounds:YES];
    self.messageView.frame = model.msgFrame;
    [self.messageView setTitle:model.msgModel.msg forState:UIControlStateNormal];
    [_messageView setBackgroundImage:[UIImage resizableImage:@"ReceiverVoiceNodeBack"] forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

@end
