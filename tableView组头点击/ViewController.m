//
//  ViewController.m
//  tableView组头点击
//
//  Created by MAC on 2017/3/12.
//  Copyright © 2017年 笑. All rights reserved.
//

#import "ViewController.h"
#import "SelectViewCtrl.h"
#import "tabelView.h"
#import "btn1.h"

#import <myTool/myTool.h>

//#import "UIView+ELNTransitionAnimation.h"

#define Ws [UIScreen mainScreen].bounds.size

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,UIActionSheetDelegate,selectTableViewdelegate>{
    BOOL openSection1, openSection2;//判断分组1是否打开,关闭
    
    UIButton * titleL;
}

@property (strong , nonatomic) UITableView * myTabele;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    openSection1 = YES;
    openSection2 = YES;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.modalPresentationCapturesStatusBarAppearance = NO;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
//    titleL = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
//    [titleL setTitle:@"动动我试试" forState:UIControlStateNormal];
//    [titleL setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [titleL addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.titleView = titleL;
    
    _myTabele = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Ws.width, Ws.height-100) style:UITableViewStylePlain];
    _myTabele.delegate = self;
    self.myTabele.dataSource = self;
    self.myTabele.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:_myTabele];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setFrame:CGRectMake(0, 0, 25, 25)];
    [backButton setImage:[UIImage imageNamed:@"cebian_sel@2x.png"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"cebian_sel@2x.png"] forState:UIControlStateHighlighted];
    backButton.backgroundColor = [UIColor clearColor];
    [backButton addTarget:self action:@selector(rightBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton] ;
}

- (void)rightBarButtonClick:(UIButton *)sender{
    SelectViewCtrl * vc = [[SelectViewCtrl alloc]init];
    [self.view.superview setTransformAnimation:ELNTransitionAnimationTypeMoveIn andDuration:0.5 andToward:ELNTransitionAnimationTowardTypeFromLeft];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)Click:(UIButton *)sender{
    sender.selected = !sender.selected;
    NSArray * data = @[@"这是1",@"这是2"];
    tabelView * tmpTabView = [[tabelView alloc]initWithFrame:CGRectMake(0, 0, Ws.width, 100) WithDataArrray:data];
    tmpTabView.delegate = self;
    tmpTabView.hidden = !sender.selected;
    [self.view addSubview:tmpTabView];
//    if (sender.selected) {
//        tmpTabView.hidden = NO;
//    }else{
//        tmpTabView.hidden = YES;
//    }
    
}

- (void)selectrow:(NSInteger)row{
    [titleL setTitle:@"试试就试试" forState:UIControlStateNormal];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0 && openSection1) {//判断是否打开
        return 10;
    }else if (section == 1 && openSection2){
        return 8;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"这是第一组cell %ld",indexPath.row];
    }else if(indexPath.section == 1){
        cell.textLabel.text = [NSString stringWithFormat:@"这是第二组cell %ld",indexPath.row];
    }
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}

//==========================这下面就是给组头添加点击手势==============
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectZero];
    headerView.backgroundColor = [UIColor redColor];
    headerView.tag = 150+section;
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, Ws.width, 50)];
    label.text = [NSString stringWithFormat:@"这是组头%ld 点击试试看",section];
    [headerView addSubview:label];
    
    //创建手势
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(topRecognizer:)];
    [headerView addGestureRecognizer:tap];//手势添加在组头视图
    
    headerView.userInteractionEnabled = YES;//这个是一定要加  打开按钮所在View的用户交感
    
    return headerView;
}


- (void)topRecognizer:(UITapGestureRecognizer *)sender{
    long i = sender.view.tag - 150;
    if (i == 0) {
        openSection1 ^= 1;
    }else{
        openSection2 ^= 1;
    }
    
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:i];// 0 是第一个组头; 1 是第二个组头 以此类推
    [_myTabele reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];//刷新该组的数据并加上动画效果
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK: ==============

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    //是否让光标进入 编辑
    [self UIActionSheet];

    return NO;
}

- (void)UIActionSheet
{
    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"男",@"女", nil];
    [as showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    _textF.text = @"这是选择的文字";
}

@end
