//
//  tabelView.m
//  tableView组头点击
//
//  Created by MAC on 2017/3/29.
//  Copyright © 2017年 笑. All rights reserved.
//

#import "tabelView.h"

@implementation tabelView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame WithDataArrray:(NSArray *) arr{
    self = [super initWithFrame:frame];
    if (self) {
        _dataArraay = [NSArray arrayWithArray:arr];
        
        _select_table = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
        _select_table.delegate = self;
        _select_table.dataSource = self;
        _select_table.backgroundView = nil;
        _select_table.backgroundColor = [UIColor clearColor];
        _select_table.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_select_table];
        
        self.backgroundColor = [UIColor lightGrayColor];
        self.alpha = 0.5;
    }
    return self;
}

//MARK: ===============
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArraay.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView  dequeueReusableCellWithIdentifier:@"CellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = [_dataArraay objectAtIndex:indexPath.row];
//    [cell setSeparatorInset:UIEdgeInsetsZero];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectrow:)]) {
        [self.delegate selectrow:indexPath.row];
    }}


@end
