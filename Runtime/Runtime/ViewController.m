//
//  ViewController.m
//  Runtime
//
//  Created by 刘峥嵘 on 2018/6/20.
//  Copyright © 2018年 刘峥嵘. All rights reserved.
//

#import "ViewController.h"
#import "ZRObject.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
// 获取类
    Class zr = object_getClass([[ZRObject alloc] init]);
    SEL oriSel = @selector(resolveThisMethodDynamically);
    //获取类方法
    Method oriMethod = class_getClassMethod([self class],oriSel);
    //获取实例方法
    Method objMethod = class_getInstanceMethod([self class], oriSel);
    
    //添加方法
//    BOOL isSuccess =class_addMethod([self class], @selector(goodMorning), <#IMP  _Nonnull imp#>, <#const char * _Nullable types#>)
    
    ZRObject *p = [[ZRObject alloc]init];
    IMP dd = class_getMethodImplementation([ViewController class], @selector(find:));
    dd();
//    IMP dd = [self methodForSelector:@selector(find)];
//    class_addMethod([ZRObject class], @selector(printPerson),dd , "v@:");
//
//    [p perform Selector:@selector(printPerson)];



}

-(void)find:(NSString*)str
{
    NSLog(@"你好，%@；",str);
}



-(void)daiti
{
    NSLog(@"这是一个代替");
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
