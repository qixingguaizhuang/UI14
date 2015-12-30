//
//  CellOfContect.m
//  UI14_TableView自定义 cell 代理设计模式
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import "CellOfContect.h"

#define WIDTH self.contentView.frame.size.width

#define HEIGHT self.contentView.frame.size.height
@interface CellOfContect ()

/**控件*/

@property (nonatomic,retain) UIScrollView *scroller;
@property (nonatomic,retain) UIButton *btnForDele;
@property (nonatomic,retain)UIButton *btnForEdie;

@end



@implementation CellOfContect

- (void)dealloc{
    [_scroller release];
    [_btnForDele release];
    [_btnForEdie release];
    [_lableForTitle release];
    [super dealloc];
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self createSubview];
        
    }

    return self;
}


- (void)createSubview{
    
    // scrollview 
    
    self.scroller = [[UIScrollView alloc] init];
    [self.contentView addSubview:self.scroller];
    [_scroller release];
    self.scroller.backgroundColor = [UIColor whiteColor];
    
    
    self.scroller.showsHorizontalScrollIndicator = NO;
    self.scroller.bounces = NO;
    self.scroller.pagingEnabled = YES;
    
    

    //buttForDele UIButtonTypeCustom 自定义视图 下载图片什么颜色那么就是颜色
    
    self.btnForDele = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scroller addSubview:self.btnForDele];
//    [self.btnForDele setTitle:@"Delete" forState:UIControlStateNormal];
//    self.btnForDele.backgroundColor = [UIColor yellowColor];
    
    //[self.btnForDele setBackgroundImage:[UIImage imageNamed:@"r"] forState:UIControlStateNormal];
    
    [self.btnForDele setImage:[UIImage imageNamed:@"t"] forState:UIControlStateNormal];
    
    // 方法
    
    [self.btnForDele addTarget:self action:@selector(handleDele:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    // btnForEdit
    
    self.btnForEdie = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.scroller addSubview:self.btnForEdie];
    [self.btnForEdie setTitle:@"Edit" forState:UIControlStateNormal];
    self.btnForEdie.backgroundColor = [UIColor orangeColor];
    
    // lable 放到 scroller 上
    
    self.lableForTitle = [[UILabel alloc] init];
    [self.scroller addSubview:self.lableForTitle];
    [_lableForTitle release];


}


// 实现 点击 buttton 

- (void)handleDele:(UIButton *)button{
    
    if ([self.delegate respondsToSelector:@selector(handleDeleAction:)])  {
        [self.delegate handleDeleAction:self];
    }

}




- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.scroller.frame = self.contentView.frame;
    self.scroller.contentSize = CGSizeMake(WIDTH + 50 + 80, HEIGHT);
    
    self.btnForEdie.frame = CGRectMake(WIDTH , 0, 50, HEIGHT);
    self.btnForDele.frame = CGRectMake(WIDTH + 50, 0 , 80, HEIGHT);
    
    self.lableForTitle.frame = CGRectMake(10, 10, 100, HEIGHT - 20);

}













- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
