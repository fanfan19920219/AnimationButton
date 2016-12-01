//
//  ZZH_AnimationTool.m
//  ZZH_AnimationProject
//
//  Created by zhangzhihua on 16/6/2.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import "ZZH_AnimationTool.h"
#import "ZZH_AnimationView.h"
#define DEFAULT_TIME 1.5f

@interface ZZH_AnimationTool () <CAAnimationDelegate>{
    UIView *_animationView;
    CGPoint toPoint;
    CGRect  toRect;
    NSInteger AnimationIndex;
    
}
@end


@implementation ZZH_AnimationTool
NSMutableArray *_AnimationViewArray;
static ZZH_AnimationTool *zzh;
+(instancetype)Default{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        zzh = [[ZZH_AnimationTool alloc]init];
        _AnimationViewArray = [NSMutableArray array];
    });
    return zzh;
}

//  CenterAnimation
-(void)setviewCenter_FromValue:(CGPoint)fromValue toValue:(CGPoint)toValue moveView:(UIView*)moveView Durationtime:(double)durationtime{
    self.status = ANIMATIONSTYLEMOVECENTER;
    _animationView = moveView;
    //获得一个动画对象
    CABasicAnimation* basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"position";
    basicAnimation.fromValue = [NSValue valueWithCGPoint:fromValue];
    basicAnimation.toValue = [NSValue valueWithCGPoint:toValue];
    basicAnimation.duration = durationtime;
    //layer 停留在动画结束的位置
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.fillMode = kCAFillModeForwards;
    basicAnimation.delegate = self;
    //定义动画效果
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //添加动画
    [moveView.layer addAnimation:basicAnimation forKey:@"centerAnimation"];
//    [CATransaction setDisableActions:NO];//设置是否启动隐式动画
    toPoint = toValue;
}

//  BoundsAnimation
-(void)setviewSize_FromValue:(CGRect)fromValue toValue:(CGRect)toValue moveView:(UIView*)moveView Durationtime:(double)durationtime{
    self.status = ANIMATIONSTYLECHANGESIZE;
    _animationView = moveView;
    //获得一个动画对象
    CABasicAnimation* basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"bounds";
    basicAnimation.fromValue = [NSValue valueWithCGRect:fromValue];
    basicAnimation.toValue = [NSValue valueWithCGRect:toValue];
    basicAnimation.duration = durationtime;
    //layer 停留在动画结束的位置
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.fillMode = kCAFillModeForwards;
    basicAnimation.delegate = self;
    //定义动画效果
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //添加动画
    [moveView.layer addAnimation:basicAnimation forKey:@"boundsAnimation"];
    //    [CATransaction setDisableActions:NO];//设置是否启动隐式动画
    toRect = toValue;
}

//  CenterAndBoundsAnimation
-(void)setviewSizeAndCenter_FromBounds:(CGRect)fromBounds toBounds:(CGRect)toBounds FromCenter:(CGPoint)fromeCenter toCenter:(CGPoint)toCenter moveView:(UIView*)moveView Durationtime:(double)durationtime{
    self.status = ANIMATIONSTYLEMOVECENTERANDCHANGESIZE;
    _animationView = moveView;
    
    //可以同时执行多个动画，组装多个动画同时执行
    CAAnimationGroup* animationGroup = [CAAnimationGroup animation];
    //center
    CABasicAnimation* basicAnimationCenter = [CABasicAnimation animation];
    basicAnimationCenter.keyPath = @"position";
    basicAnimationCenter.fromValue = [NSValue valueWithCGPoint:fromeCenter];
    basicAnimationCenter.toValue = [NSValue valueWithCGPoint:toCenter];
    //定义动画效果
    basicAnimationCenter.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //bounds
    CABasicAnimation* basicAnimationBounds = [CABasicAnimation animation];
    basicAnimationBounds.keyPath = @"bounds";
    basicAnimationBounds.fromValue = [NSValue valueWithCGRect:fromBounds];
    basicAnimationBounds.toValue = [NSValue valueWithCGRect:toBounds];
    //定义动画效果
    basicAnimationBounds.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    //可以组装任意多个
    animationGroup.animations = @[basicAnimationCenter, basicAnimationBounds];
    
    animationGroup.duration = durationtime;
    animationGroup.delegate= self;
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeForwards;
    
    //[animationGroup setAutoreverses:YES];设置是否返回
    [moveView.layer addAnimation:animationGroup forKey:@"BoundsAndCenterAnimationGroup"];
    
    
    toPoint = toCenter;
    toRect = toBounds;
}


#pragma mark ::::::::::::::位移动画组:::::::::::::::::
-(void)setviewCenter_WithPointArray:(NSMutableArray<NSValue *>*)PointArray moveView:(UIView*)moveView Durationtime:(double)durationtime{
    CAKeyframeAnimation* keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation.delegate =self;
    ZZH_AnimationView *ZZH_View = [[ZZH_AnimationView alloc]init];
    ZZH_View.view = moveView;
    ZZH_View.toPoint = [[PointArray lastObject] CGPointValue];
    [_AnimationViewArray addObject:ZZH_View];
    self.status = ANIMATIONSTYLEMOVEPATH;
    keyframeAnimation.values = PointArray;
    keyframeAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0f],[NSNumber numberWithFloat:0.50f],[NSNumber numberWithFloat:1]];
    keyframeAnimation.duration = durationtime;
    keyframeAnimation.removedOnCompletion = NO;
    keyframeAnimation.fillMode = kCAFillModeForwards;
    [moveView.layer addAnimation:keyframeAnimation forKey:@"keyframeAtion"];
    toPoint = [[PointArray lastObject] CGPointValue];
}


- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"动画开始了");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        NSLog(@"动画执行完毕");
        switch (self.status) {
            case ANIMATIONSTYLECHANGESIZE:{
                _animationView.bounds = toRect;
            }break;
            case ANIMATIONSTYLEMOVECENTER:{
                _animationView.center = toPoint;
            }break;
            case ANIMATIONSTYLEMOVECENTERANDCHANGESIZE:{
                _animationView.center = toPoint;
                _animationView.bounds = toRect;
            }break;
            case ANIMATIONSTYLEMOVEPATH:{
                for(ZZH_AnimationView *toView in _AnimationViewArray){
                    toView.view.center = toView.toPoint;
                    NSLog(@"toView.point --- %f",toView.toPoint.y);
                }
                [_AnimationViewArray removeAllObjects];
            }
            default:
                break;
        }
    } else {
        NSLog(@"动画被打断");
    }
}






@end
