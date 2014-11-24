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

#import <UIKit/UIKit.h>

typedef void (^UIActionSheetActionBlcok)(UIActionSheet *actionSheet, NSInteger buttonIndex, NSDictionary *userInfo);

@interface UIActionSheet (Utils)

+ (void)showFromTabBar:(UITabBar *)tabBar
             withTitle:(NSString *)title
     cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
     otherButtonTitles:(NSArray *)otherButtonTitles
              userInfo:(NSDictionary *)userInfo
           actionBlock:(UIActionSheetActionBlcok)actionBlock;


+ (void)showFromToolbar:(UIToolbar *)toolbar
              withTitle:(NSString *)title
      cancelButtonTitle:(NSString *)cancelButtonTitle
 destructiveButtonTitle:(NSString *)destructiveButtonTitle
      otherButtonTitles:(NSArray *)otherButtonTitles
               userInfo:(NSDictionary *)userInfo
            actionBlock:(UIActionSheetActionBlcok)actionBlock;

+ (void)showInView:(UIView *)view
         withTitle:(NSString *)title
 cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
 otherButtonTitles:(NSArray *)otherButtonTitles
          userInfo:(NSDictionary *)userInfo
       actionBlock:(UIActionSheetActionBlcok)actionBlock;

+ (void)showFromBarButtonItem:(UIBarButtonItem *)barButtonItem
                     animated:(BOOL)animated
                    withTitle:(NSString *)title
            cancelButtonTitle:(NSString *)cancelButtonTitle
       destructiveButtonTitle:(NSString *)destructiveButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
                     userInfo:(NSDictionary *)userInfo
                  actionBlock:(UIActionSheetActionBlcok)actionBlock;

+ (void)showFromRect:(CGRect)rect
              inView:(UIView *)view
            animated:(BOOL)animated
           withTitle:(NSString *)title
   cancelButtonTitle:(NSString *)cancelButtonTitle
destructiveButtonTitle:(NSString *)destructiveButtonTitle
   otherButtonTitles:(NSArray *)otherButtonTitles
            userInfo:(NSDictionary *)userInfo
         actionBlock:(UIActionSheetActionBlcok)actionBlock;


@end
