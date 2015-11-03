//
//  PeekViewController.m
//  3D
//
//  Created by 薛坤龙 on 15/11/3.
//  Copyright © 2015年 薛坤龙. All rights reserved.
//

#import "PeekViewController.h"
#import "Masonry.h"

@interface PeekViewController ()

@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation PeekViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = @"Peek";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.imageView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews
{
    __weak typeof(self) weakSelf = self;
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.view.mas_top).offset(100);
        make.right.equalTo(weakSelf.view.mas_right);
        make.left.equalTo(weakSelf.view.mas_left);
        make.height.equalTo(@(415));
    }];
    

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

#pragma mark - Preview Actions

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    
    // 生成UIPreviewAction
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Action 1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Action 1 selected");
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"Action 2" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Action 2 selected");
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"Action 3" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Action 3 selected");
    }];
    
    UIPreviewAction *tap1 = [UIPreviewAction actionWithTitle:@"tap 1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"tap 1 selected");
    }];
    
    UIPreviewAction *tap2 = [UIPreviewAction actionWithTitle:@"tap 2" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"tap 2 selected");
    }];
    
    UIPreviewAction *tap3 = [UIPreviewAction actionWithTitle:@"tap 3" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"tap 3 selected");
    }];
    
    // 赛到UIPreviewActionGroup中
    NSArray *actions = @[action1, action2, action3];
    NSArray *taps = @[tap1, tap2, tap3];
    UIPreviewActionGroup *group1 = [UIPreviewActionGroup actionGroupWithTitle:@"Action Group" style:UIPreviewActionStyleDefault actions:actions];
    UIPreviewActionGroup *group2 = [UIPreviewActionGroup actionGroupWithTitle:@"Tap Group" style:UIPreviewActionStyleDefault actions:taps];
    NSArray *group = @[group1,group2];
    
    return group;
}



-(UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"top"];
    }
    return _imageView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}


@end
