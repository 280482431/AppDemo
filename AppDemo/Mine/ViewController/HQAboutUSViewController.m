//
//  HQAboutUSViewController.m
//  architecture
//
//  Created by lvfeijun on 2021/7/13.
//

#import "HQAboutUSViewController.h"
#import "HQAboutUSCell.h"
#import "HQAboutUSHeaderView.h"

@interface HQAboutUSViewController ()

@property (strong, nonatomic) HQAboutUSHeaderView *hearderV;

@end

@implementation HQAboutUSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"关于我们";
    self.view.backgroundColor = [UIColor  whiteColor];
    
    self.datas = @[@"检查新版本",@"用户协议",@"隐私政策"];
    [self createTableView];
}
-(HQAboutUSHeaderView *)hearderV{
    if (!_hearderV) {
        _hearderV = HQAboutUSHeaderView.new;
    }
    return _hearderV;
}

-(void)createTableView{
    self.tableView =  [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self setCommonTableView];
    self.tableView.sectionFooterHeight = 0;
    [self registerClassCell:HQAboutUSCell.class];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = UIColor.whiteColor;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.view);
    }];
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section?CGFLOAT_MIN:HQAboutUSHeaderViewH;
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
    return HQAboutUSCellH;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HQAboutUSCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HQAboutUSCell"];
    cell.model = self.datas[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = self.datas[indexPath.section][indexPath.row];
//    [self.navigationController pushViewController:HQFeedBackViewController.new animated:YES];
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
