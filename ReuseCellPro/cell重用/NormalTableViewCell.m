//
//  NormalTableViewCell.m
//  ReuseCellPro
//
//  Created by Fly on 2018/9/15.
//  Copyright © 2018年 air. All rights reserved.
//

#import "NormalTableViewCell.h"

@interface NormalTableViewCell()

@property (nonatomic, strong)   UILabel      *titleLabel;
@property (nonatomic, strong)   UILabel      *desLabel;

@end

@implementation NormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.clipsToBounds = YES;
        [self initView];
    }
    return self;
}

+ (instancetype)configNormalCell:(UITableView *)tableView {
    NSString *cellIdentifier = NSStringFromClass([self class]);
    NormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}

- (void)initView {
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.frame = CGRectMake(0, 0, 100, 20);
    [self.contentView addSubview:_titleLabel];
    
    _desLabel = [[UILabel alloc] init];
    _desLabel.frame = CGRectMake(0, _titleLabel.frame.origin.y +10, 100, 20);
    [self.contentView addSubview:_desLabel];
}

-(void)setLoveModel:(NormalModel *)loveModel {
    _loveModel = loveModel;
    _titleLabel.text = _loveModel.loveTitle;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
