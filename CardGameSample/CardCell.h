//
//  CardCell.h
//  CardGameSample
//
//  Created by hirauchi.shinichi on 2016/02/10.
//  Copyright © 2016年 SAPPOROWORKS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CardCellDelegate;


@interface CardCell : UICollectionViewCell
@property (nonatomic,weak) id <CardCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@protocol CardCellDelegate <NSObject>

@optional
- (void) cardCell:(CardCell *)cell
longPressStateChanged:(UIGestureRecognizerState)state
         atLocation:(CGPoint)location;
@end
