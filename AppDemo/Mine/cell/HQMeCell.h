//
//  HQMeCell.h
//  architecture
//
//  Created by lvfeijun on 2021/7/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define HQMeCellH 55

@interface HQMeCellModel : NSObject

@property (strong,nonatomic) NSString *icon;
@property (strong,nonatomic) NSString *name;

@end

@interface HQMeCell : UITableViewCell

@property (strong,nonatomic) NSDictionary *model;

@end

NS_ASSUME_NONNULL_END
