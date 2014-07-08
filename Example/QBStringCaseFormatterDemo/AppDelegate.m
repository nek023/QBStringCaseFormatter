//
//  AppDelegate.m
//  QBStringCaseFormatterDemo
//
//  Created by Tanaka Katsuma on 2014/07/08.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "AppDelegate.h"

#import "QBStringCaseFormatter.h"

@interface AppDelegate ()
            
@property (weak) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTextField *resultLabel;

@property (nonatomic, strong) QBStringCaseFormatter *formatter;

@end

@implementation AppDelegate
            
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.formatter = [QBStringCaseFormatter new];
}


#pragma mark - Actions

- (IBAction)convertSnakeCaseToCamelCase:(id)sender
{
    self.resultLabel.stringValue = [NSString stringWithFormat:@"Result: %@", [self.formatter camelCaseStringFromSnakeCaseString:self.textField.stringValue]];
}

- (IBAction)convertCamelCaseToSnakeCase:(id)sende
{
    self.resultLabel.stringValue = [NSString stringWithFormat:@"Result: %@", [self.formatter snakeCaseStringFromCamelCaseString:self.textField.stringValue]];
}

@end
