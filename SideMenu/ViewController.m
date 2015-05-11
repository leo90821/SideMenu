//
//  ViewController.m
//  SideMenu
//
//  Created by NiYao on 15/4/20.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import "ViewController.h"
#import "DefinatonsHeader.h"
#import "LeftMenuViewController.h"
#import "RightMenuViewController.h"
#import "MiddleViewController.h"
#import "AboutMeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //menu buttons
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    leftButton.frame = CGRectMake(0, 30, 100, 45);
    [leftButton setTitle:@"Left Menu" forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(didClickLeftMenuButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rightButton.frame = CGRectMake(ScreenWidth - 110, 30, 100, 45);
    [rightButton setTitle:@"Right Menu" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(didClickRightMenuButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.midView.view addSubview:leftButton];
    [self.midView.view addSubview:rightButton];
    
        //test btn
//    UIButton *test = [UIButton buttonWithType:UIButtonTypeSystem];
//    test.frame = CGRectMake(ScreenWidth - 110, 130, 100, 45);
//    [test setTitle:@"About me" forState:UIControlStateNormal];
//    [test setBackgroundColor:[UIColor blueColor]];
//    [test addTarget:self action:@selector(didClickShowMeButton:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:test];
//    
    //
    //add child controllers and subviews to views controller
    //attention : middle view must add at last
    //notice : must import view controller header files
//    if (self.rightMenu == nil) {
//        self.rightMenu = [[RightMenuViewController alloc] init];
//    }
//    if (self.leftMenu == nil) {
//        self.leftMenu = [[LeftMenuViewController alloc] init];
////    }
    //menu views
    [self addChildViewController:self.rightMenu];
    [self.view addSubview:self.rightMenu.view];//bottom view
    
    [self addChildViewController:self.leftMenu];//middle view
    [self.view addSubview:self.leftMenu.view];
   
    [self addChildViewController:self.midView];//top view
    [self.view addSubview:self.midView.view];

    NSLog(@"views:%@", self.navigationController);
    NSLog(@"views:%@", [self.navigationController viewControllers]);
    self.navigationController.navigationBarHidden = YES;
}

- (void)didClickShowMeButton:(id)sender {
    AboutMeViewController *me = [[AboutMeViewController alloc] init];
    [self.navigationController pushViewController:me animated:YES];
    NSLog(@"views:%@", self.navigationController);
    NSLog(@"views:%@", [self.navigationController viewControllers]);
    NSLog(@"btn click");
}


- (void)didClickLeftMenuButton:(id)sender {
    if (self.midView.view.frame.origin.x == 0) {
        [UIView animateWithDuration:0.2 animations:^{
            self.leftMenu.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
            self.midView.view.frame = CGRectMake(MenuWidth, 65, ScreenWidth, ScreenHeight - 65*2);
            
        } completion:^(BOOL finished){}];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            self.midView.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
            self.leftMenu.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        }];
    }
}

- (void)didClickRightMenuButton:(id)sender {
    if (self.midView.view.frame.origin.x == 0) {
        [UIView animateWithDuration:0.2 animations:^{
            self.rightMenu.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
            self.midView.view.frame = CGRectMake(-MenuWidth, 0, ScreenWidth, ScreenHeight);
            self.leftMenu.view.frame = CGRectMake(-ScreenWidth, 0, ScreenWidth, ScreenHeight);//reson : left cover right
        } completion:^(BOOL finished){
            //NSLog(@"rightMenu Animation Complete");
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            self.midView.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
            self.rightMenu.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
            self.leftMenu.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        } completion:^(BOOL finished){
            //NSLog(@"Middle View Animation Complete");
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
