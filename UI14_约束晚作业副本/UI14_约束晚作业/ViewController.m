//
//  ViewController.m
//  UI14_约束晚作业
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "ViewController.h"
#import "CellOfFirst.h"

@interface ViewController ()
@property (nonatomic, retain) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self creatTableView];
}


- (void)creatTableView{


    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
 
    UINib *nib = [UINib nibWithNibName:@"CellOfFirst" bundle:[NSBundle mainBundle]];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:@"pool1"];
    
    


}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
