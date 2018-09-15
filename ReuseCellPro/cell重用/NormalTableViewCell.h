//
//  NormalTableViewCell.h
//  ReuseCellPro
//
//  Created by Fly on 2018/9/15.
//  Copyright © 2018年 air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NormalModel.h"

@interface NormalTableViewCell : UITableViewCell

@property (nonatomic, strong) NormalModel *loveModel;

+ (instancetype)configNormalCell:(UITableView *)tableView;

@end
