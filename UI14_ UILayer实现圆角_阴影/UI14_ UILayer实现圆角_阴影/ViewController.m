//
//  ViewController.m
//  UI14_ UILayer实现圆角_阴影
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];

    /** 圆角*/
    
    self.button.layer.cornerRadius = self.button.frame.size.width/2;
    self.button.layer.masksToBounds = YES;
    
    /** 边 */
    
    self.button.layer.borderWidth = 1.f;
    self.button.layer.borderColor = [UIColor redColor].CGColor;
    
    /** 阴影 */
    
    self.button.layer.shadowOffset = CGSizeMake(10, 10);
    
    /** shadowColor 结构体 需要加 cg.*/
    self.button.layer.shadowColor = [UIColor grayColor].CGColor;
    
    /*** 羽化 */
    
    self.button.layer.shadowRadius = 1;
    
    /** 阴影透明度 */
    
    self.button.layer.shadowOpacity = 1;
    
    
    
    // ImageView 圆角
    
    self.imageView.layer.cornerRadius = 40;
    self.imageView.layer.masksToBounds = YES;
    
    
    

    
}

























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
