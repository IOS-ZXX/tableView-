//
//  SelectViewCtrl.m
//  tableView组头点击
//
//  Created by MAC on 2017/3/28.
//  Copyright © 2017年 笑. All rights reserved.
//

#import "SelectViewCtrl.h"

#define WScree [UIScreen mainScreen].bounds.size

@interface SelectViewCtrl ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    UICollectionViewFlowLayout * flayout1;
    UICollectionViewFlowLayout * flayout2;
}



@end

@implementation SelectViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    flayout1 = [[UICollectionViewFlowLayout alloc]init];
    flayout1.itemSize = CGSizeMake(WScree.width/3-20, 70);
    flayout1.minimumLineSpacing = 5;
    flayout1.minimumInteritemSpacing = 5;
    
    flayout2 = [[UICollectionViewFlowLayout alloc]init];
    flayout2.itemSize = CGSizeMake(WScree.width, 40);
    flayout2.minimumLineSpacing = 5;
    flayout2.minimumInteritemSpacing = 5;
    
    _coolect.collectionViewLayout = flayout1;
    [_coolect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CellID"];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setFrame:CGRectMake(0, 0, 25, 25)];
    [backButton setImage:[UIImage imageNamed:@"icon_jiantou_back.png"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"icon_jiantou_back.png"] forState:UIControlStateHighlighted];
    backButton.backgroundColor = [UIColor clearColor];
    [backButton addTarget:self action:@selector(rightBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton] ;
}

- (void)rightBarButtonClick:(UIButton *)sender{
    sender.selected ^= 1;
    if (sender.selected) {
        _coolect.collectionViewLayout = flayout2;
    }else{
        _coolect.collectionViewLayout = flayout1;
    }
    [_coolect reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor cyanColor];
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
