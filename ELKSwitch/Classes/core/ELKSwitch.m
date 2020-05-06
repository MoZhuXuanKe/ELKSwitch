//
//  ELKSwitch.m
//  FontWedgitExtention
//
//  Created by wx on 2019/9/27.
//  Copyright © 2019 wx. All rights reserved.
//

#import "ELKSwitch.h"
#import "UIImage+ELKOriSensitive.h"

@implementation ELKSwitch

- (id)initWithFrame:(CGRect)frame withGap:(CGFloat)gap{
    return [self initWithFrame:frame withGap:gap statusChange:nil];
}

- (id)initWithFrame:(CGRect)frame withGap:(CGFloat)gap statusChange:(nullable MyBlock)block{
    self = [super initWithFrame:frame];
    
    if(self){
        _myBlock = block;
        
        //默认选中On状态
        _OnStatus = NO;
        _Gap = gap;
        _Width = frame.size.width;
        _Height = frame.size.height;
        _CircleR = (_Height-2*_Gap)/2;
        _MidHeight = _CircleR*2 > 4 ? _CircleR*2 - 4: _CircleR*2/3;
        self.backgroundColor = [UIColor clearColor];
        
        
       
      
        
        
        //设置背景
        UIImageViewBack = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _Width, _Height)];
        UIImageViewBack.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubview:UIImageViewBack];
        
        //设置 中间View
        UIImageViewMiddle = [[UIImageView alloc]initWithFrame:CGRectMake(_Gap, (_Height - _MidHeight)/2 , _Width - 2*_Gap, _MidHeight)];
        UIImageViewMiddle.backgroundColor = [UIColor yellowColor];
        [self setMiddleLineImage:[UIImage imageWithColor:[UIColor lightGrayColor]]];
        UIImageViewMiddle.hidden = YES;
        [self addSubview:UIImageViewMiddle];
        
        //设置 滑块图片
        UIImageViewBlock = [[UIImageView alloc]initWithFrame:CGRectMake(_Gap, _Gap, 2*_CircleR, 2*_CircleR)];
        UIImageViewBlock.backgroundColor = [UIColor whiteColor];
        [self setLeftBlockImage:[UIImage imageWithColor:[UIColor whiteColor]]];
        [self setRightBlockImage:[UIImage imageWithColor:[UIColor whiteColor]]];
        [self addSubview:UIImageViewBlock];
        [self isCornerRadius];
        
        self.userInteractionEnabled = YES;
        //创建手势对象
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:tap];
    }
    
    return self;
}

//是否显示中间的横线view
- (void)setIsHiddenUIImageViewMiddle:(BOOL)isHiddenUIImageViewMiddle
{
    _isHiddenUIImageViewMiddle = isHiddenUIImageViewMiddle;
    UIImageViewMiddle.hidden = isHiddenUIImageViewMiddle;
}
//设置默认状态
- (void)setOnStatus:(BOOL)OnStatus
{
    _OnStatus = OnStatus;
    if (OnStatus) {
        //默认打开时
        UIImageViewMiddle.frame = CGRectMake(_Width-_Height+_Gap, _Gap, 2*_CircleR, 2*_CircleR);
    }else{
        //默认关闭
        UIImageViewMiddle.frame = CGRectMake(_Gap, (_Height - _MidHeight)/2 , _Width - 2*_Gap, _MidHeight);
    }
}

-(void)tapAction:(UITapGestureRecognizer *)tap
{
    
    //图片切换
    if(_OnStatus){
        _OnStatus=NO;
        //滑块关闭动画
        CABasicAnimation * ani = [CABasicAnimation animationWithKeyPath:@"position"];
        ani.toValue = [NSValue valueWithCGPoint:CGPointMake(_CircleR+_Gap, _CircleR+_Gap)];
        ani.removedOnCompletion = NO;
        ani.fillMode = kCAFillModeForwards;
        ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [UIImageViewBlock.layer addAnimation:ani forKey:@"PostionToLeft"];
        
        if(UIImageSliderLeft){
            UIImageViewBlock.image=UIImageSliderLeft;
        }else{
            UIImageViewBlock.backgroundColor = [UIColor whiteColor];
        }
        
        if(UIImageBack_Off){
            UIImageViewBack.image = UIImageBack_Off;
        }else{
            UIImageViewBack.image = [UIImage imageWithColor:[UIColor lightGrayColor]];
        }
        
    }else{
        _OnStatus=YES;
        //滑块打开动画
        CABasicAnimation * ani = [CABasicAnimation animationWithKeyPath:@"position"];
        ani.toValue = [NSValue valueWithCGPoint:CGPointMake(_Width-_CircleR-_Gap, _CircleR+_Gap)];
        ani.removedOnCompletion = NO;
        ani.fillMode = kCAFillModeForwards;
        ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [UIImageViewBlock.layer addAnimation:ani forKey:@"PostionToRight"];
        
        if(UIImageSliderRight){
            UIImageViewBlock.image = UIImageSliderRight;
        }else{
            UIImageViewBlock.backgroundColor=[UIColor whiteColor];
        }
        if(UIImageBack_On){
            UIImageViewBack.image = UIImageBack_On;
        }else{
            UIImageViewBack.image = [UIImage imageWithColor:[UIColor greenColor]];
        }
    }
    if(_myBlock) _myBlock(_OnStatus);
    [_delegate onStatusDelegate];
}

//设置背景图片
-(void)setBackgroundImage_On:(UIImage *)image{

    UIImageBack_On = image;
}

-(void)setBackgroundImage_Off:(UIImage *)image{
    UIImageBack_Off = image;
}


//设置左滑块图片
-(void)setLeftBlockImage:(UIImage *)image{
    UIImageViewBlock.backgroundColor=[UIColor clearColor];
    UIImageSliderLeft=image;
    UIImageViewBlock.image=image;
}

//设置右滑块图片
-(void)setRightBlockImage:(UIImage *)image{
    UIImageViewBlock.backgroundColor = [UIColor clearColor];
    UIImageSliderRight = image;
    UIImageViewBlock.image = image;
    
}

//设置中间横线View
-(void)setMiddleLineImage:(UIImage *)image
{
    UIImageViewMiddle.backgroundColor=[UIColor clearColor];
    UIImageMiddle=image;
    UIImageViewMiddle.image=image;
}

//设置背景图片
-(void)setElkSwitchBackgroundColor_On:(UIColor *)color{
    if (color) {
          [self setBackgroundImage_On:[UIImage imageWithColor:color]];
    }
}

//设置背景图片
-(void)setElkSwitchBackgroundColor_Off:(UIColor *)color{
    if (color) {
          [self setBackgroundImage_Off:[UIImage imageWithColor:color]];
    }
}


//设置左滑块图片
-(void)setLeftBlockColor:(UIColor *)color{
    if (color) {
        [self setLeftBlockImage:[UIImage imageWithColor:color]];
    }
}

//设置右滑块图片
-(void)setRightBlockColor:(UIColor *)color{
    if (color) {
        [self setRightBlockImage:[UIImage imageWithColor:color]];
    }
}

//设置中间横线View
-(void)setMiddleLineColor:(UIColor *)color
{
    if (color) {
        [self setMiddleLineImage:[UIImage imageWithColor:color]];
    }
}

//设置圆角裁剪
- (void)isCornerRadius
{
    UIImageViewBack.layer.cornerRadius = _Height/2;
    UIImageViewBlock.layer.cornerRadius = _CircleR;
    UIImageViewMiddle.layer.cornerRadius =  _MidHeight/2;
    UIImageViewBack.clipsToBounds = YES;
    UIImageViewBlock.clipsToBounds = YES;
    UIImageViewMiddle.clipsToBounds = YES;
}
@end
