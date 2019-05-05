//
//  NSObject+SafeParse.h
//  ZASafeObject
//
//  Created by 纵昂 on 2019/5/5.
//  Copyright © 2019 纵昂. All rights reserved.
//

#import <Foundation/Foundation.h>
//从字典中取出数组
#define JBSafeArray(dictionary,key)   [dictionary safeArrayForKey:key]
//从字典中取出字典
#define JBSafeDic(dictionary,key)   [dictionary safeDictionaryForKey:key]
//从字典中取出字符串
#define JBSafeString(dictionary,key)   [dictionary safeStringForKey:key]
//从字典中取出int值
#define JBSafeInt(dictionary,key)   [dictionary safeIntegerForKey:key]

//根据索引从数组取值
#define JBSafeArrayIndex(array,index)   [array safeArrayWithIndex:index]
#define JBSafeDicIndex(array,index)   [array safeDictionaryWithIndex:index]

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SafeParse)

#pragma mark -本类为字典类型
/**
 取出字典
 @param key @"data" 或者 @"data|data|result"
 @return 返回字典对象
 */
- (NSDictionary*)safeDictionaryForKey:(NSString*)key;

/**
 取出数组
 @param key @"data" 或者 @"data|data|result"
 @return 返回数组对象
 */
- (NSArray*)safeArrayForKey:(NSString*)key;

/**
 取出字符串
 @param key @"data" 或者 @"data|data|result"
 @return 返回字符串对象
 */
- (NSString*)safeStringForKey:(NSString*)key;

/**
 取出int值
 @param key @"data" 或者 @"data|data|result"
 @return 返回int值
 */
- (NSInteger)safeIntegerForKey:(NSString*)key;

#pragma mark -本类为数组类型
//根据索引取出数组
- (NSArray*)safeArrayWithIndex:(NSInteger)index;
//根据索引取出字典
- (NSDictionary*)safeDictionaryWithIndex:(NSInteger)index;


@end

NS_ASSUME_NONNULL_END
