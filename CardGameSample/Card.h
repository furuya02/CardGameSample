//
//  Card.h
//  CardGameSample
//
//  Created by hirauchi.shinichi on 2016/02/10.
//  Copyright © 2016年 SAPPOROWORKS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Card : NSObject


//@property NSString *imageName;
@property int no;
@property bool isFront;
@property int index;

-(id)initWithMark:(NSString*)mark no:(int)no;

- (NSString*) imageName;
- (void) Reverse:(UICollectionView *)collectionView;


@end

