//
//  CardCell.m
//  CardGameSample
//
//  Created by hirauchi.shinichi on 2016/02/10.
//  Copyright © 2016年 SAPPOROWORKS. All rights reserved.
//

#import "CardCell.h"

@implementation CardCell


- (void) awakeFromNib {
    [super awakeFromNib];

    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    [self.contentView addGestureRecognizer:recognizer];
}


- (void) longPressStateChanged:(UILongPressGestureRecognizer *)recognizer {
    
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)recognizer{
    if([self.delegate respondsToSelector:@selector(cardCell:longPressStateChanged:atLocation:)]){
        CGPoint location = [recognizer locationInView:recognizer.view];
        [self.delegate cardCell:self longPressStateChanged:recognizer.state atLocation:location];

    }
}
@end

