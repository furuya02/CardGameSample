//
//  CardLayout.m
//  CardGameSample
//
//  Created by hirauchi.shinichi on 2016/02/10.
//  Copyright © 2016年 SAPPOROWORKS. All rights reserved.
//

#import "CardLayout.h"

@implementation CardLayout

- (void)setupItemAttributes:(UICollectionViewLayoutAttributes *) attributes {
    int r = rand() % 4;

    //    CGFloat radian = M_PI / 180.0f * 30.0f;
    CGFloat radian = M_PI / 180.0f * 10.0f * r;
    attributes.transform = CGAffineTransformMakeRotation(radian);
    attributes.zIndex = attributes.indexPath.item;
}

- (void)setupSupplementaryViewAttributes:(UICollectionViewLayoutAttributes *) attributes{
    if ([attributes.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]){
        attributes.zIndex = -1;
    }
}

// 表示領域のレイアウト属性を返す
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {

    NSArray *allAttributes = [ super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes * attributes in allAttributes){
        if (attributes.representedElementCategory == UICollectionElementCategoryCell){
            // セルのレイアウト属性
            [self setupItemAttributes:attributes];
        } else if (attributes.representedElementCategory == UICollectionElementCategorySupplementaryView){
            // 補助ビューのレイアウト属性
            [self setupSupplementaryViewAttributes:attributes];
        }
    }
    return allAttributes;

}

// セルのレイアウト属性を返す
- (UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    [self setupItemAttributes:attributes];
    return attributes;
}

// 補助ビューのレイアウト属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes * attributes = [super layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:indexPath];
    [self setupSupplementaryViewAttributes:attributes];
    return attributes;
}





@end
