//
//  HQMeCell.m
//  architecture
//
//  Created by lvfeijun on 2021/7/8.
//

#import "HQMeCell.h"

@interface HQMeCell ()

@property (nonatomic, strong) UIImageView *iconImgV;
@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) UIImageView *leftImgV;

@end

@implementation HQMeCell

- (void)setModel:(NSDictionary *)model{
    _model = model;
//    self.iconImgV.image = [UIImage imageNamed:@""];
    self.titleLb.text = model[@"name"];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initViews];
        [self setViews];
    }
    return self;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initViews];
        [self setViews];
    }
    return self;
}
-(void)initViews{
    _iconImgV = UIImageView.new;
    [self.contentView addSubview:_iconImgV];
    
    _titleLb = UILabel.new;
    [self.contentView addSubview:_titleLb];
    
    _leftImgV = [[UIImageView alloc]initWithImage:[UIImage hq_getImageWithBundleName:@"" ImageName:@""]];
    [self.contentView addSubview:_leftImgV];
}
-(void)setViews{
    [_iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(20);
        make.left.mas_equalTo(16);
        make.centerY.mas_equalTo(self);
    }];
    [_leftImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_iconImgV);
        make.width.mas_equalTo(5);
        make.height.mas_equalTo(9);
        make.right.mas_equalTo(self).offset(15);
    }];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_iconImgV.mas_right).offset(15);
//        make.right.mas_equalTo(_leftImgV.mas_left).offset(15);
        make.centerY.mas_equalTo(_iconImgV);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
