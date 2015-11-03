//
//  OneViewController.m
//  3D
//
//  Created by 薛坤龙 on 15/10/30.
//  Copyright © 2015年 薛坤龙. All rights reserved.
//

#import "OneViewController.h"
#import "CompossViewController.h"
#import "Masonry.h"
#import "PeekViewController.h"

@interface OneViewController ()<UIViewControllerPreviewingDelegate>


@property (nonatomic,strong) UILabel *peekLabel;


@end

@implementation OneViewController

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"单独的一个3D";
    self.tabBarItem.title = @"设置";
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadNaviBar];
    
    [self.view addSubview:self.peekLabel];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self check3DTouch];
    
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection
{
    [self check3DTouch];
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    __weak typeof(self) weakSelf = self;
    
    [self.peekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.view.mas_top).offset(80);
        make.centerX.equalTo(weakSelf.view.mas_centerX);
        make.width.equalTo(@(100));
        make.height.equalTo(@(46));
        
    }];

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired = 1;
    [tap addTarget:self action:@selector(imageTap:)];
    [self.peekLabel addGestureRecognizer:tap];
}

#pragma mark - Delegate
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    //防止重复加入
    if ([self.presentedViewController isKindOfClass:[PeekViewController class]])
    {
        return nil;
    }
    else
    {
        PeekViewController *peekViewController = [[PeekViewController alloc] init];
        return peekViewController;
    }
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self showViewController:viewControllerToCommit sender:self];
}

#pragma mark - event response
- (void)check3DTouch
{
    // 如果开启了3D touch
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        [self registerForPreviewingWithDelegate:(id)self sourceView:self.peekLabel];
    }
}

- (void)loadNaviBar
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"跳转" style:UIBarButtonItemStylePlain target:self action:@selector(clickAdd:)];
}

- (void)clickAdd:(id)sender
{
    CompossViewController *plistAddViewController = [[CompossViewController alloc] init];
    [self.navigationController pushViewController:plistAddViewController animated:YES];
}

-(void)imageTap:(id)sender
{
    PeekViewController *peekViewController = [[PeekViewController alloc] init];
    [self.navigationController pushViewController:peekViewController animated:YES];
    
}


#pragma mark - getters and setters

-(UILabel *)peekLabel
{
    if (!_peekLabel)
    {
        _peekLabel = [[UILabel alloc] init];
        _peekLabel.textAlignment = NSTextAlignmentCenter;
        _peekLabel.backgroundColor = [UIColor orangeColor];
        _peekLabel.userInteractionEnabled = YES;
        _peekLabel.text = @"Peek";
    }
    return _peekLabel;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
