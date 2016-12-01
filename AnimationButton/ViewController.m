//
//  ViewController.m
//  AnimationButton
//
//  Created by M-SJ077 on 2016/12/1.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "ViewController.h"
#import "ZZH_JumpButton.h"
@interface ViewController ()<ZZH_JUMPBUTTONDELEGATE>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ZZH_JumpButton *button = [ZZH_JumpButton buttonWithType:UIButtonTypeCustom];
    button.delegate = self;
    button.bounds = CGRectMake(0, 0, 50, 50);
    button.center = CGPointMake(self.view.frame.size.width - 60, 400);
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
}

-(void)jumpClick:(NSInteger)ClickIndex{
    NSLog(@"index --- %ld",(long)ClickIndex);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
