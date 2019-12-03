//
//  SecondViewController.m
//  QZSwipeLeftToDeleteDemo
//
//  Created by ChuangLan on 2019/12/3.
//  Copyright © 2019 QuentinZang. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)getNumber {
    NSArray *array = [NSArray arrayWithObjects:@1,@2, nil];
    NSLog(@"%@",array);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
