//
//  ZZH_JumpButton.h
//  AnimationButton
//
//  Created by M-SJ077 on 2016/12/1.
//  Copyright © 2016年 zhangzhihua. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZZH_JUMPBUTTONDELEGATE <NSObject>

@optional
-(void)jumpClick:(NSInteger)ClickIndex;

@end

@interface ZZH_JumpButton : UIButton

@property (nonatomic , assign)id<ZZH_JUMPBUTTONDELEGATE>delegate;



@end
