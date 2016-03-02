//
//  HWImViewController.m
//  Chat
//
//  Created by Howe on 15/11/27.
//  Copyright © 2015年 HW. All rights reserved.
//

#import "HWImViewController.h"
#import "HWFriendCell.h"
#import "HWImViewController.h"
#import "HWChatViewController.h"

@interface HWImViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation HWImViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}
- (void)loadView
{
    [super loadView];
    self.view.h = self.view.h - NAVANDTABANDSTATEH;
    
}
- (void)setupView
{
    
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain ];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 70.0f;
    [tableView registerNib:[UINib nibWithNibName:@"HWFriendCell" bundle:nil] forCellReuseIdentifier:@"friends"];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.view.w, 40.0f)];
    tableView.tableHeaderView = searchBar;
    searchBar.delegate = self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HWFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"friends"];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HWChatViewController *chatVC = [[HWChatViewController alloc]init];
    chatVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
#pragma mark UISearchDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"HWSearchViewController"];
    [self presentViewController:vc animated:NO completion:nil];
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; 
}



@end
