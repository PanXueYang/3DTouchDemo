//
//  ThirdViewController.m
//  3DTouch_Demo
//
//  Created by 潘学洋 on 16/1/5.
//  Copyright © 2016年 hdf. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (nonatomic, strong)UIView *touchView;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.touchView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 320, 200)];
    self.touchView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.touchView];

}

-(void)viewWillAppear:(BOOL)animated{
    
    
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        [self registerForPreviewingWithDelegate:(id)self sourceView:self.touchView];
    }
    
}

//iOS9新多了两个属性：force maximumPossibleForce.可以验证最大值是20/3.
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    NSLog(@"%f",touch.force);
    
    if (touch.force == touch.maximumPossibleForce)
    {
        //20/3
        NSLog(@"%f-----------",touch.force);
    }
}





@end
