//
//  OneViewController.m
//  3D
//
//  Created by 薛坤龙 on 15/10/30.
//  Copyright © 2015年 薛坤龙. All rights reserved.
//

#import "OneViewController.h"
#import "CompossViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"One";
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadNaviBar];
}

- (void) loadNaviBar
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"跳转" style:UIBarButtonItemStylePlain target:self action:@selector(clickAdd:)];
}

- (void) clickAdd:(id)sender
{
    CompossViewController *plistAddViewController = [[CompossViewController alloc] init];
    [self.navigationController pushViewController:plistAddViewController animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
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
