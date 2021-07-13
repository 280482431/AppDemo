//
//  HQPrivacyPolicyAlertContentView.m
//  tiku
//
//  Created by lidebo on 2018/10/15.
//  Copyright © 2018 edu24ol. All rights reserved.
//

#import "HQPrivacyPolicyAlertContentView.h"
#import "NSString+Validate.h"
#import <YYText.h>

@interface HQPrivacyPolicyAlertContentView()

@property (nonatomic, weak) IBOutlet UIButton *agreeButton;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) YYLabel *contentLabel;

@end

@implementation HQPrivacyPolicyAlertContentView

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self.agreeButton setTitleColor:[UIColor hq_colorWithHexString:KAPPNavBackgroundColor] forState:UIControlStateNormal];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 20, 15)];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.scrollEnabled = YES;
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(50, 0, 45, 0));
    }];
    
    self.contentLabel = [[YYLabel alloc] initWithFrame:CGRectMake(15, 0, 250, 15)];
    self.contentLabel.numberOfLines = 0;
    [_scrollView addSubview:self.contentLabel];
}

- (void)setAgreementWithTapBlock:(void (^)(NSString *))tapBlock
{
    NSString *appName = @"环球网校";
#if tikuForMBA | tikuForZiXue | tikuForAdultUniversity
    appName = @"环球青藤";
#endif
    NSString *detailStr = [NSString stringWithFormat:@"亲爱的用户，在您使用%@产品或服务前，请您务必认真阅读《用户服务协议》和《隐私政策》中各项条款，了解我们对您个人信息的处理规则。同时您应特别注意前述协议中免除或者限制我们责任的条款、对您权力进行限制的条款、约定争议解决方式和司法管辖的条款。\n\n如您已详细阅读并同意《用户服务协议》和《隐私政策》，请点击同意开始使用我们的产品和服务。",appName];
    NSString *policyStr = @"《隐私政策》";
    NSString *userStr = @"《用户服务协议》";
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:detailStr attributes:@{NSFontAttributeName : HQ_Font_Regular(14), NSForegroundColorAttributeName : HexRGB(0x000000)}];
    
    @weakify(self);
    NSArray *policyRanges = [detailStr hq_getMacthStringRangeArray:policyStr];
    [policyRanges enumerateObjectsUsingBlock:^(NSValue *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSRange range = [obj rangeValue];
        @strongify(self);
        [self setAttribute:attrString range:range tapBlock:tapBlock];
    }];
    
    NSArray *userRanges = [detailStr hq_getMacthStringRangeArray:userStr];
    [userRanges enumerateObjectsUsingBlock:^(NSValue *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSRange range = [obj rangeValue];
        @strongify(self);
        [self setAttribute:attrString range:range tapBlock:tapBlock];
    }];
    
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:CGSizeMake(250, MAXFLOAT) text:attrString];
    CGFloat height = layout.textBoundingSize.height;
    CGRect frame = self.contentLabel.frame;
    frame.size.height = height;
    self.contentLabel.frame = frame;
    self.contentLabel.attributedText = attrString;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, height + 20);
}

- (void)setAttribute:(NSMutableAttributedString *)attrString range:(NSRange)range tapBlock:(void (^)(NSString *tapStr))tapBlock
{
    //下划线
    [attrString addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:range];
    //下划线颜色
    [attrString addAttribute:NSUnderlineColorAttributeName value:[UIColor hq_colorWithHexString:KAPPNavBackgroundColor] range:range];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor hq_colorWithHexString:KAPPNavBackgroundColor] range:range];
    
    [attrString yy_setTextHighlightRange:range color:nil backgroundColor:nil tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSString *tapStr = [text.string substringWithRange:range];
        DDLogDebug(@"点击链接字符串: %@", tapStr);
        if (tapBlock) {
            tapBlock(tapStr);
        }
    }];
}

- (IBAction)agreeButtonAction:(id)sender
{
    if (self.agreeAlerViewBlock) {
        self.agreeAlerViewBlock();
    }
}

- (IBAction)notAgreeButtonAction:(id)sender
{
    if (self.notAgreeAlerViewBlock) {
        self.notAgreeAlerViewBlock();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
