//
//  ViewController.m
//  QZSwipeLeftToDeleteDemo
//
//  Created by 臧乾坤 on 2018/1/9.
//  Copyright © 2018年 QuentinZang. All rights reserved.
//

#import "ViewController.h"
#import "DeleteTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableList;

@property (strong, nonatomic) NSMutableArray *titles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"侧滑删除";
    
    _tableList.delegate = self;
    _tableList.dataSource = self;
    
    self.titles = [@[@"0000000000", @"111111111111",@"2222222222",@"3333333333",@"4444444444",@"5555555555",@"6666666666",@"7777777777",@"8888888888",@"9999999999"] mutableCopy];
    self.tableList.rowHeight = 44;
    
}

#pragma mark -tableView delegate & dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.titles.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"DeleteTableViewCell";
    DeleteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"DeleteTableViewCell" owner:self options:nil].lastObject;
    }
    if (!self.titles.count) {
        return cell;
    }
    
    cell.titleLabel.text = self.titles[indexPath.row];
    __weak typeof (self) weakSelf = self;
    __weak typeof (cell) weakCell = cell;
    cell.mySwipeBlock = ^{
        for(DeleteTableViewCell *tmpCell in tableView.visibleCells) {
            
            // 将其他正在打开的cell关闭
            if (![weakCell isEqual:tmpCell]) {
                [tmpCell closeMenu];
            }
            
            // 所有cell取消选中状态
            tmpCell.selected = NO;
        }
    };
    cell.myDeleteBlock =^{
        if (weakSelf.titles.count) {
            [weakSelf.titles removeObjectAtIndex:indexPath.row];
            
            NSLog(@"删除了 %ld", indexPath.row);
            if (indexPath.row == weakSelf.titles.count) {
                // 删除的是最后一个直接刷新
                [weakSelf.tableList reloadData];
            }else{
                // 删除其他的cell，带动画
                [weakSelf.tableList deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
                
                [weakSelf.tableList reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
            }
        }
    };
    
    return cell;
}


// 隐藏状态栏
- (BOOL)prefersStatusBarHidden {

    // [[UIApplication sharedApplication] setStatusBarHidden:YES];// iOS9已经弃用
    return YES;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    for(DeleteTableViewCell *tmpCell in tableView.visibleCells){
        
        //        if (![cell isEqual:tmpCell]) {
        //            tmpCell.selected = NO;
        //        }
        // 当某个cell处于选中状态时，所有cell关闭
        [tmpCell closeMenu];
    }
    NSLog(@"选中了 %ld", indexPath.row);
    
    // 选中cell时，可以有其它一些操作，比如：跳转页面
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
