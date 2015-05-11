//
//  AboutMeViewController.m
//  SideMenu
//
//  Created by NiYao on 15/4/22.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#import "AboutMeViewController.h"
#import "User.h"
#import "ViewController.h"
#import "MiddleViewController.h"

@interface AboutMeViewController ()

@end

@implementation AboutMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"about me:%@", self.navigationController);
    NSLog(@"about me:%@", [self.navigationController viewControllers]);
    //self.view setBackgroundColor:[UIColor colorWithRed:<#(CGFloat)#> green:<#(CGFloat)#> blue:<#(CGFloat)#> alpha:<#(CGFloat)#>]
    [self.view setBackgroundColor:[UIColor colorWithRed:254.0/255.0 green:46.0/255.0 blue:100.0/255.0 alpha:1.0]];//254,46,100;250,88,130
    NSURL *url = [NSURL URLWithString:@"http://nycode.sinaapp.com/d.php"];
    NSError *error = nil;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backBtn.frame = CGRectMake(10, 20, 100, 45);
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backBtn setTitle:@"Back" forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
    [backBtn addTarget:self action:@selector(backToMidView:) forControlEvents:UIControlEventTouchUpInside];
    
   // NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"appliction/json;charset=UTF-8" forHTTPHeaderField:@"content-type"];
    NSURLResponse *urlResponse;
    NSData *responseData;
    responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    if (responseData != nil) {
        NSDictionary *userDic = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
        
        NSLog(@"%@", userDic);
        NSLog(@"%@", [userDic objectForKey:@"name"]);
        
        self.user1 = [[User alloc] init];
        self.user1.name = [userDic objectForKey:@"name"];
        self.user1.age = [userDic objectForKey:@"age"];
        self.user1.gender = [userDic objectForKey:@"gender"];
        UILabel *userName = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, 100, 45)];
        userName.text = self.user1.name;
        UILabel *userAge = [[UILabel alloc] initWithFrame:CGRectMake(20, 110, 100, 45)];
        userAge.text = [NSString stringWithFormat:@"%@", self.user1.age];
        UILabel *userGender =[[UILabel alloc] initWithFrame:CGRectMake(20, 160, 100, 45)];
        userGender.text = [NSString stringWithFormat:@"%@", self.user1.gender];
        
        [self.view addSubview:userName];
        [self.view addSubview:userAge];
        [self.view addSubview:userGender];
        
        NSLog(@"%@", self.user1);
    } else {
        if (error != nil) {
            NSLog(@"Error description = %@", [error description]);
        }
    }
    
    NSLog(@"aboutme: %@", self.navigationController);
    NSLog(@"aboutme stack: %@", [self.navigationController viewControllers]);
    
//    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL  URLWithString:@"http://waterservices.usgs.gov/nwis/iv/?sites=%@&period=PT%@luH&format=json", guageID, hours]];
//    [request setHTTPMethod:@"GET"];
//    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"content-type"];
//    NSError *err;
//    NSURLResponse *response;
//    NSData *responseData = [NSURLConnection sendSynchronousRequest:request   returningResponse:&response error:&err];
//    if (responseData != nil)
//    {
//        NSDictionary *jsonArray = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error: &err];
//    }
//    else
//    {
//        if (error != nil)
//        {
//            NSLog(@"Error description=%@", [err description]);
//        }
//    }
}

- (void)backToMidView:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
