//
//  HQFeedBackViewController.m
//  architecture
//
//  Created by lvfeijun on 2021/7/9.
//

#import "HQFeedBackViewController.h"
#import <UIView+Architecture.h>

@interface HQFeedBackViewController ()

@property (nonatomic,strong) UILabel *typeLb;
@property (nonatomic,strong) YYTextView *textView;
@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) UILabel *countLb;

@end

@implementation HQFeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"问题反馈";
    self.view.backgroundColor = UIColor.whiteColor;
    [self initViews];
}

-(void)initViews{
    UILabel *typeLb = [self createLable];
    typeLb.text = @"问题类型（必填）";
    [typeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(20);
    }];
    
    UIView *typeBackV = UIView.new;
    [self.view addSubview:typeBackV];
    [typeBackV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(typeLb);
        make.top.mas_equalTo(typeLb.mas_bottom).offset(15);
        make.height.mas_equalTo(44);
    }];
    typeBackV.backgroundColor = [UIColor hq_arcolorWithHexString:@"#F6F6F6"];
    typeBackV.layer.cornerRadius = 5;
    typeBackV.layer.masksToBounds = YES;
    [typeBackV hq_araddtouchAction:^(id  _Nonnull view) {
        [self selectType];
    }];
    
    _typeLb = UILabel.new;
    [typeBackV addSubview:_typeLb];
    [_typeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(typeBackV).offset(14);
        make.centerY.mas_equalTo(typeBackV);
    }];
    _typeLb.text = @"请选择问题类型";
    _typeLb.font = HQ_Font_Medium(14);
    _typeLb.textColor = UIColor.themeColor;
    _typeLb.backgroundColor = UIColor.clearColor;
//    [_typeBt setTitleColor:UIColor.themeColor forState:UIControlStateNormal];
//    [_typeBt addTarget:self action:@selector(selectType) forControlEvents:UIControlEventTouchUpInside];
//    _typeBt.backgroundColor = [UIColor hq_arcolorWithHexString:@"#F6F6F6"];
    
    UILabel *descriptLb = [self createLable];
    descriptLb.text = @"问题描述（必填）";
    [descriptLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.mas_equalTo(typeLb);
        make.top.mas_equalTo(typeBackV.mas_bottom).offset(30);
    }];
    
    _textView = [[YYTextView alloc]init];
    [self.view addSubview:_textView];
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(typeBackV);
        make.height.mas_equalTo(176);
        make.top.mas_equalTo(descriptLb.mas_bottom).offset(15);
    }];
    _textView.placeholderFont = HQ_Font_Regular(14);
    _textView.placeholderTextColor = UIColor.ArColor_999999;
    _textView.placeholderText = @"遇到什么问题了？请在这里简单描述下…";
    _textView.textColor = UIColor.ArColor_111111;
    _textView.font = HQ_Font_Regular(14);
    _textView.backgroundColor = [UIColor hq_arcolorWithHexString:@"#F6F6F6"];
    
    _countLb = UILabel.new;
    [self.view addSubview:_countLb];
    [_countLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-24);
        make.top.mas_equalTo(_textView.mas_bottom).offset(8);
    }];
    _countLb.text = @"0/200";
    _countLb.textColor = [UIColor hq_arcolorWithHexString:@"#C6C6C6"];
    _countLb.font = HQ_Font_Regular(12);
    
    
    
    UILabel *connectLb = [self createLable];
    connectLb.text = @"联系方式";
    [connectLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.mas_equalTo(typeLb);
        make.top.mas_equalTo(_textView.mas_bottom).offset(30);
    }];
    
    _textField = UITextField.new;
    [self.view addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(typeLb);
        make.top.mas_equalTo(connectLb.mas_bottom).offset(20);
        make.height.mas_equalTo(44);
    }];
    _textField.backgroundColor = [UIColor hq_arcolorWithHexString:@"#F6F6F6"];
    _textField.textColor = UIColor.ArColor_111111;
    NSString *holderText = @"请填写您的手机号或者邮箱";
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:holderText];
    [placeholder addAttribute:NSForegroundColorAttributeName
                        value:UIColor.ArColor_999999
                            range:NSMakeRange(0, holderText.length)];
    [placeholder addAttribute:NSFontAttributeName
                            value: HQ_Font_Regular(14)
                            range:NSMakeRange(0, holderText.length)];
    _textField.attributedPlaceholder = placeholder;
    _textField.font = HQ_Font_Regular(14);
}

-(UILabel *)createLable{
    UILabel *lb = UILabel.new;
    lb.textColor = [UIColor hq_arcolorWithHexString:@"#010B16"];
    lb.font = HQ_Font_Medium(16);
    [self.view addSubview:lb];
    return lb;
}

#pragma mark click

-(void)selectType{
    
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
