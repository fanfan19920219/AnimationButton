//
//  ZZH_JumpButton.m
//  AnimationButton
//
//  Created by M-SJ077 on 2016/12/1.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "ZZH_JumpButton.h"
#import "ZZH_AnimationTool.h"

//[NSValue valueWithCGPoint:CGPointMakex]



#define jumpButton_PathValueZeor [NSValue valueWithCGPoint:CGPointMake(self.center.x , self.center.y)]

#define jumpButton1_PathValue0 [NSValue valueWithCGPoint:CGPointMake(self.center.x - 50, self.center.y - 110)]
#define jumpButton1_PathValue1 [NSValue valueWithCGPoint:CGPointMake(self.center.x - 40, self.center.y - 100)]



#define jumpButton2_PathValue0 [NSValue valueWithCGPoint:CGPointMake(self.center.x - 130, self.center.y - 60)]
#define jumpButton2_PathValue1 [NSValue valueWithCGPoint:CGPointMake(self.center.x - 120, self.center.y - 50)]



#define jumpButton3_PathValue0 [NSValue valueWithCGPoint:CGPointMake(self.center.x - 130, self.center.y + 60)]
#define jumpButton3_PathValue1 [NSValue valueWithCGPoint:CGPointMake(self.center.x - 120, self.center.y + 50)]


#define jumpButton4_PathValue0 [NSValue valueWithCGPoint:CGPointMake(self.center.x - 50, self.center.y + 110)]
#define jumpButton4_PathValue1 [NSValue valueWithCGPoint:CGPointMake(self.center.x - 40, self.center.y + 100)]



@interface ZZH_JumpButton ()

@property (nonatomic , strong)UIView *superView;
@property (nonatomic , strong)UIButton *jumpButton1;
@property (nonatomic , strong)UIButton *jumpButton2;
@property (nonatomic , strong)UIButton *jumpButton3;
@property (nonatomic , strong)UIButton *jumpButton4;
@property (nonatomic , assign)BOOL orSpread;
@end

@implementation ZZH_JumpButton
_orSpread = NO;
ZZH_JumpButton *button;
+(instancetype)buttonWithType:(UIButtonType)buttonType{
    if(button==nil){
        button = [super buttonWithType:buttonType];
        [button addTarget:button action:@selector(createForButton) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return button;
}

-(void)createForButton{
    if(!_orSpread){
        [self.superview addSubview:self.jumpButton1];
        [self.superview addSubview:self.jumpButton2];
        [self.superview addSubview:self.jumpButton3];
        [self.superview addSubview:self.jumpButton4];
        [self.superview bringSubviewToFront:self];
        
        NSMutableArray *pointArray1 = [[NSMutableArray alloc]initWithObjects:jumpButton_PathValueZeor ,jumpButton1_PathValue0  ,jumpButton1_PathValue1, nil];
        
        NSMutableArray *pointArray2 = [[NSMutableArray alloc]initWithObjects:jumpButton_PathValueZeor ,jumpButton2_PathValue0  ,jumpButton2_PathValue1, nil];
        
        NSMutableArray *pointArray3 = [[NSMutableArray alloc]initWithObjects:jumpButton_PathValueZeor ,jumpButton3_PathValue0  ,jumpButton3_PathValue1, nil];
        
        NSMutableArray *pointArray4 = [[NSMutableArray alloc]initWithObjects:jumpButton_PathValueZeor ,jumpButton4_PathValue0  ,jumpButton4_PathValue1, nil];
        
        [[ZZH_AnimationTool Default]setviewCenter_WithPointArray:pointArray1 moveView:_jumpButton1 Durationtime:0.3];
        [[ZZH_AnimationTool Default]setviewCenter_WithPointArray:pointArray2 moveView:_jumpButton2 Durationtime:0.3];
        [[ZZH_AnimationTool Default]setviewCenter_WithPointArray:pointArray3 moveView:_jumpButton3 Durationtime:0.3];
        [[ZZH_AnimationTool Default]setviewCenter_WithPointArray:pointArray4 moveView:_jumpButton4 Durationtime:0.3];
    }else{
        NSMutableArray *pointArray1 = [[NSMutableArray alloc]initWithObjects:jumpButton1_PathValue1,jumpButton_PathValueZeor, nil];
        
        NSMutableArray *pointArray2 = [[NSMutableArray alloc]initWithObjects:jumpButton2_PathValue1, jumpButton_PathValueZeor , nil];
        
        NSMutableArray *pointArray3 = [[NSMutableArray alloc]initWithObjects:jumpButton3_PathValue1, jumpButton_PathValueZeor  ,nil];
        
        NSMutableArray *pointArray4 = [[NSMutableArray alloc]initWithObjects:jumpButton4_PathValue1, jumpButton_PathValueZeor ,nil];
        
        [[ZZH_AnimationTool Default]setviewCenter_WithPointArray:pointArray1 moveView:_jumpButton1 Durationtime:0.3];
        [[ZZH_AnimationTool Default]setviewCenter_WithPointArray:pointArray2 moveView:_jumpButton2 Durationtime:0.3];
        [[ZZH_AnimationTool Default]setviewCenter_WithPointArray:pointArray3 moveView:_jumpButton3 Durationtime:0.3];
        [[ZZH_AnimationTool Default]setviewCenter_WithPointArray:pointArray4 moveView:_jumpButton4 Durationtime:0.3];
        
    }
    _orSpread = !_orSpread;
}



-(UIButton *)jumpButton1{
    if(_jumpButton1==nil){
        _jumpButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _jumpButton1.bounds = CGRectMake(0, 0, 40, 40);
        _jumpButton1.center = self.center;
        _jumpButton1.backgroundColor = [UIColor redColor];
        _jumpButton1.tag = 1;
        _jumpButton1.layer.cornerRadius = 20;
        _jumpButton1.clipsToBounds = YES;
        [_jumpButton1 addTarget:button action:@selector(jumpButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jumpButton1;
}

-(UIButton *)jumpButton2{
    if(_jumpButton2==nil){
        _jumpButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _jumpButton2.bounds = CGRectMake(0, 0, 40, 40);
        _jumpButton2.center = self.center;
        _jumpButton2.backgroundColor = [UIColor redColor];
        _jumpButton2.tag = 2;
        _jumpButton2.layer.cornerRadius = 20;
        _jumpButton2.clipsToBounds = YES;
        [_jumpButton2 addTarget:button action:@selector(jumpButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jumpButton2;
}

-(UIButton *)jumpButton3{
    if(_jumpButton3==nil){
        _jumpButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
        _jumpButton3.bounds = CGRectMake(0, 0, 40, 40);
        _jumpButton3.center = self.center;
        _jumpButton3.backgroundColor = [UIColor redColor];
        _jumpButton3.tag = 3;
        _jumpButton3.layer.cornerRadius = 20;
        _jumpButton3.clipsToBounds = YES;
        [_jumpButton3 addTarget:button action:@selector(jumpButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jumpButton3;
}

-(UIButton *)jumpButton4{
    if(_jumpButton4==nil){
        _jumpButton4 = [UIButton buttonWithType:UIButtonTypeCustom];
        _jumpButton4.bounds = CGRectMake(0, 0, 40, 40);
        _jumpButton4.center = self.center;
        _jumpButton4.backgroundColor = [UIColor redColor];
        _jumpButton4.tag = 4;
        _jumpButton4.layer.cornerRadius = 20;
        _jumpButton4.clipsToBounds = YES;
        [_jumpButton4 addTarget:button action:@selector(jumpButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jumpButton4;
}


-(void)jumpButtonClick:(UIButton*)sender{
    [self.delegate jumpClick:sender.tag];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
