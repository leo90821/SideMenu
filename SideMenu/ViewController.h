//
//  ViewController.h
//  SideMenu
//
//  Created by NiYao on 15/4/20.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LeftMenuViewController;
@class RightMenuViewController;
@class MiddleViewController;

@interface ViewController : UIViewController

@property (strong, nonatomic) LeftMenuViewController *leftMenu;
@property (strong, nonatomic) RightMenuViewController *rightMenu;
@property (strong, nonatomic) MiddleViewController *midView;

- (void)didClickLeftMenuButton:(id)sender;
- (void)didClickRightMenuButton:(id)sender;

@end

