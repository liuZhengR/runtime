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
    Class className = object_getClass([[ZRObject alloc] init]);
//    SEL oriSel = @selector(resolveThisMethodDynamically);
    //获取类方法
    Method classMethod = class_getClassMethod([self class],@selector(classMethodImplementation));
    //获取实例方法
    Method objFirstMethod = class_getInstanceMethod([self class], @selector(instancesFirstMethodImplementation));
    
    Method objSecondMethod = class_getInstanceMethod([self class], @selector(instancesSceondMethodImplementation));
    
    //添加方法
    
    IMP first = class_getMethodImplementation([self class], @selector(addThisMethod));
    IMP second = [self methodForSelector:@selector(addThisMethod)];

    // 调用addThisMethod 可以直接通过IMP 指针调用 first();
    /*
    types参数为"i@:@“，按顺序分别表示：
     
     i：返回值类型int，若是v则表示void
     
     @：参数id(self)
     
     :：SEL(_cmd)
     
     @：id(str)
     */
    
    class_addMethod([ZRObject class], @selector(reallyAddName),first, "v@:");
    ZRObject * object = [[ZRObject alloc] init];
    [object performSelector:@selector(reallyAddName)];

    //方法交换
    method_exchangeImplementations(objFirstMethod,objSecondMethod);

}

//类方法
+(void)classMethodImplementation
{
    
}
-(void)instancesFirstMethodImplementation
{
    NSLog(@"我是第一个方法");
}

-(void)instancesSceondMethodImplementation
{
    NSLog(@"我是第二个方法");
}

-(void)addThisMethod
{
    NSLog(@"我是将要添加的方法");
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self instancesFirstMethodImplementation];
}

@end
