//
//  ViewController.m
//  HZL猫头鹰
//
//  Created by 黄梓伦 on 3/15/16.
//  Copyright © 2016 黄梓伦. All rights reserved.
//

#import "ViewController.h"
#import "HZLTextField.h"
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define ScreenW [UIScreen mainScreen].bounds.size.width

#define owl_tag 101

#define button_tag 102
@interface ViewController ()<UITextFieldDelegate>
{
    UIImageView *left;
    UIImageView *right;
    UIImageView *hand1;
    UIImageView *hand2;
    NSTimer *_timer;
    UIView *subview;
    UIImageView *owl;
    UIButton *button;
    HZLTextField *text1;
    HZLTextField *text2;
    CGFloat margin;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
    
    
}
#pragma mark--creatUI--
-(void)creatUI
{
    //添加背景
    UIImageView *background = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    background.image = [UIImage imageNamed:@"3.jpg"];
    [self.view addSubview:background];
    //添加猫头鹰
    owl = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 250, 180)];
    owl.image = [UIImage imageNamed:@"header"];
    owl.center = CGPointMake(self.view.center.x, self.view.center.y-100);
    [self.view addSubview:owl];
    
    
    
    //添加输入框
    margin = 20;
    subview = [[UIView alloc] initWithFrame:CGRectMake(20, owl.frame.origin.y+165, ScreenW-20*2, 4*margin+25)];
    [self.view addSubview:subview];
    [subview setBackgroundColor:[UIColor whiteColor]];
    
    
    text1 = [[HZLTextField alloc] initWithFrame:CGRectMake(margin, margin, subview.frame.size.width-2*margin, margin+10)];
    text1.borderStyle = UITextBorderStyleRoundedRect;
    text2 = [[HZLTextField alloc] initWithFrame:CGRectMake(margin, margin+text1.frame.size.height+5, subview.frame.size.width-2*margin, margin+10)];
    text1.delegate = self;
    text2.delegate = self;
    [text1 setPlaceholder:@"请输入账号"];
    [text2 setPlaceholder:@"请输入密码"];
    text2.borderStyle = UITextBorderStyleRoundedRect;
    text2.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [subview addSubview:text1];
    [subview addSubview:text2];
    
    //设置左视图
    UIImageView * user = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 80, 80)];
    user.image = [UIImage imageNamed:@"user"];
    text1.leftView = user;
    [text1 setLeftViewMode:UITextFieldViewModeAlways];
    UIImageView * pass = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 80, 80)];
    pass.image = [UIImage imageNamed:@"pass"];
    text2.leftView = pass;
    [text2 setLeftViewMode:UITextFieldViewModeAlways];
    text2.secureTextEntry = YES;
    //添加hand
    hand1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hand"]];
    [hand1 setTransform:CGAffineTransformMakeScale(0.2, 0.2)];
    [hand1 setCenter:CGPointMake(2*margin+2, 0)];
    [subview addSubview:hand1];
    hand2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hand"]];
    [hand2 setTransform:CGAffineTransformMakeScale(0.2, 0.2)];
    [hand2 setCenter:CGPointMake(subview.frame.size.width-hand1.center.x, 0)];
    [subview addSubview:hand2];
    //添加登录
    button = [[UIButton alloc] initWithFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y+subview.frame.size.height+margin, subview.frame.size.width, 40)];
    button.backgroundColor = [UIColor orangeColor];
    button.alpha = 0.5;
    
    [button setTitle:@"登   录" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    
    
    
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(text2.isEditing)
    {
        
        
        
        left = [[UIImageView alloc] initWithFrame:CGRectMake(owl.center.x-55, owl.center.y+60, 50, 50)];
        left.image = [UIImage imageNamed:@"left"];
        [left setTransform:CGAffineTransformMakeScale(1, 2.5)];
        [self.view addSubview:left];
        [self.view insertSubview:left belowSubview:subview];
        right = [[UIImageView alloc] initWithFrame:CGRectMake(owl.center.x+15, owl.center.y+60, 50, 50)];
        right.image = [UIImage imageNamed:@"right"];
        [right setTransform:CGAffineTransformMakeScale(1, 2.5)];
        [self.view addSubview:right];
        [self.view insertSubview:right belowSubview:subview];
        [UIView animateWithDuration:0.1 animations:^{
            hand1.alpha = 0;
            hand2.alpha =0;
        }];
        
    }
    if (text1.isEditing) {
        [hand1 setCenter:CGPointMake(2*margin+2, 0)];
        [hand2 setCenter:CGPointMake(subview.frame.size.width-hand1.center.x, 0)];
        
        [UIView animateWithDuration:0.1 animations:^{
            
            
            left.frame = CGRectMake(owl.center.x-55, owl.center.y+100, 50, 50);
            right.frame = CGRectMake(owl.center.x+15, owl.center.y+100, 50, 50);
            left.alpha = 0;
            right.alpha = 0;
        }];
        hand1.alpha = 1;
        hand2.alpha =1;
    }
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    
    
    [owl setCenter:CGPointMake(self.view.center.x, self.view.center.y-200)];
    [subview setFrame:CGRectMake(20, owl.frame.origin.y+165, ScreenW-20*2, 105)];
    [button setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y+subview.frame.size.height+20, subview.frame.size.width, 40)];
    
    //   _timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(action1) userInfo:nil repeats:NO];
    
    return YES;
}
//-(void)action1
//{
//
//    hand1.center = CGPointMake(42, 20);
//    hand2.center = CGPointMake(subview.frame.size.width-hand1.center.x, 20);
//    hand1.alpha = 0;
//    hand2.alpha = 0;
//}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    
    if (text1.isFirstResponder) {
        [text1 resignFirstResponder];
    }else if(text2.isFirstResponder)
    {
        [text2 resignFirstResponder];
    }
    
    [owl setCenter:CGPointMake(self.view.center.x, self.view.center.y-100)];
    [subview setFrame:CGRectMake(20, owl.frame.origin.y+165, ScreenW-20*2, 105)];
    [button setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y+subview.frame.size.height+20
                                , subview.frame.size.width, 40)];
    [hand1 setCenter:CGPointMake(2*margin+2, 0)];
    [hand2 setCenter:CGPointMake(subview.frame.size.width-hand1.center.x, 0)];
    hand1.alpha = 1;
    hand2.alpha =1;
    left.alpha = 0 ;
    right.alpha = 0;
    return YES;
}


@end