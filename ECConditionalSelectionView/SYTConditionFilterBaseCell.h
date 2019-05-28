//
//  SYTConditionFilterBaseCell.h
//  SYTConditionFilterView
//
//  Created by Eden on 26/5/19.
//  Copyright © 2019年 Eden. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+ECExtension.h"

@class SYTConditionBaseEntity;

@interface SYTConditionFilterBaseCell : UICollectionViewCell

@property (nonatomic,strong) SYTConditionBaseEntity *entity;

@end


@interface SYTConditionFilterNormalCell : SYTConditionFilterBaseCell

@end

@interface SYTConditionFilterArrowCell : SYTConditionFilterBaseCell

@end

@interface SYTConditionFilterImageCell : SYTConditionFilterBaseCell


@end
