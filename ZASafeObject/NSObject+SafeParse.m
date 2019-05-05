//
//  NSObject+SafeParse.m
//  ZASafeObject
//
//  Created by 纵昂 on 2019/5/5.
//  Copyright © 2019 纵昂. All rights reserved.
//

#import "NSObject+SafeParse.h"

@implementation NSObject (SafeParse)
//取出字典
- (NSDictionary*)safeDictionaryForKey:(NSString*)key {
    if (![self isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    key = [self trimWhiteSpaceAndNewLineForString:key];
    id  innerDic = (NSDictionary*)self;
    NSArray *keys = [key componentsSeparatedByString:@"|"];
    int level = 0;
    while (level<keys.count)
    {
        id tempInner = innerDic[keys[level]];
        if (level!=keys.count-1&&![tempInner isKindOfClass:[NSDictionary class]])
        {
            innerDic = nil;
            break;
        }
        innerDic = tempInner;
        if (innerDic == nil || innerDic == [NSNull null]||![innerDic isKindOfClass:[NSDictionary class]])
        {
            innerDic = nil;
            break;
        }
        level ++;
    }
    return innerDic;
}
//取出数组
- (NSArray*)safeArrayForKey:(NSString*)key
{
    if (![self isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    key = [self trimWhiteSpaceAndNewLineForString:key];
    id  inner  = (NSDictionary*)self;
    NSArray *keys = [key componentsSeparatedByString:@"|"];
    int level = 0;
    while (level<keys.count)
    {
        id tempInner = inner[keys[level]];
        if (level!=keys.count-1&&![tempInner isKindOfClass:[NSDictionary class]])
        {
            inner = nil;
            break;
        }
        inner = tempInner;
        if (inner == nil || inner == [NSNull null])
        {
            inner = nil;
            break;
        }
        if (level==keys.count-1&&![inner isKindOfClass:[NSArray class]])
        {
            inner = nil;
            break;
        }
        level ++;
    }
    return inner;
}
//取出字符串
- (NSString*)safeStringForKey:(NSString*)key
{
    if (![self isKindOfClass:[NSDictionary class]]) {
        return @"";
    }
    
    key = [self trimWhiteSpaceAndNewLineForString:key];
    id  inner = (NSDictionary*)self;
    NSArray *keys = [key componentsSeparatedByString:@"|"];
    int level = 0;
    while (level<keys.count)
    {
        id tempInner = inner[keys[level]];
        if (level!=keys.count-1&&![tempInner isKindOfClass:[NSDictionary class]])
        {
            inner = @"";
            break;
        }
        
        inner = tempInner;
        if (inner == nil || inner == [NSNull null])
        {
            inner = @"";
            break;
        }
        if (level==keys.count-1&&![inner isKindOfClass:[NSString class]])
        {
            inner = @"";
            break;
        }
        level ++;
    }
    return inner;
}
//取出int值
- (NSInteger)safeIntegerForKey:(NSString*)key
{
    if (![self isKindOfClass:[NSDictionary class]]) {
        return -404;
    }
    
    key = [self trimWhiteSpaceAndNewLineForString:key];
    id  inner  = (NSDictionary*)self;
    NSArray *keys = [key componentsSeparatedByString:@"|"];
    int level = 0;
    while (level<keys.count)
    {
        id tempInner = inner[keys[level]];
        if (level!=keys.count-1&&![tempInner isKindOfClass:[NSDictionary class]])
        {
            inner = @(-404);
            break;
        }
        inner = tempInner;
        if (inner == nil || inner == [NSNull null])
        {
            inner = @(-404);
            break;
        }
        level ++;
    }
    return [inner integerValue];
}

- (NSArray*)safeArrayWithIndex:(NSInteger)index
{
    id value = [self objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]])
    {
        return value;
    }
    return nil;
}

- (NSDictionary*)safeDictionaryWithIndex:(NSInteger)index
{
    id value = [self objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]])
    {
        return value;
    }
    return nil;
}

-(id)objectWithIndex:(NSUInteger)index{
    
    if (![self isKindOfClass:[NSArray class]]) {
        return nil;
    }
    NSArray *array = (NSArray*)self;
    if (index <array.count) {
        return array[index];
    }else{
        return nil;
    }
}
//去除字符串的空格和换行符
- (NSString *)trimWhiteSpaceAndNewLineForString:(NSString*)str
{
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
@end
