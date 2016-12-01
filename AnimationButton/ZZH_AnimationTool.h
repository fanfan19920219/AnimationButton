//
//  ZZH_AnimationTool.h
//  ZZH_AnimationProject
//
//  Created by zhangzhihua on 16/6/2.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, ANIMATIONSTYLE) {
    /**
     *   移动中心
     */
    ANIMATIONSTYLEMOVECENTER,
    /**
     *   改变Size
     */
    ANIMATIONSTYLECHANGESIZE,
    /**
     *   移动中心并改变大小
     */
    ANIMATIONSTYLEMOVECENTERANDCHANGESIZE,
    /**
     *   多点路径
     */
    ANIMATIONSTYLEMOVEPATH,
};


@interface ZZH_AnimationTool : NSObject

@property (nonatomic , assign)ANIMATIONSTYLE status;

+(instancetype)Default;
/**
 *   参数      fromValue (起点)     toValue (终点)    moveView (执行动画的View)  duration (动画时间)
 */
-(void)setviewCenter_FromValue:(CGPoint)fromValue toValue:(CGPoint)toValue moveView:(UIView*)moveView Durationtime:(double)durationtime;
/**
 *   参数      fromeValue(初始Bounds)     toValue (结束Bounds)    moveView (执行动画的View)   durationtime (动画时间)
 */
-(void)setviewSize_FromValue:(CGRect)fromValue toValue:(CGRect)toValue moveView:(UIView*)moveView Durationtime:(double)durationtime;
/**
 *   参数      fromBounds (起始大小)     toBounds(终止大小)    fromeCenter(起始中心)  toCenter(终止中心)   moveView (执行动画View)  duration(动画时间)
 */
-(void)setviewSizeAndCenter_FromBounds:(CGRect)fromBounds toBounds:(CGRect)toBounds FromCenter:(CGPoint)fromeCenter toCenter:(CGPoint)toCenter moveView:(UIView*)moveView Durationtime:(double)durationtime;
/**
 *   参数      PointArray 移动的动画路径  moveView (执行动画View)  duration(动画时间)
 */
-(void)setviewCenter_WithPointArray:(NSMutableArray<NSValue *>*)PointArray moveView:(UIView*)moveView Durationtime:(double)durationtime;

@end
