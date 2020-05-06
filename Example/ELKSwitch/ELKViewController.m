//
//  ELKViewController.m
//  ELKSwitch
//
//  Created by MoZhuXuanKe on 05/06/2020.
//  Copyright (c) 2020 MoZhuXuanKe. All rights reserved.
//

#import "ELKViewController.h"
#import <ELKSwitch/ELKSwitch.h>


@interface ELKViewController ()
@property (nonatomic, strong) ELKSwitch *elk_switch;
@end

@implementation ELKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.elk_switch];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ELKSwitch *)elk_switch
{
    return _elk_switch ?: ({
        _elk_switch = [[ELKSwitch alloc] initWithFrame:CGRectMake((ELKScreenWidth - 18)/2, ELK_NavBarHeight, 28, 18) withGap:2 statusChange:^(BOOL OnStatus) {
            
            if (OnStatus) {
                NSLog(@"点击了选中");
                 
            }else{
                 NSLog(@"取消了选中");
                 
            }
           
        }];
//        [_elk_switch setElkSwitchBackgroundColor_On:UIColor.grayColor];
        _elk_switch;
    });
}
@end
