//
//  SecondViewController.m
//  UI14_TableView自定义 cell 代理设计模式
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain)NSMutableArray *arr;
@property (nonatomic, retain)UITableView *tableView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self creatTableView];
    [self handleDate];
    
}


- (void)handleDate{

    self.arr = @[ @"wang", @"li",@"zho",@"da", @"femgh"].mutableCopy;


}

- (void)creatTableView{

    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
    
    [_tableView release];
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"pool1"];


}



/** DataSource 代理*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.arr.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
    
    cell.textLabel.text = [self.arr objectAtIndex: indexPath.row];
    
    return cell;
    
}

/** 返回行高 */

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;

}



#pragma mark - tableView delegate

/** ios 8 推出新的 API 右侧滑动 cell 出现附加控件*/



- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{

//创建多个rowAction
    
  UITableViewRowAction *actionedie =  [UITableViewRowAction rowActionWithStyle:1 title:@"Edit" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
      
      
      [self alertControllerForEdit];
        
        
        NSLog(@"DDD");
    }];
    
    
    UITableViewRowAction *actionDele = [UITableViewRowAction rowActionWithStyle:0 title:@"Dele" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        

        [self alertControllerWithIndexPath:indexPath];
        
    }];

    return @[actionedie,actionDele];
    
}


#pragma mark --- 弹出弹窗 是否删除 alertController

/** UIAlertControlller */

- (void)alertControllerWithIndexPath:(NSIndexPath *) indexPath{

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否删除" preferredStyle: UIAlertControllerStyleAlert];
    
    
    /** 添加 Action  */
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //取出两个 textField 内容
        NSArray *arr = alert.textFields;
        
        for (UITextField *tf in arr) {
            
            NSLog(@"%@",tf.text);
        }
    }];
    
    
    UIAlertAction *actionDele = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"哦,我是 cancel ");
    }];
    
    
    UIAlertAction *actionDetail = [UIAlertAction actionWithTitle:@"Delete" style:2 handler:^(UIAlertAction * _Nonnull action) {
        
       // 删除 cell
    
        [self deleteCell:indexPath];
        
    }];
    
    // textField
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        //占位符
        textField.placeholder = @"请输入用户名";
        
    }];

    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入密码";
        //密文输入
        textField.secureTextEntry = YES;
        
    }];
  
    /** 添加 action */
    
    [alert addAction:actionOk];
    [alert addAction:actionDele];
    [alert addAction:actionDetail];
    
    
    /** 模态退出 */
    
    [self presentViewController:alert animated:YES completion:^{
        
    }];
    
    
}



- (void)deleteCell:(NSIndexPath *)indexPath{

// 数据 删除
    
    [self.arr removeObjectAtIndex:indexPath.row];
    
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

}


//edit 方法

- (void)alertControllerForEdit{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否编辑" preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    //添加 action
    
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"ok" style:2 handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"DDD");
    }];
    
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"Cencel" style:1 handler:^(UIAlertAction * _Nonnull action) {
      
        NSLog(@"哦");
    }];
    
    
    [alert addAction:actionCancel];
    
    [alert addAction:actionOk];
  
    
    /** 模态 */
    [self presentViewController:alert animated:YES completion:nil];


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
