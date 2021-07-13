//
//  HQPrivacyPolicyAlertViewController.h
//  tiku
//
//  Created by lidebo on 2018/10/15.
//  Copyright © 2018 edu24ol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HQPrivacyPolicyAlertViewController : UIViewController
/** void */
@property (nonatomic, copy) void(^dismissBlock)(BOOL dismiss);
//判断用户是否已经同意过了隐私协议
+ (BOOL)isUserAlreadyAcceptedPrivacyPolicy;
//弹出用户隐私政策提示框
+ (void)presentPrivacyPolicyAlertViewFromViewController:(UIViewController *)viewContoller dismissBlock:(void(^)(BOOL agree))block;
@end
