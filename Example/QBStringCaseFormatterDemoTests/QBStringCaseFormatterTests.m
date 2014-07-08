//
//  QBStringCaseFormatterTests.m
//  QBStringCaseFormatterDemo
//
//  Created by Tanaka Katsuma on 2014/07/08.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "QBStringCaseFormatter.h"

@interface QBStringCaseFormatterTests : XCTestCase

@property (nonatomic, strong) QBStringCaseFormatter *formatter;

@end

@implementation QBStringCaseFormatterTests

- (void)setUp
{
    [super setUp];
    
    self.formatter = [QBStringCaseFormatter new];
}

- (void)testCaseDetection
{
    XCTAssertTrue([self.formatter isLowerCaseString:@"a"]);
    XCTAssertFalse([self.formatter isLowerCaseString:@"A"]);
    
    XCTAssertTrue([self.formatter isUpperCaseString:@"A"]);
    XCTAssertFalse([self.formatter isUpperCaseString:@"a"]);
}

- (void)testCamelCaseComponentSeparation
{
    NSArray *estimated;
    
    estimated = @[];
    XCTAssertTrue([[self.formatter componentsFromCamelCaseString:@""] isEqualToArray:estimated]);
    
    estimated = @[@"Foo"];
    XCTAssertTrue([[self.formatter componentsFromCamelCaseString:@"Foo"] isEqualToArray:estimated]);
    
    estimated = @[@"Foo", @"Bar"];
    XCTAssertTrue([[self.formatter componentsFromCamelCaseString:@"FooBar"] isEqualToArray:estimated]);
}

- (void)testSnakeCaseComponentSeparation
{
    NSArray *estimated;
    
    estimated = @[@""];
    XCTAssertTrue([[self.formatter componentsFromSnakeCaseString:@""] isEqualToArray:estimated]);
    
    estimated = @[@"foo"];
    XCTAssertTrue([[self.formatter componentsFromSnakeCaseString:@"foo"] isEqualToArray:estimated]);
    
    estimated = @[@"foo", @"bar"];
    XCTAssertTrue([[self.formatter componentsFromSnakeCaseString:@"foo_bar"] isEqualToArray:estimated]);
    
    estimated = @[@"foo", @"bar", @"baz"];
    XCTAssertTrue([[self.formatter componentsFromSnakeCaseString:@"foo_bar_baz"] isEqualToArray:estimated]);
    
    estimated = @[@"", @"foo", @""];
    XCTAssertTrue([[self.formatter componentsFromSnakeCaseString:@"_foo_"] isEqualToArray:estimated]);
    
    estimated = @[@"", @"foo", @"bar", @""];
    XCTAssertTrue([[self.formatter componentsFromSnakeCaseString:@"_foo_bar_"] isEqualToArray:estimated]);
    
    estimated = @[@"foo", @"", @"bar"];
    XCTAssertTrue([[self.formatter componentsFromSnakeCaseString:@"foo__bar"] isEqualToArray:estimated]);
    
    estimated = @[@"", @"foo", @"", @"bar", @""];
    XCTAssertTrue([[self.formatter componentsFromSnakeCaseString:@"_foo__bar_"] isEqualToArray:estimated]);
}

- (void)testCamelCaseJoining
{
    NSArray *components;
    
    components = @[@"foo"];
    XCTAssertTrue([[self.formatter camelCaseStringFromComponents:components] isEqualToString:@"Foo"]);
    
    components = @[@"foo", @"bar"];
    XCTAssertTrue([[self.formatter camelCaseStringFromComponents:components] isEqualToString:@"FooBar"]);
    
    components = @[@"FOO", @"Bar"];
    XCTAssertTrue([[self.formatter camelCaseStringFromComponents:components] isEqualToString:@"FooBar"]);
}

- (void)testSnakeCaseJoining
{
    NSArray *components;
    
    components = @[@"Foo"];
    XCTAssertTrue([[self.formatter snakeCaseStringFromComponents:components] isEqualToString:@"foo"]);
    
    components = @[@"Foo", @"Bar"];
    XCTAssertTrue([[self.formatter snakeCaseStringFromComponents:components] isEqualToString:@"foo_bar"]);
    
    components = @[@"FOO", @"bar"];
    XCTAssertTrue([[self.formatter snakeCaseStringFromComponents:components] isEqualToString:@"foo_bar"]);
}

@end
