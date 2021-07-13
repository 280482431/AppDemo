//
//  HQAboutUSHeaderView.m
//  architecture
//
//  Created by lvfeijun on 2021/7/13.
//

#import "HQAboutUSHeaderView.h"

@interface HQAboutUSHeaderView ()

@property (nonatomic,strong) UIImageView *iconImgV;
@property (nonatomic,strong) UILabel *name;
@property (nonatomic,strong) UILabel *version;

@end

@implementation HQAboutUSHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _iconImgV = UIImageView.new;
        [self addSubview:_iconImgV];
        [_iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(80);
            make.centerX.mas_equalTo(self);
            make.top.mas_equalTo(20);
        }];
        
        _name = UILabel.new;
        [self addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_iconImgV.mas_bottom).offset(16);
            make.centerX.mas_equalTo(self);
        }];
        _name.textColor = UIColor.ArColor_111111;
        _name.font = HQ_Font_Medium(22);
        _name.text = @"建筑界";
        
        _version = UILabel.new;
        [self addSubview:_version];
        [_version mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_version.mas_bottom).offset(8);
            make.centerX.mas_equalTo(self);
        }];
        _version.textColor = UIColor.ArColor_999999;
        _version.font = HQ_Font_Medium(14);
        _version.text = @"Version 1.0.0";
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
