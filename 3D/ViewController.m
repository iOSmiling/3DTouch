//
//  ViewController.m
//  3D
//
//  Created by 薛坤龙 on 15/10/30.
//  Copyright © 2015年 薛坤龙. All rights reserved.
//

#import "ViewController.h"
#import "SareViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"3D";
    [self loadNaviBar];
    
    //支持判断
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        NSLog(@"你的手机支持3D Touch!");
        
    }else
    {
        NSLog(@"你的手机暂不支持3D Touch!");
    }
    
    
}

- (void) loadNaviBar
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"跳转" style:UIBarButtonItemStylePlain target:self action:@selector(clickAdd:)];
}

- (void) clickAdd:(id)sender
{
     SareViewController *plistAddViewController = [[SareViewController alloc] init];
    [self.navigationController pushViewController:plistAddViewController animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
