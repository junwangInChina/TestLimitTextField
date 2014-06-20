//
//  LimitTextField.h
//  TestLimitTextField
//
//  Created by wangjun on 14-2-28.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LimitTextField : UITextField
{
    NSInteger _limit;
}

@property (nonatomic, assign) NSInteger limit;

@end
