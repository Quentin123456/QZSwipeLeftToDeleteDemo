//
//  DeleteTableViewCell.h
//  QZSwipeLeftToDeleteDemo
//
//  Created by 臧乾坤 on 2018/1/9.
//  Copyright © 2018年 QuentinZang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DeleteTableViewCell;

typedef void(^swipeBlock) (void);
typedef void(^deleteBlock) (void);
typedef void(^cancleBlock) (void);

@interface DeleteTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (assign, nonatomic) BOOL isOpen;

@property (copy, nonatomic) swipeBlock mySwipeBlock;
@property (copy, nonatomic) deleteBlock myDeleteBlock;

-(void)closeMenu;

@end
