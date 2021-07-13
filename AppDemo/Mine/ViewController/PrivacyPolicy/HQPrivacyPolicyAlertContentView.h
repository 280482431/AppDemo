//
//  HQPrivacyPolicyAlertContentView.h
//  tiku
//
//  Created by lidebo on 2018/10/15.
//  Copyright © 2018 edu24ol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HQPrivacyPolicyAlertContentView : UIView

@property (nonatomic, copy) void(^agreeAlerViewBlock)(void);
@property (nonatomic, copy) void(^notAgreeAlerViewBlock)(void);

- (void)setAgreementWithTapBlock:(void (^)(NSString *))tapBlock;

@end
