//
//  LeftMenuViewController.m
//  SideMenu
//
//  Created by NiYao on 15/4/20.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "DefinatonsHeader.h"

@interface LeftMenuViewController ()

@end

@implementation LeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    self.menuList = @[@"About Me", @"iTucao", @"GitHub", @"Twitter"];
    
    self.menuTable = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.menuTable.frame = CGRectMake(10, 65, 280, ScreenHeight);
    self.menuTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.menuTable.delegate = self;
    self.menuTable.dataSource = self;
    [self.menuTable setBackgroundColor:[UIColor orangeColor]];
    
    [self.view addSubview:self.menuTable];
    
}
//Required!!!!
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.menuList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setBackgroundColor:[UIColor orangeColor]];
    cell.textLabel.text = self.menuList[indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
