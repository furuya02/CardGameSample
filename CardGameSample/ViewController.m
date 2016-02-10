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

@interface ViewController ()<UICollectionViewDelegateFlowLayout>

@property (nonatomic) NSMutableArray *cards;

@end

@implementation ViewController

NSArray *cards;

- (void) awakeFromNib {
    [super awakeFromNib];

    self.cards = [NSMutableArray array];

//    for (int mark = 0; mark < 4; mark++) {
//        for (int no = 0; no < 13; no++) {
//            Card *card = [Card alloc];
//            card.mark = mark;
//            card.no = no;
//            [self.cards addObject:card];
//        }
//    }
}


- (void)viewDidLoad {
    [super viewDidLoad];

}


// セクション数を返す（オプション）
//- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 1;
//}

// アイテム数を指定する（必須）
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.cards.count;
}

//セルを返すメソッド（必須）
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 再利用キューからセルを取得
    CardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CardCell" forIndexPath:indexPath];
    // セルの設定
//    cell.textView.text = self.notes[indexPath.item];
//    cell.textView.font = self.font;

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
