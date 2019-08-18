//
//  HomeViewController.m
//  LottieDemo
//
//  Created by cqz on 2019/6/3.
//  Copyright © 2019 cqz. All rights reserved.
//

#import "HomeViewController.h"
#import "CDRadarView.h"

#import <Lottie/Lottie.h>
#import <pop/pop.h>

/// 屏幕宽度，会根据横竖屏的变化而变化
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)

/// 屏幕高度，会根据横竖屏的变化而变化
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define CDLOTTIEBUNDLE  [NSBundle bundleWithPath: [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"Lottie.bundle"]]

@interface HomeViewController ()

@property (nonatomic, strong) LOTAnimationView *animationView;

//手
@property (nonatomic, strong) UIImageView *handImgView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];

    [self.view addSubview:self.animationView];

//    __weak __typeof(self)weakSelf = self;
    [self.animationView playWithCompletion:^(BOOL animationFinished) {

        NSLog(@"动画结束了");
//        [weakSelf.animationView2 play];
    }];
    NSLog(@"动画时长： %.2f", self.animationView.sceneModel.timeDuration);
}

- (LOTAnimationView *)animationView {
    if (!_animationView) {
        // Camera/camera
        // Duck/duck
        // Balloon/balloon
        // Cat/siam
        // BirdFly/bird1
        // homeMessage/message
        // Ground/ground
        _animationView = [LOTAnimationView animationWithFilePath:[CDLOTTIEBUNDLE pathForResource:@"ReadGood/good" ofType:@"json"]];
//        _animationView = [[LOTAnimationView alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://cqz-1256838880.cos.ap-shanghai.myqcloud.com/bird1.json"]];
        [_animationView setLoopAnimation:true];
        _animationView.frame = CGRectMake(0, 88, 400, 400);
        _animationView.contentMode = UIViewContentModeScaleAspectFill;
        _animationView.backgroundColor = [UIColor whiteColor];
        _animationView.animationSpeed = 0.5;
    }
    return _animationView;
}

@end
