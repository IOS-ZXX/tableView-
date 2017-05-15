//
//  btn1.m
//  tableView组头点击
//
//  Created by MAC on 2017/3/14.
//  Copyright © 2017年 笑. All rights reserved.
//

#import "btn1.h"

@implementation btn1

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithsSpaceHeight:(CGFloat)height
{
    self = [super init];
    if (self) {
        _spaceHeight = height;
    }
    return self;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self setTitleEdgeInsets:UIEdgeInsetsMake(self.imageView.frame.size.height+_spaceHeight,-self.imageView.frame.size.width, 0.0,0.0)];
    
    [self setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,self.titleLabel.bounds.size.height, -self.titleLabel.bounds.size.width)];
}

@end
