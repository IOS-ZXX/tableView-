//
//  tabelView.h
//  tableView组头点击
//
//  Created by MAC on 2017/3/29.
//  Copyright © 2017年 笑. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol selectTableViewdelegate <NSObject>

- (void)selectrow:(NSInteger)row;

@end

@interface tabelView : UIView <UITableViewDelegate,UITableViewDataSource>

- (instancetype)initWithFrame:(CGRect)frame WithDataArrray:(NSArray *) arr;

@property (strong , nonatomic) NSArray * dataArraay;
@property (strong , nonatomic) UITableView * select_table;
@property (nonatomic , assign) id<selectTableViewdelegate> delegate;

@end
