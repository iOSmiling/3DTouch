//
//  DetailViewController.m
//  3D
//
//  Created by 薛坤龙 on 15/11/2.
//  Copyright © 2015年 薛坤龙. All rights reserved.
//

#import "DetailViewController.h"
#import "Masonry.h"

@interface DetailViewController ()

@property (nonatomic,strong) UILabel *mainLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.mainLabel];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    NSLog(@"%@",self.maintitle);
    
    self.mainLabel.text = self.maintitle;

}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    __weak typeof(self) weakSelf = self;
    
    [self.mainLabel mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerX.equalTo(weakSelf.view.mas_centerX);
         make.top.equalTo(@(80));
         make.width.equalTo(@(100));
         make.height.equalTo(@(46));
        
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UILabel *)mainLabel
{
    if (!_mainLabel)
    {
        _mainLabel = [[UILabel alloc] init];
        _mainLabel.textAlignment = NSTextAlignmentCenter;
        _mainLabel.textColor = [UIColor blueColor];
    }
    return _mainLabel;
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
