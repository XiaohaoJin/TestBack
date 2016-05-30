# TestBack
自定义返回按钮导致系统的返回手势失效       1、可以通过 navigationController.interactivePopGestureRecognizer.delegate 来实现       2、也可以直接通过导入 FDFullscreenPopGesture 实现，其内部通过方法交换来实现，而且不用再去写代码，并且达到全屏返回手势的效果（系统方法只是侧边手势返回）
