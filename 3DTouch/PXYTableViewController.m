//
//  PXYTableViewController.m
//  3DTouch_Demo
//
//  Created by 潘学洋 on 16/1/5.
//  Copyright © 2016年 hdf. All rights reserved.
//

#import "PXYTableViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface PXYTableViewController ()<UIViewControllerPreviewingDelegate>


@property (nonatomic, strong)NSArray *dataSource;
//判断设备是否支持3D Touch
@property (nonatomic, assign)BOOL isOpen3DTouch;

@end

@implementation PXYTableViewController


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self check3DTouch];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
 
    [self check3DTouch];
}

- (void)check3DTouch{
    //检测是否开始3D Touch
    if(self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable){
        
        self.isOpen3DTouch = YES;
    }

    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = @[@"文字",@"图片",@"测试",@"测试",@"测试"];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_id"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_id"];
    }
    //如果支持，注册cell
    if (self.isOpen3DTouch) {
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        FirstViewController *FVC = [[FirstViewController alloc]init];
        [self.navigationController pushViewController:FVC animated:YES];
    }
    if (indexPath.row == 1) {
        SecondViewController *SVC = [[SecondViewController alloc] init];
        [self.navigationController pushViewController:SVC animated:YES];
    }
    if (indexPath.row == 2) {
        ThirdViewController *tvc = [[ThirdViewController alloc] init];
        [self.navigationController pushViewController:tvc animated:YES];
    }

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

//peek代理方法：按压会弹出视图
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    
    //通过预览上下文获取到当前按压的视图,判断indexPath值
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)previewingContext.sourceView];
    
    //通过上下文可以调整不被虚化的范围
    previewingContext.sourceRect = CGRectMake(10, 10, 10, 10);
    
    if (indexPath.row == 0) {
        FirstViewController *FVC = [[FirstViewController alloc]init];
        //可以调整预览视图的大小
        FVC.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 200);
        return FVC;
    }
    if (indexPath.row == 1) {
        SecondViewController *SVC = [[SecondViewController alloc] init];
        return SVC;
    }
    if (indexPath.row == 2) {
        ThirdViewController *tvc = [[ThirdViewController alloc] init];
        return tvc;
    }
    return nil;
}

//pop代理方法：继续按压相当于push
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    
    [self showViewController:viewControllerToCommit sender:self];
    
}





@end
