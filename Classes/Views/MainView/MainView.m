//
//  MainView.m
//  TestLimitTextField
//
//  Created by wangjun on 14-2-28.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "MainView.h"
#import "LimitTextField.h"
#import "UITextField+Limit.h"

@interface MainView()
{
    LimitTextField *m_firstTextField;
    LimitTextField *m_secondTextField;
    UITextField *m_thirdTextField;
}

@property (nonatomic, retain) LimitTextField *firstTextField;
@property (nonatomic, retain) LimitTextField *secondTextField;
@property (nonatomic, retain) UITextField *thirdTextField;

@end

@implementation MainView
@synthesize firstTextField = m_firstTextField;
@synthesize secondTextField = m_secondTextField;
@synthesize thirdTextField = m_thirdTextField;

- (void)dealloc
{
    RELEASE_SAFETY(m_firstTextField);
    RELEASE_SAFETY(m_secondTextField);
    RELEASE_SAFETY(m_thirdTextField);
    
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.firstTextField = [self createLimitTextFieldWithFrame:CGRectMake(60, 20, 200, 40)
                                                           andTag:10010];
        [self.firstTextField setLimit:5];
        
        self.secondTextField = [self createLimitTextFieldWithFrame:CGRectMake(60, 80, 200, 40)
                                                            andTag:10011];
        [self.secondTextField setLimit:15];
        
        self.thirdTextField = [self createTextFieldWithFrame:CGRectMake(60, 140, 200, 40)
                                                      andTag:10012];
        [self.thirdTextField limitTextLength:6];
        
    }
    return self;
}

- (LimitTextField *)createLimitTextFieldWithFrame:(CGRect)frame andTag:(NSInteger)tag
{
    LimitTextField *textField_ = [[LimitTextField alloc] initWithFrame:frame];
    textField_.borderStyle = UITextBorderStyleRoundedRect;
    textField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField_.tag = tag;
    [self addSubview:textField_];
    
    return [textField_ autorelease];
}

- (UITextField *)createTextFieldWithFrame:(CGRect)frame andTag:(NSInteger)tag
{
    UITextField *textField_ = [[UITextField alloc] initWithFrame:frame];
    textField_.borderStyle = UITextBorderStyleRoundedRect;
    textField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField_.tag = tag;
    [self addSubview:textField_];
    
    return [textField_ autorelease];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self hiddenKeyBoard];
}

- (void)hiddenKeyBoard
{
    [self.firstTextField resignFirstResponder];
    [self.secondTextField resignFirstResponder];
    [self.thirdTextField resignFirstResponder];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
