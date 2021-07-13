//
//  HQMeHeaderView.m
//  architecture
//
//  Created by lvfeijun on 2021/7/9.
//

#import "HQMeHeaderView.h"

@interface HQMeHeaderView ()

@property (nonatomic, strong) UIImageView *backImgV;
@property (nonatomic, strong) UIImageView *headerImgV;
@property (nonatomic, strong) UILabel *nameLb;

@end

@implementation HQMeHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backImgV = [[UIImageView alloc]initWithImage:[UIImage hq_getImageWithBundleName:@"" ImageName:@""]];
        [self addSubview:self.backImgV];
        
        _headerImgV = UIImageView.new;
        [self addSubview:_headerImgV];
        [_headerImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(70);
            make.right.mas_equalTo(25);
            make.bottom.mas_equalTo(-50);
        }];
        _headerImgV.layer.cornerRadius = 35;
        _headerImgV.layer.masksToBounds = YES;
        
        _nameLb = UILabel.new;
        [self addSubview:_nameLb];
        _nameLb.text = @"登录/注册";
        _nameLb.textColor = UIColor.ArColor_111111;
        _nameLb.font = HQ_Font_Medium(19);
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(25);
            make.centerY.mas_equalTo(_headerImgV);
            make.right.mas_equalTo(_headerImgV.mas_left).offset(15);
        }];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
