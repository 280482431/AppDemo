//
//  HQMeViewController.m
//  architecture
//
//  Created by sillker on 2021/6/25.
//

#import "HQMeViewController.h"
#import <HQCodeLoginController.h>
#import "HQMeCell.h"
#import "HQMeHeaderView.h"
#import "HQFeedBackViewController.h"

@interface HQMeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) HQMeHeaderView *hearderV;

@end

@implementation HQMeViewController

#pragma mark tableView

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section?10:HQMeHeaderViewH;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section) {
        UIView *view = UIView.new;
        view.backgroundColor = [UIColor hq_arcolorWithHexString:@"#F8F8F8"];
        return view;
    }else{
        return self.hearderV;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return HQMeCellH;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.datas.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = self.datas[section];
    return [array count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HQMeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HQMeCell"];
    cell.model = self.datas[indexPath.section][indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = self.datas[indexPath.section][indexPath.row];
    [self.navigationController pushViewController:HQFeedBackViewController.new animated:YES];
}

#pragma mark create

-(void)createTableView{
    self.tableView =  [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self setCommonTableView];
    self.tableView.sectionFooterHeight = 0;
    [self registerClassCell:HQMeCell.class];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = UIColor.whiteColor;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.view);
    }];
}

-(HQMeHeaderView *)hearderV{
    if (!_hearderV) {
        _hearderV = [[HQMeHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, HQMeHeaderViewH)];
    }
    return _hearderV;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"我的";
    self.view.backgroundColor = [UIColor  whiteColor];
    
    self.datas = @[@[@{@"icon":@"",@"name":@"我的收藏"},@{@"icon":@"",@"name":@"我的下载"},@{@"icon":@"",@"name":@"我的偏好"}],
    @[@{@"icon":@"",@"name":@"问题反馈"},@{@"icon":@"",@"name":@"关于我们"},@{@"icon":@"",@"name":@"设置"}]
    ];
    [self createTableView];
    
    @weakify(self)
    [RACObserve([GVUserDefaults standardUserDefaults], hq_token) subscribeNext:^(NSString *passport) {
        @strongify(self)
//        [self judgeIsLogin];
        if (passport.length > 0) {
//            [IntentionManager getUserSortIDFromServerSuccess:nil failure:nil];
//            //获取最新的感兴趣考试
//            [HQInterestedExamManager getInterestedExamFromServer:^(HQInterestedModel * _Nonnull model, NSError * _Nonnull error) {
//            }];
        }
        else {
            //重置
//            self.unPayCount = 0;
//            self.unReadCount = 0;
//            self.courseModel = nil;
//            self.inviteFriendCouponModel = nil;
        }
//        [self.tableView reloadData];
    }];
}

@end
