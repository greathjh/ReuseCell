//
//  ViewController.m
//  ReuseCellPro
//
//  Created by Fly on 2018/9/15.
//  Copyright © 2018年 air. All rights reserved.
//

#import "ViewController.h"
#import "NormalTableViewCell.h"
#import "NormalModel.h"
#import "SXArithmeticUnit.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView                *cumstomNavigation;
@property (nonatomic, strong) UITableView           *tableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.cumstomNavigation];
    [self.view addSubview:self.tableview];
    
    self.tableview.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view, typically from a nib.
}

// safeAreaInsets改变的时候回调用该方法
- (void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
}

//viewSafeAreaInsetsDidChange调用时机很早，在viewWillAppear后，这是为什么出现多余动画的原因。并且“pushVC”的safeAreaInsets直到viewSafeAreaInsetsDidChange调用前，都是UIEdgeInsetsZero，之后才是正确的UIEdgeInsets(top: 44.0, left: 0.0, bottom: 34.0, right: 0.0)
//并且viewSafeAreaInsetsDidChange后面会调用两次viewDidLayoutSubviews，所以我们应该把改变高度或布局的代码都写在viewDidLayoutSubviews里，这样就不会有多余的动画效果了。需要注意viewDidLayoutSubviews可能会由别的操作频繁触发，所以如果调整safeArea布局的代码比较耗时，可以考虑加上一个状态标记，只在didChange后执行一次布局调整
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    UIEdgeInsets safeAreaInsets = sgm_safeAreaInset(self.view);
    CGFloat navigationHeight = 44.0; // 导航栏原本的高度，通常是44.0
    CGFloat height = navigationHeight;
    height += (safeAreaInsets.top > 0) ? safeAreaInsets.top : 20.0; // 20.0是statusbar的高度，这里假设statusbar不消失
    
    if (_cumstomNavigation && _cumstomNavigation.frame.size.height != height) {
        _cumstomNavigation.frame = CGRectMake(0, safeAreaInsets.top, kSCREEN_WIDTH, navigationHeight);
        _tableview.frame = CGRectMake(0, height, kSCREEN_WIDTH, KSCREEN_HEIGHT - height - safeAreaInsets.bottom);
    }
}

static inline UIEdgeInsets sgm_safeAreaInset(UIView *view) {
    if (@available(iOS 11.0, *)) {
        return view.safeAreaInsets;
    }
    return UIEdgeInsetsZero;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --tableview delegate & datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NormalTableViewCell *cell = [NormalTableViewCell configNormalCell:tableView];
    NormalModel *model = [[NormalModel alloc] init];
    model.loveTitle = [NSString stringWithFormat:@"love%ld", indexPath.row];
    model.desTitle = @"这是爱心活动";
    cell.loveModel = model;
    
    return cell;
}

#pragma mark --lazy
- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc] init];
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}

- (UIView *)cumstomNavigation {
    if (!_cumstomNavigation) {
        _cumstomNavigation = [[UIView alloc] init];
        _cumstomNavigation.backgroundColor = [UIColor grayColor];
    }
    return _cumstomNavigation;
}

@end
