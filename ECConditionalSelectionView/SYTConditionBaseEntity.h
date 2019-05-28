//
//  SYTConditionBaseEntity.h
//  SYTConditionFilterView
//
//  Created by Eden on 26/5/19.
//  Copyright © 2019年 Eden. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface SYTConditionBaseEntity : NSObject

@property (nonatomic,copy) NSString *titleString;

@property (nonatomic,strong) UIColor *selectedColor;

@property (nonatomic,strong) UIColor *normalColor;

@property (nonatomic,strong) UIFont *selectedFont;

@property (nonatomic,strong) UIFont *normalFont;

/// 文字 偏移值 默认为 (0,0)
@property (nonatomic,assign) CGPoint offset;

/// 图片和文字的距离，默认是 4
@property (nonatomic,assign) CGFloat titleImageMargin;

@property (nonatomic,assign,getter=isSelecteded) BOOL selected;

@end

///------------------------------------------------------------///
@interface SYTConditionNormal : SYTConditionBaseEntity



@end

///------------------------------------------------------------///
typedef NS_ENUM(NSInteger, ArrowOrderDirectionType) {
    ArrowOrderDirectionTypeNone = 0,
    ArrowOrderDirectionTypeUp = 1,
    ArrowOrderDirectionTypeDown = 2
};

@interface SYTConditionArrow : SYTConditionBaseEntity

@property (nonatomic,assign) ArrowOrderDirectionType directionType;

@property (nonatomic,assign,getter=isUp) BOOL up;

@property (nonatomic,assign,getter=isDown) BOOL down;

@property (nonatomic,copy) NSString *upNormalImageString;

@property (nonatomic,copy) NSString *upSelectedImageString;

@property (nonatomic,copy) NSString *downNormalImageString;

@property (nonatomic,copy) NSString *downSelectedImageString;

@end

///------------------------------------------------------------///
@interface SYTConditionImage : SYTConditionBaseEntity

@property (nonatomic,copy) NSString *imageString;

@end
