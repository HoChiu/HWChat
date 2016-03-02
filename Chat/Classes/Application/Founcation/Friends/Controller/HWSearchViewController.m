//
//  HWSearchViewController.m
//  Chat
//
//  Created by Howe on 15/11/29.
//  Copyright © 2015年 HW. All rights reserved.
//

#import "HWSearchViewController.h"

@interface HWSearchViewController ()<UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation HWSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}
- (void)setupView
{
    self.searchBar.delegate = self;

}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{


}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self dismissViewControllerAnimated:NO completion:nil];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
