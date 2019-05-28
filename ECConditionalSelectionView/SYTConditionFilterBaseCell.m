//
//  SYTConditionFilterBaseCell.m
//  SYTConditionFilterView
//
//  Created by Eden on 26/5/19.
//  Copyright © 2019年 Eden. All rights reserved.
//

#import "SYTConditionFilterBaseCell.h"

#import "SYTConditionBaseEntity.h"

@interface SYTConditionFilterBaseCell ()

@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation SYTConditionFilterBaseCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)setEntity:(SYTConditionBaseEntity *)entity {
    _entity = entity;
    
    self.titleLabel.text = entity.titleString;
    
    if (entity.isSelecteded) {
        self.titleLabel.textColor = entity.selectedColor;
        self.titleLabel.font = entity.selectedFont;
    }
    
    if (!entity.isSelecteded) {
        self.titleLabel.textColor = entity.normalColor;
        self.titleLabel.font = entity.normalFont;
    }
    
    [self.titleLabel sizeToFit];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat centerX = self.bounds.size.width * 0.5;
    CGFloat centerY = self.bounds.size.height * 0.5;
    
    self.titleLabel.centerX = centerX;
    self.titleLabel.centerY = centerY;
    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
    }
    return _titleLabel;
}

@end


/// --------------------- SYTConditionFilterNormalCell ---------------------///

@implementation SYTConditionFilterNormalCell

@end

/// --------------------- SYTConditionFilterArrowCell ---------------------///

@interface SYTConditionFilterArrowCell ()

@property (nonatomic,strong) UIImageView *upImageView;

@property (nonatomic,strong) UIImageView *downImageView;

@end

@implementation SYTConditionFilterArrowCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.upImageView];
        [self addSubview:self.downImageView];
        
    }
    return self;
}

- (void)setEntity:(SYTConditionBaseEntity *)entity {
    [super setEntity:entity];
    
    SYTConditionArrow *a = (SYTConditionArrow *)entity;
    if (!a.isUp && !a.isDown) {
        self.upImageView.image = [UIImage imageNamed:a.upNormalImageString];
        self.downImageView.image = [UIImage imageNamed:a.downNormalImageString];
    }
    
    if (a.isUp && !a.isDown) {
        self.upImageView.image = [UIImage imageNamed:a.upSelectedImageString];
        self.downImageView.image = [UIImage imageNamed:a.downNormalImageString];
    }
    
    if (!a.isUp && a.isDown) {
        self.upImageView.image = [UIImage imageNamed:a.upNormalImageString];
        self.downImageView.image = [UIImage imageNamed:a.downSelectedImageString];
    }
    
    [self.upImageView sizeToFit];
    [self.downImageView sizeToFit];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat centerY = self.bounds.size.height * 0.5;
    
    CGFloat imageH = self.upImageView.height;
    
    CGFloat offsetX = self.entity.offset.x;
    CGFloat offsetY = self.entity.offset.y;
    
    /// 计算title的x
    CGFloat margin = self.entity.titleImageMargin;
    CGFloat titleX = (w - (self.titleLabel.width + self.upImageView.size.width + margin)) * 0.5;
    
    self.titleLabel.x = titleX + offsetX;
    self.titleLabel.centerY = centerY + offsetY;
    
    /// 上图片
    CGFloat x1 = CGRectGetMaxX(self.titleLabel.frame) + margin;
    CGFloat y1 = centerY - imageH - offsetY;
    
    self.upImageView.x = x1;
    self.upImageView.y = y1;
    
    /// 上图片
    CGFloat x2 = CGRectGetMaxX(self.titleLabel.frame) + margin;
    CGFloat y2 = centerY + offsetY;
    
    self.downImageView.x = x2;
    self.downImageView.y = y2;
    
}

- (UIImageView *)upImageView {
    if (!_upImageView) {
        _upImageView = [UIImageView new];
    }
    return _upImageView;
}

- (UIImageView *)downImageView {
    if (!_downImageView) {
        _downImageView = [UIImageView new];
    }
    return _downImageView;
}

@end

/// --------------------- SYTConditionFilterImageCell ---------------------///

@interface SYTConditionFilterImageCell ()

@property (nonatomic,strong) UIImageView *iconImageView;

@end

@implementation SYTConditionFilterImageCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.iconImageView];
    }
    return self;
}

- (void)setEntity:(SYTConditionBaseEntity *)entity {
    [super setEntity:entity];
    
    SYTConditionImage *m = (SYTConditionImage *)entity;
    self.iconImageView.image = [UIImage imageNamed:m.imageString];
    [self.iconImageView sizeToFit];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat centerY = self.bounds.size.height * 0.5;
    
    CGFloat offsetX = self.entity.offset.x;
    CGFloat offsetY = self.entity.offset.y;
    
    
    /// 计算title的x
    CGFloat margin = self.entity.titleImageMargin;
    CGFloat titleX = (w - (self.titleLabel.width + self.iconImageView.size.width + margin)) * 0.5;
    
    self.titleLabel.x = titleX + offsetX;
    self.titleLabel.centerY = centerY + offsetY;
    
    /// 计算图片
    CGFloat x1 = CGRectGetMaxX(self.titleLabel.frame) + margin;
    CGFloat y1 = centerY;

    self.iconImageView.x = x1;
    self.iconImageView.centerY = y1 + offsetY;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
    }
    return _iconImageView;
}

@end

