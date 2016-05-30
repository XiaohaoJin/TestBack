//
//  TestBackController.m
//  TestBack
//
//  Created by 金晓浩 on 16/5/30.
//  Copyright © 2016年 XiaoHaoJin. All rights reserved.
//

#import "TestBackController.h"

@interface TestBackController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIButton *backButton;

@end

@implementation TestBackController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     自定义返回按钮导致系统的返回手势失效
      1、可以通过 navigationController.interactivePopGestureRecognizer.delegate 来实现
      2、也可以直接通过导入 FDFullscreenPopGesture 实现，其内部通过方法交换来实现，而且不用再去写代码，并且达到全屏返回手势的效果（系统方法只是侧边手势返回）
     */
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
    self.navigationItem.leftBarButtonItem = backItem;
}


//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    // 代理置空，否则会闪退
//    if ([self.navigationController       respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
//    }
//}
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    // 开启iOS7的滑动返回效果
//    if ([self.navigationController   respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        // 只有在二级页面生效
//        if ([self.navigationController.viewControllers count] == 2) {
//            self.navigationController.interactivePopGestureRecognizer.delegate = self;
//        }
//    }
//}


- (void)backButtonAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(0, 0, 22, 22);
        [_backButton setImage:[UIImage imageNamed:@"ic_navi_back"] forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"ic_navi_back"] forState:UIControlStateHighlighted];

        [_backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
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
