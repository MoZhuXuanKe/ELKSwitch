//
//  ELKSwitch.h
//  FontWedgitExtention
//
//  Created by wx on 2019/9/27.
//  Copyright © 2019 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^MyBlock) (BOOL OnStatus);

@protocol MySwitchDelegate

- (void)onStatusDelegate;

@end

@interface ELKSwitch : UIView
{
    //背景View 滑块View 中间的横向view
    UIImageView *UIImageViewBack,*UIImageViewBlock,*UIImageViewMiddle;
    //打开状态背景图片  关闭状态背景图 滑块右图片 滑块左图片 中间的横向view图片
    UIImage     *UIImageBack_On,*UIImageBack_Off,*UIImageSliderRight,*UIImageSliderLeft,*UIImageMiddle;
}

//Switch 返回开关量block
@property (nonatomic,copy) MyBlock myBlock;

//Switch 返回开关量delegate
@property (nonatomic) id delegate;

//Switch 开关状态
@property (nonatomic) BOOL OnStatus;

//Switch 长 宽 滑块半径
@property (nonatomic) CGFloat Width,Height,CircleR,MidHeight;

//滑块距离边框边距
@property (nonatomic) CGFloat Gap;

//是否隐藏中间View
@property (nonatomic) BOOL isHiddenUIImageViewMiddle;


/*  带有block 初始化
 *  @param frame
 *  @param gap  滑块距离边框的距离
 *  @param block
 *
 */
- (id)initWithFrame:(CGRect)frame withGap:(CGFloat)gap statusChange:(nullable MyBlock)block;

/*  初始化
 *  @param frame
 *  @param gap  滑块距离边框的距离
 *
 */
- (id)initWithFrame:(CGRect)frame withGap:(CGFloat)gap;

//设置背景图片 打开状态时
-(void)setBackgroundImage_On:(UIImage *)image;

//设置背景图片 关闭状态时
-(void)setBackgroundImage_Off:(UIImage *)image;

//设置左滑块图片
-(void)setLeftBlockImage:(UIImage *)image;

//设置右滑块图片
-(void)setRightBlockImage:(UIImage *)image;

//设置中间横线View
-(void)setMiddleLineImage:(UIImage *)image;

//设置背景图片
-(void)setElkSwitchBackgroundColor_On:(UIColor *)color;
//设置背景图片
-(void)setElkSwitchBackgroundColor_Off:(UIColor *)color;

//设置左滑块图片
-(void)setLeftBlockColor:(UIColor *)color;

//设置右滑块图片
-(void)setRightBlockColor:(UIColor *)color;

//设置中间横线View
-(void)setMiddleLineColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
