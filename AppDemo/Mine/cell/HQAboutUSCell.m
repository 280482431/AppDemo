//
//  HQAboutUSCell.m
//  architecture
//
//  Created by lvfeijun on 2021/7/13.
//

#import "HQAboutUSCell.h"

@interface HQAboutUSCell ()

@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UIImageView *leftImgV;

@end

@implementation HQAboutUSCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initViews];
        [self setViews];
    }
    return self;
}
-(void)initViews{
    _titleLb = UILabel.new;
    [self.contentView addSubview:_titleLb];
    
    _leftImgV = [[UIImageView alloc]initWithImage:[UIImage hq_getImageWithBundleName:@"" ImageName:@""]];
    [self.contentView addSubview:_leftImgV];
}
-(void)setViews{
    [_leftImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(5);
        make.height.mas_equalTo(9);
        make.right.mas_equalTo(self).offset(15);
    }];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.centerY.mas_equalTo(self);
    }];
    _titleLb.font = HQ_Font_Regular(16);
    _titleLb.textColor = UIColor.ArColor_111111;
}

- (void)setModel:(NSString *)model{
    _titleLb.text = model;
}

@end
