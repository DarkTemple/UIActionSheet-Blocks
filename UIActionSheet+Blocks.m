//
//
//  UIActionSheet+Blocks.h
//  UIActionSheetBlocks
//
//  Created by Haoquan Bai on 24/11/14.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2013 Haoquan Bai
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "UIActionSheet+Blocks.h"
#import <objc/runtime.h>

static NSString const * kUIActionSheetUserInfoKey = @"commonUI.UIActionSheet.UserInfo";
static NSString const * kUIActionSheetActionBlockKey = @"commonUI.UIActionSheet.Action";

#define NSArrayObjectMaybeNil(__ARRAY__, __INDEX__) ((__INDEX__ >= [__ARRAY__ count]) ? nil : [__ARRAY__ objectAtIndex:__INDEX__])
// This is a hack to turn an array into a variable argument list. There is no good way to expand arrays into variable argument lists in Objective-C. This works by nil-terminating the list as soon as we overstep the bounds of the array. The obvious glitch is that we only support a finite number of buttons.
#define NSArrayToVariableArgumentsList(__ARRAYNAME__) NSArrayObjectMaybeNil(__ARRAYNAME__, 0), NSArrayObjectMaybeNil(__ARRAYNAME__, 1), NSArrayObjectMaybeNil(__ARRAYNAME__, 2), NSArrayObjectMaybeNil(__ARRAYNAME__, 3), NSArrayObjectMaybeNil(__ARRAYNAME__, 4), NSArrayObjectMaybeNil(__ARRAYNAME__, 5), NSArrayObjectMaybeNil(__ARRAYNAME__, 6), NSArrayObjectMaybeNil(__ARRAYNAME__, 7), NSArrayObjectMaybeNil(__ARRAYNAME__, 8), NSArrayObjectMaybeNil(__ARRAYNAME__, 9), nil


@implementation UIActionSheet (Utils)

- (instancetype)initWithTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       destructiveButtonTitle:(NSString *)destructiveButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
                     userInfo:(NSDictionary *)userInfo
                  actionBlock:(UIActionSheetActionBlcok)actionBlock
{
    if (self = [self initWithTitle:title
                          delegate:nil
                 cancelButtonTitle:cancelButtonTitle
            destructiveButtonTitle:destructiveButtonTitle
                 otherButtonTitles:NSArrayToVariableArgumentsList(otherButtonTitles)]) {
        if (userInfo) {
            objc_setAssociatedObject(self, (__bridge const void *)kUIActionSheetUserInfoKey, userInfo, OBJC_ASSOCIATION_COPY_NONATOMIC);
        }
        
        if (actionBlock) {
            objc_setAssociatedObject(self, (__bridge const void *)kUIActionSheetActionBlockKey, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
            self.delegate = (id)self;
        } else {
            self.delegate = nil;
        }
    }
    
    return self;
}

+ (void)showFromTabBar:(UITabBar *)tabBar
             withTitle:(NSString *)title
     cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
     otherButtonTitles:(NSArray *)otherButtonTitles
              userInfo:(NSDictionary *)userInfo
           actionBlock:(UIActionSheetActionBlcok)actionBlock
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                    cancelButtonTitle:cancelButtonTitle
                                               destructiveButtonTitle:destructiveButtonTitle
                                                    otherButtonTitles:otherButtonTitles
                                                             userInfo:userInfo
                                                          actionBlock:actionBlock];
    [actionSheet showFromTabBar:tabBar];
}


+ (void)showFromToolbar:(UIToolbar *)toolbar
              withTitle:(NSString *)title
      cancelButtonTitle:(NSString *)cancelButtonTitle
 destructiveButtonTitle:(NSString *)destructiveButtonTitle
      otherButtonTitles:(NSArray *)otherButtonTitles
               userInfo:(NSDictionary *)userInfo
            actionBlock:(UIActionSheetActionBlcok)actionBlock
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                    cancelButtonTitle:cancelButtonTitle
                                               destructiveButtonTitle:destructiveButtonTitle
                                                    otherButtonTitles:otherButtonTitles
                                                             userInfo:userInfo
                                                          actionBlock:actionBlock];
    [actionSheet showFromToolbar:toolbar];
}

+ (void)showInView:(UIView *)view
         withTitle:(NSString *)title
 cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
 otherButtonTitles:(NSArray *)otherButtonTitles
          userInfo:(NSDictionary *)userInfo
       actionBlock:(UIActionSheetActionBlcok)actionBlock
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                    cancelButtonTitle:cancelButtonTitle
                                               destructiveButtonTitle:destructiveButtonTitle
                                                    otherButtonTitles:otherButtonTitles
                                                             userInfo:userInfo
                                                          actionBlock:actionBlock];
    [actionSheet showInView:view];
}

+ (void)showFromBarButtonItem:(UIBarButtonItem *)barButtonItem
                     animated:(BOOL)animated
                    withTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       destructiveButtonTitle:(NSString *)destructiveButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
                     userInfo:(NSDictionary *)userInfo
                  actionBlock:(UIActionSheetActionBlcok)actionBlock
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                    cancelButtonTitle:cancelButtonTitle
                                               destructiveButtonTitle:destructiveButtonTitle
                                                    otherButtonTitles:otherButtonTitles
                                                             userInfo:userInfo
                                                          actionBlock:actionBlock];
    [actionSheet showFromBarButtonItem:barButtonItem animated:animated];
}

+ (void)showFromRect:(CGRect)rect
              inView:(UIView *)view
            animated:(BOOL)animated
           withTitle:(NSString *)title
   cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
   otherButtonTitles:(NSArray *)otherButtonTitles
            userInfo:(NSDictionary *)userInfo
         actionBlock:(UIActionSheetActionBlcok)actionBlock
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                    cancelButtonTitle:cancelButtonTitle
                                               destructiveButtonTitle:destructiveButtonTitle
                                                    otherButtonTitles:otherButtonTitles
                                                             userInfo:userInfo
                                                          actionBlock:actionBlock];
    [actionSheet showFromRect:rect inView:view animated:animated];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    UIActionSheetActionBlcok actionBlock = objc_getAssociatedObject(self, (__bridge const void *)(kUIActionSheetActionBlockKey));
    if (actionBlock) {
        NSDictionary *userInfo = objc_getAssociatedObject(self, (__bridge const void *)(kUIActionSheetUserInfoKey));
        actionBlock(self, buttonIndex, userInfo);
    }
    
    // make the actionSheet release automatically
    objc_setAssociatedObject(self, (__bridge const void *)(kUIActionSheetActionBlockKey), nil, OBJC_ASSOCIATION_COPY);
    objc_setAssociatedObject(self, (__bridge const void *)(kUIActionSheetUserInfoKey), nil, OBJC_ASSOCIATION_COPY);
}

@end
