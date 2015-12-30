//
//  CellOfContect.h
//  UI14_TableView自定义 cell 代理设计模式
//
//  Created by dllo on 15/12/30.
//  Copyright © 2015年 doll-61. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CellOfContect;

@protocol CellForDelegate <NSObject>

- (void)handleDeleAction:(CellOfContect *) cell;

@end


@interface CellOfContect : UITableViewCell

@property (nonatomic, retain)UILabel *lableForTitle;
@property (nonatomic,assign)id<CellForDelegate> delegate;

@end
