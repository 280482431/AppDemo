//
//  HQPrivacyPolicyAlertViewController.m
//  tiku
//
//  Created by lidebo on 2018/10/15.
//  Copyright © 2018 edu24ol. All rights reserved.
//

#import "HQPrivacyPolicyAlertViewController.h"
#import <zhPopupController/zhPopupController.h>
#import "HQPrivacyPolicyAlertContentView.h"
#import "UIViewController+PresentAlert.h"
#import "HQActivateQBoxViewController.h"
#import <AppTrackingTransparency/AppTrackingTransparency.h>

@interface HQPrivacyPolicyAlertViewController ()

@end

@implementation HQPrivacyPolicyAlertViewController

+ (void)presentPrivacyPolicyAlertViewFromViewController:(UIViewController *)viewContoller dismissBlock:(void(^)(BOOL agree))block
{
    
    if ([[self class] isUserAlreadyAcceptedPrivacyPolicy]) {
        return;
    }
    
    HQPrivacyPolicyAlertViewController *alertVC = [[HQPrivacyPolicyAlertViewController alloc] init];
    alertVC.dismissBlock = block;
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:alertVC];
    navi.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [viewContoller presentViewController:navi animated:NO completion:nil];
}

+ (BOOL)isUserAlreadyAcceptedPrivacyPolicy
{
    BOOL isAccepted = [[NSUserDefaults standardUserDefaults] boolForKey:@"isUserAlreadyAcceptedPrivacyPolicyKey"];
    if (isAccepted) {
        return YES;
    } else {
        return NO;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"隐私政策";
    
    self.navigationController.delegate = [HQAPPStyle shareStyle];
    
    
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self show];
            });
        }];
    } else {
        
        [self show];
    }
}

- (void)show
{
    HQPrivacyPolicyAlertContentView *view = [[NSBundle mainBundle] loadNibNamed:@"HQPrivacyPolicyAlertContentView" owner:self options:nil].firstObject;
    view.layer.cornerRadius = 10.0;
    view.layer.masksToBounds = YES;
    view.frame = CGRectMake(0, 0, 280, 370);
    
    @weakify(self);
    view.agreeAlerViewBlock = ^{
        @strongify(self);
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isUserAlreadyAcceptedPrivacyPolicyKey"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.zh_popupController dismiss];

    };
    view.notAgreeAlerViewBlock = ^{
       @strongify(self);
        [self hq_presentAlertWithTitle:@"注意" cancelTitle:nil cancelHandler:nil confirmTitle:@"我知道了" confirmHandler:nil message:@"您需要同意《用户服务协议及隐私政策》方可使用本软件"];
    };

    [view setAgreementWithTapBlock:^(NSString *tapStr) {
        @strongify(self);
        NSString *url = [tapStr containsString:@"隐私政策"] ? kPolicyUrl : UserLegalNoticeUrl;
        NSString *title = [tapStr containsString:@"隐私政策"] ? @"隐私政策" : @"用户协议";
        
        HQActivateQBoxViewController *vc = [[HQActivateQBoxViewController alloc] initWithBuyLinkUrl:[NSURL URLWithString:url]];
        vc.title = title;
        [self.navigationController pushViewController:vc animated:true];
    }];
    
    self.zh_popupController = [zhPopupController popupControllerWithMaskType:zhPopupMaskTypeBlackTranslucent];
    self.zh_popupController.slideStyle = zhPopupSlideStyleShrinkInOut1;
    self.zh_popupController.allowPan = NO;
    self.zh_popupController.dismissOnMaskTouched = NO;
    
    self.zh_popupController.didDismiss = ^(zhPopupController * _Nonnull popupController) {
        @strongify(self);
        [self.navigationController dismissViewControllerAnimated:NO completion:^{
            if (self.dismissBlock) {
                self.dismissBlock(YES);
            }
        }];
    };
    
    
    [self.zh_popupController presentContentView:view duration:0.5 springAnimated:YES inView:self.view];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.translucent = false;
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
//
//    [self setJz_wantsNavigationBarVisible:NO];
//    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    [self setNeedsStatusBarAppearanceUpdate];
//    [self.navigationController jz_setNavigationBarBackgroundHidden:false];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
