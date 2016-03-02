//
//  HWChatViewController.m
//  Chat
//
//  Created by Howe on 15/11/30.
//  Copyright © 2015年 HW. All rights reserved.
//

#import "HWChatViewController.h"
#import "HWMessageCell.h"
#import "HWMessageFrameModel.h"
@interface HWChatViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation HWChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];

}
- (NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        self.dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (void)setupView
{
    for (int i = 0 ; i<=20; i++) {
        HWMessageFrameModel *model = [[HWMessageFrameModel alloc]init];
        HWMessageModel *msgModel = [[HWMessageModel alloc]init];
        if (i % 5 == 0) {
        msgModel.msg = @"召复赴阙，欲纳诸宫中。木兰曰：‘臣无媲君之礼’，以死誓拒之，迫之不从，遂自尽。帝惊悯，追赠将军，谥‘孝烈’”。意思是木兰姓魏，替父从军后辞官不受，皇上知道真相后又想把她召到后宫中，但木兰宁死不从，自杀身亡，皇上大惊，于是追赠木兰“将军”称号。现河南虞城仍建有木兰祠，祠中设木兰像，并幸存两块祠碑，";
        }else
        {
        msgModel.msg = @"小明今天很高";
        }
        
        model.msgModel = msgModel;
        [self.dataSource addObject:model];
    }
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain ];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.allowsSelection = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:tableView];
    self.tableView = tableView;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HWMessageCell *cell = [HWMessageCell createMessageCellWithTableView:tableView MessageFrameModel:[self.dataSource objectAtIndex:indexPath.row]];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HWMessageFrameModel *model = [self.dataSource objectAtIndex:indexPath.row];
    return model.cellHegiht;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
