//
//  SYTConditionFilterView.m
//  SYTConditionFilterView
//
//  Created by 曹东 on 2019/5/24.
//  Copyright © 2019 Eden. All rights reserved.
//

#import "SYTConditionFilterView.h"

#import "SYTConditionFilterBaseCell.h"

@interface SYTConditionFilterView ()

<UICollectionViewDelegate,
UICollectionViewDataSource>

@property (nonatomic,strong) NSMutableArray<SYTConditionBaseEntity *> *items;

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,copy) NSString *_titleString;

@end

@implementation SYTConditionFilterView


- (void)setConditionItems:(NSArray<SYTConditionBaseEntity *> *)conditionItems {
    _conditionItems = conditionItems;
    
    [self.items removeAllObjects];
    [self.items addObjectsFromArray:conditionItems];
    
    [self.collectionView reloadData];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SYTConditionBaseEntity *e = [self.items objectAtIndex:indexPath.item];
    
    [self _resetBaseStauts];
    
    if ([e isKindOfClass:[SYTConditionNormal class]]) {
        SYTConditionNormal *n = (SYTConditionNormal *)e;
        n.selected = YES;
        [self _resetStautsArrow];
    }
    
    
    if ([e isKindOfClass:[SYTConditionArrow class]]) {
        SYTConditionArrow *a = (SYTConditionArrow *)e;
        a.selected = YES;
        
        if (!a.isUp &&
            !a.isDown) {
            [self _resetStautsArrow];
            a.up = YES;
            a.down = NO;
            a.directionType = ArrowOrderDirectionTypeUp;
        } else {
            
            if (a.isUp && !a.isDown) {
                a.up = NO;
                a.down = YES;
                a.directionType = ArrowOrderDirectionTypeDown;
            } else {
                a.up = YES;
                a.down = NO;
                a.directionType = ArrowOrderDirectionTypeUp;
            }
        }
        
    }
    
    if ([e isKindOfClass:[SYTConditionImage class]]) {
        SYTConditionImage *m = (SYTConditionImage *)e;
        m.selected = NO;
        [self _resetStautsArrow];
    }
    
    
    /// Delegate
    if ([self.delegate respondsToSelector:@selector(conditionFilterView:didTipConditionEntity:)]) {
        [self.delegate conditionFilterView:self didTipConditionEntity:e];
    }
    
    [self.collectionView reloadData];
}

- (void)_resetBaseStauts {
    for (NSInteger i = 0; i < self.items.count; i ++) {
        SYTConditionBaseEntity *e = [self.items objectAtIndex:i];
        e.selected = NO;
    }
}

- (void)_resetStautsArrow {
    
    for (NSInteger i = 0; i < self.items.count; i ++) {
        SYTConditionBaseEntity *e = [self.items objectAtIndex:i];
        if ([e isKindOfClass:[SYTConditionArrow class]]) {
            SYTConditionArrow *a = (SYTConditionArrow *)e;
            a.directionType = ArrowOrderDirectionTypeNone;
            a.up = NO;
            a.down = NO;
        }
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SYTConditionBaseEntity *e = [self.items objectAtIndex:indexPath.item];
    
    if ([e isKindOfClass:[SYTConditionNormal class]]) {
        SYTConditionFilterNormalCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SYTConditionFilterNormalCell class]) forIndexPath:indexPath];
        cell.entity = e;
        return cell;
    }
    
    if ([e isKindOfClass:[SYTConditionArrow class]]) {
        SYTConditionFilterArrowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SYTConditionFilterArrowCell class]) forIndexPath:indexPath];
        cell.entity = e;
        return cell;
    }
    
    if ([e isKindOfClass:[SYTConditionImage class]]) {
        SYTConditionFilterImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SYTConditionFilterImageCell class]) forIndexPath:indexPath];
        cell.entity = e;
        return cell;
    }
    
    return [UICollectionViewCell new];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat itemW = self.bounds.size.width / self.items.count - 0.001;
    CGFloat itemH = self.bounds.size.height;
    return CGSizeMake(itemW, itemH);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}

#pragma mark -
#pragma mark - Getter
- (instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.collectionView];
        
        [self.collectionView registerClass:[SYTConditionFilterNormalCell class] forCellWithReuseIdentifier:NSStringFromClass([SYTConditionFilterNormalCell class])];
        
        [self.collectionView registerClass:[SYTConditionFilterArrowCell class] forCellWithReuseIdentifier:NSStringFromClass([SYTConditionFilterArrowCell class])];
        
        [self.collectionView registerClass:[SYTConditionFilterImageCell class] forCellWithReuseIdentifier:NSStringFromClass([SYTConditionFilterImageCell class])];
    }
    return self;
}

#pragma mark -
#pragma mark - Getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
    }
    return _collectionView;
}

- (NSMutableArray<SYTConditionBaseEntity *> *)items {
    if (!_items) {
        _items = @[].mutableCopy;
    }
    return _items;
}

@end



