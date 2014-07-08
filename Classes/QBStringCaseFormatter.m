//
//  QBStringCaseFormatter.m
//  QBStringCaseFormatterDemo
//
//  Created by Tanaka Katsuma on 2014/07/08.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "QBStringCaseFormatter.h"

@implementation QBStringCaseFormatter

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        // Initialization
    }
    
    return self;
}


#pragma mark - Detect String Case

- (BOOL)isLowerCaseString:(NSString *)string
{
    return islower([string characterAtIndex:0]);
}

- (BOOL)isUpperCaseString:(NSString *)string
{
    return isupper([string characterAtIndex:0]);
}


#pragma mark - Making Components from String

- (NSArray *)componentsFromCamelCaseString:(NSString *)camelCaseString
{
    NSMutableArray *components = [NSMutableArray array];
    
    NSScanner *scanner = [NSScanner scannerWithString:camelCaseString];
    NSMutableString *string = [NSMutableString string];
    
    while (![scanner isAtEnd]) {
        NSString *scannedString = nil;
        [scanner scanUpToCharactersFromSet:[NSCharacterSet uppercaseLetterCharacterSet] intoString:&scannedString];
        
        if (scannedString.length > 0) {
            [string appendString:scannedString];
            [components addObject:[string copy]];
            [string deleteCharactersInRange:NSMakeRange(0, string.length)];
        }
        
        // Scan uppercase strings
        scannedString = nil;
        [scanner scanCharactersFromSet:[NSCharacterSet uppercaseLetterCharacterSet] intoString:&scannedString];
        
        // Check the multiple uppercase string
        if (scannedString.length > 0) {
            if (scannedString.length > 1) {
                [components addObject:[scannedString substringToIndex:(scannedString.length - 1)]];
                scannedString = [scannedString substringFromIndex:(scannedString.length - 1)];
            }
            
            [string appendString:scannedString];
        }
    }
    
    return [components copy];
}

- (NSArray *)componentsFromSnakeCaseString:(NSString *)snakeCaseString
{
    return [snakeCaseString componentsSeparatedByString:@"_"];
}


#pragma mark - Making String from Components

- (NSString *)camelCaseStringFromComponents:(NSArray *)components
{
    NSMutableString *string = [NSMutableString string];
    
    for (NSString *component in components) {
        if (component.length > 0) {
            [string appendString:[[component substringToIndex:1] uppercaseString]];
            [string appendString:[[component substringFromIndex:1] lowercaseString]];
        }
    }
    
    return [string copy];
}

- (NSString *)snakeCaseStringFromComponents:(NSArray *)components
{
    return [[components componentsJoinedByString:@"_"] lowercaseString];
}


#pragma mark - Convering String

- (NSString *)camelCaseStringFromSnakeCaseString:(NSString *)snakeCaseString
{
    return [self camelCaseStringFromComponents:[self componentsFromSnakeCaseString:snakeCaseString]];
}

- (NSString *)snakeCaseStringFromCamelCaseString:(NSString *)camelCaseString
{
    return [self snakeCaseStringFromComponents:[self componentsFromCamelCaseString:camelCaseString]];
}

@end
