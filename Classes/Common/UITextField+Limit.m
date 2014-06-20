//
//  UITextField+Limit.m
//  TestLimitTextField
//
//  Created by wangjun on 14-2-28.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "UITextField+Limit.h"
#import <objc/runtime.h>

static NSString *kLimitTextLengthKey = @"kLimitTextLengthKey";

@implementation UITextField (Limit)

- (void)limitTextLength:(NSInteger)length
{
    objc_setAssociatedObject(self, (const void *)(kLimitTextLengthKey), [NSNumber numberWithInteger:length], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addTarget:self
             action:@selector(textFieldTextLengthLimit:)
   forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldTextLengthLimit:(id)sender
{
    NSNumber *lengthNumber = objc_getAssociatedObject(self, (const void *)(kLimitTextLengthKey));
    
    int length = [lengthNumber intValue];
    
    if(self.text.length > length)
    {
        self.text = [self.text substringToIndex:length];
    }
}

@end
