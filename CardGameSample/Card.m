//
//  Card.m
//  CardGameSample
//
//  Created by hirauchi.shinichi on 2016/02/10.
//  Copyright © 2016年 SAPPOROWORKS. All rights reserved.
//

#import "Card.h"
#import "CardCell.h"

@interface Card ()

@property NSString *imageName;

@end

@implementation Card



-(id)initWithMark:(NSString*)mark no:(int)no {
    self = [super init];
    if (self != nil) {
        self.no = no;
        _imageName =  [NSString stringWithFormat:@"%@%2.2d",mark,no+1];
        _isFront = false;
    }
    return self;
}


- (NSString*) imageName {
    if ( _isFront ){
        return _imageName;
    }
    return @"z02";
}

- (void) Reverse:(UICollectionView *)collectionView {
    _isFront ^= 1;
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.index  inSection:0];
    CardCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell.image setImage:[UIImage imageNamed:self.imageName]];
}

@end