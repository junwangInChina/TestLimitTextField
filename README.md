TestLimitTextField
==================

###用两种方式实现了 UITextField 输入内容长度的控制
####1：重写了 UITextField 类，利用通知，响应用户输入内容。 具体实现可以看代码，实现了
#####(1):中文联想时的不计算长度，用户选中后，对设置的长度进行分割。<br>(2):并且限制了复制粘贴造成总长度超过限制的问题。</br>
```
// 设置长度限制为5，不区分中英文
[self.firstTextField setLimit:5];
```
```
- (void)textFiledEditChanged:(NSNotification *)notification
{
    UITextField *textField = (UITextField *)notification.object;
    
    NSString *toBeString = textField.text;
    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"] || [lang isEqualToString:@"zh-Hant"])
    {
        // 简体中文输入，包括简体拼音，简体五笔，简体手写(zh-Hans)
        // 繁体中文输入，包括繁体拼音，繁体五笔，繁体手写(zh-Hant)
        UITextRange *selectedRange = [textField markedTextRange];
        // 获取高亮部分（联想部分）
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有联想，则对已输入的文字进行字数统计和限制
        if (!position)
        {
            if (toBeString.length > self.limit)
            {
                textField.text = [toBeString substringToIndex:self.limit];
            }
        }
        // 有联想，则暂不对联想的文字进行统计
        else
        {
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，暂时不考虑其他语种情况
    else
    {
        if (toBeString.length > self.limit)
        {
            textField.text = [toBeString substringToIndex:self.limit];
        }
    }
}

```
####2：使用 Category，扩展了长度限制的方法
#####这个方式在复制粘贴时，也可以控制长度不超过限制长度，但是在中文输入法时，会 crash，不建议使用，仅供参考。
```
// 设置长度限制为6，不区分中英文，但是中文环境会 crash
[self.thirdTextField limitTextLength:6];
```

```
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
```
