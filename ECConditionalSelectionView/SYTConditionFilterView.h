//
//  SYTConditionFilterView.h
//  SYTConditionFilterView
//
//  Created by 曹东 on 2019/5/24.
//  Copyright © 2019 Eden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYTConditionBaseEntity.h"

@class SYTConditionFilterView;

@protocol SYTConditionFilterViewDelegate <NSObject>

@optional

- (void)conditionFilterView:(SYTConditionFilterView *)v didTipConditionEntity:(SYTConditionBaseEntity *)e;


@end

@interface SYTConditionFilterView : UIView

@property (nonatomic,strong) NSArray<SYTConditionBaseEntity *> *conditionItems;

@property (nonatomic,weak) id<SYTConditionFilterViewDelegate> delegate;

@end


/// 使用说明 /// 
/*
 SYTConditionNormal *e = [SYTConditionNormal new];
 e.titleString = @"综合";
 
 SYTConditionArrow *e1 = [SYTConditionArrow new];
 e1.titleString = @"销量";
 e1.upNormalImageString = @"kz_mall_price_black_up";
 e1.upSelectedImageString = @"kz_mall_price_red_up";
 e1.downNormalImageString = @"kz_mall_price_black_down";
 e1.downSelectedImageString = @"kz_mall_price_red_down";
 
 SYTConditionArrow *e2 = [SYTConditionArrow new];
 e2.titleString = @"价格";
 e2.upNormalImageString = @"kz_mall_price_black_up";
 e2.upSelectedImageString = @"kz_mall_price_red_up";
 e2.downNormalImageString = @"kz_mall_price_black_down";
 e2.downSelectedImageString = @"kz_mall_price_red_down";
 
 SYTConditionImage *e3 = [SYTConditionImage new];
 e3.titleString = @"筛选";
 e3.imageString = @"yqg_product_detail_sel_icon";
 
 SYTConditionFilterView *v = [[SYTConditionFilterView alloc] init];
 v.conditionItems = @[e,e1,e2,e3];
 v.delegate = self;
 v.frame = CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, 50);
 
 [self.view addSubview:v];
 
 
 /// ---------- Delegate ----------  ///
 - (void)conditionFilterView:(SYTConditionFilterView *)v didTipConditionEntity:(SYTConditionBaseEntity *)e {
 
    if ([e isKindOfClass:[SYTConditionNormal class]]) {
        SYTConditionNormal *n = (SYTConditionNormal *)e;
        NSLog(@"");
    }
 
    if ([e isKindOfClass:[SYTConditionArrow class]]) {
        SYTConditionArrow *a = (SYTConditionArrow *)e;
        NSLog(@"");
    }
 
    if ([e isKindOfClass:[SYTConditionImage class]]) {
        SYTConditionImage *m = (SYTConditionImage *)e;
        NSLog(@"");
    }
 }
 
 ***/
