//
//  ZRObject+Category.m
//  Runtime
//
//  Created by 刘峥嵘 on 2018/6/20.
//  Copyright © 2018年 刘峥嵘. All rights reserved.
//

#import "ZRObject+Category.h"
#import <objc/runtime.h>
@implementation ZRObject (Category)

-(void)setCategoryProperty:(NSString *)categoryProperty
{

    objc_setAssociatedObject(self, @selector(categoryProperty), categoryProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)categoryProperty
{
    return objc_getAssociatedObject(self, _cmd);
}
@end
