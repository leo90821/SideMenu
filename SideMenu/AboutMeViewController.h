//
//  AboutMeViewController.h
//  SideMenu
//
//  Created by NiYao on 15/4/22.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class User;

@interface AboutMeViewController : UIViewController

@property (strong, nonatomic) User *user1;

- (void)backToMidView:(id)sender;

@end
