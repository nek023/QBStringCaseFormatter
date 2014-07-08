//
//  QBStringCaseFormatter.h
//  QBStringCaseFormatterDemo
//
//  Created by Tanaka Katsuma on 2014/07/08.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QBStringCaseFormatter : NSObject

- (BOOL)isLowerCaseString:(NSString *)string;
- (BOOL)isUpperCaseString:(NSString *)string;

- (NSArray *)componentsFromCamelCaseString:(NSString *)camelCaseString;
- (NSArray *)componentsFromSnakeCaseString:(NSString *)snakeCaseString;

- (NSString *)camelCaseStringFromComponents:(NSArray *)components;
- (NSString *)snakeCaseStringFromComponents:(NSArray *)components;

- (NSString *)camelCaseStringFromSnakeCaseString:(NSString *)snakeCaseString;
- (NSString *)snakeCaseStringFromCamelCaseString:(NSString *)camelCaseString;

@end
