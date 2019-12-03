//
//  DeleteTableViewCell.m
//  QZSwipeLeftToDeleteDemo
//
//  Created by 臧乾坤 on 2018/1/9.
//  Copyright © 2018年 QuentinZang. All rights reserved.
//

#import "DeleteTableViewCell.h"

@interface DeleteTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *moveView;

@end

@implementation DeleteTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.moveView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
    //添加左滑手势
    UISwipeGestureRecognizer *swipLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swip:)];
    swipLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.moveView addGestureRecognizer:swipLeft];
    //添加右滑手势
    UISwipeGestureRecognizer *swipRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swip:)];
    swipRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.moveView addGestureRecognizer:swipRight];
    
}

- (IBAction)deleteBtnTap:(UIButton *)sender {
    
    if(sender.tag == 666){
        // 取消
        [self closeMenu];
        
    }else if (sender.tag == 777){
        // 删除
        if(self.myDeleteBlock){
            self.myDeleteBlock();
        }
        
    }
    
}


- (void)swip:(UISwipeGestureRecognizer *)swipe {
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        // 打开
        [self openMenu];
        
        // 将其他已打开的关闭
        if( self.mySwipeBlock ){
            self.mySwipeBlock();
        }
    }else if (swipe.direction == UISwipeGestureRecognizerDirectionRight){
        // 关闭
        [self closeMenu];
    }
}

- (void)openMenu {
    
    if (self.isOpen) {
        return;
    }
    [UIView animateWithDuration:0.5 animations:^{
        self.moveView.center = CGPointMake(self.moveView.center.x - 130, self.moveView.center.y);
    }completion:^(BOOL finished) {
        if(finished){
            self.isOpen = YES;
        }
    }];
    
}

/**关闭左滑菜单*/
-(void)closeMenu {
    
    if(!_isOpen)
    return;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.moveView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, self.moveView.center.y);
    }completion:^(BOOL finished) {
        if (finished) {
            self.isOpen = NO;
        }
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
