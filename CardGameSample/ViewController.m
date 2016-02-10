//
//  ViewController.m
//  CardGameSample
//
//  Created by hirauchi.shinichi on 2016/02/10.
//  Copyright © 2016年 SAPPOROWORKS. All rights reserved.
//

#import "ViewController.h"
#import "CardCell.h"
#import "Card.h"

@interface ViewController ()<UICollectionViewDelegateFlowLayout,CardCellDelegate>

@property (nonatomic) NSMutableArray *cards;

@end


typedef NS_ENUM(int,Status) {
    Enpty,
    FirstOpen,
    SecondOpen,
    Success
};


@implementation ViewController

int counter = 0;
Card *FirstCard;
Card *SecondCard;


enum Status status = Enpty;


- (void) awakeFromNib {
    [super awakeFromNib];

    self.cards = [NSMutableArray array];

    for (int mark = 0; mark < 4; mark++) {
        NSString *m = @"c";
        if(mark == 1){
            m = @"d";
        }else if (mark == 2){
            m = @"h";
        }else if (mark == 3){
            m = @"s";
        }
        for (int no = 0; no < 13; no++) {

            Card *card = [[Card alloc]initWithMark:m no:no];
            int r = 0;
            if( self.cards.count > 20){
                r = rand() % 20;
            }
            [self.cards insertObject:card atIndex:r];
        }
        for (int i=0 ; i < self.cards.count ; i++){
            Card *card = [self.cards objectAtIndex:i];
            card.index = i;
        }
    }

}

// 長押しイベント
- (void)cardCell:(CardCell *)cell longPressStateChanged:(UIGestureRecognizerState)state atLocation:(CGPoint)location {

    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    Card *card = self.cards[indexPath.item];

    if ( status == Enpty && !card.isFront){
        FirstCard = card;
        [FirstCard Reverse:self.collectionView];
        status = FirstOpen;
    }else if ( status ==  FirstOpen && !card.isFront){
        SecondCard = card;
        [SecondCard Reverse:self.collectionView];

        if(FirstCard.no == SecondCard.no){
            [UIView animateWithDuration:1.0 animations:^{
                self.collectionView.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];
            }];
            status = Success;
        }else{
            status = SecondOpen;
        }
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:1
                                              target:self
                                            selector:@selector(time:)
                                            userInfo:nil
                                             repeats:YES];
}

-(void)time:(NSTimer*)timer{
    if ( status == SecondOpen || status == Success){
        counter++;
        if(counter == 2){
            if ( status == SecondOpen ) {
                [FirstCard Reverse:self.collectionView];
                [SecondCard Reverse:self.collectionView];
            }
            [UIView animateWithDuration:1.0 animations:^{
                self.collectionView.backgroundColor = [UIColor colorWithRed:0.0 green:0.4 blue:0.0 alpha:1.0];
            }];
            status = Enpty;
        }
    }else{
        counter = 0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// アイテム数を指定する（必須）
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.cards.count;
}

//セルを返すメソッド（必須）
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    // 再利用キューからセルを取得
    CardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CardCell" forIndexPath:indexPath];


    // セルの設定
    Card *card = self.cards[indexPath.item];

    [cell.image setImage:[UIImage imageNamed:card.imageName]];
    cell.delegate = self;
    return cell;
}


@end
