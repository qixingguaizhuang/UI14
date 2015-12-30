//
//  ViewController.m
//  UI14_TableView自定义 cell 代理设计模式
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "ViewController.h"
#import "CellOfContect.h"
#import "SecondViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate,CellForDelegate>

@property (nonatomic, retain)UITableView *tableView;
@property ( nonatomic, retain)NSMutableArray *arr;

@end

@implementation ViewController

-(void)dealloc{

    [_tableView dealloc];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self creatTableView];
    [self handelDate];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"NEXT" style:UIBarButtonItemStylePlain target:self action:@selector(handleNext:)];
    
}

// 实现挑战页面

- (void)handleNext:(UIBarButtonItem *)barBtn{

    SecondViewController *second = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:second animated:YES];
    
    [second release];

}

/** 数据处理 */

- (void)handelDate{

    self.arr = @[@"wang",@"li",@"zhang",@"zhou",@"wu",@"song"].mutableCopy;
}


/** 创建 tableView */

- (void)creatTableView{

    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [_tableView release];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[CellOfContect class] forCellReuseIdentifier:@"pool1"];

}

#pragma mark - DateSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.arr.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CellOfContect *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
    
    cell.delegate = self;//指定代理人  cell 创建时, 在cell 里指定代理人
    
    cell.lableForTitle.text = [self.arr objectAtIndex:indexPath.row];

    return cell;
}


#pragma mark --- delegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}


/** 删除没反应 怎么办 **/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"ddd");

}







#pragma mark _ CellForDelegate  实现 CellOfContent 中的代理方法

/** 删除 cell */

- (void)handleDeleAction:(CellOfContect *)cell{ // 点哪个cell 就是哪个
    
    // 获取 indexPath 位置

    NSIndexPath *indexPath =  [self.tableView indexPathForCell:cell];
    
    //数据
    
    [self.arr removeObjectAtIndex:indexPath.row];
    
    //删除cell
    
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    

}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
