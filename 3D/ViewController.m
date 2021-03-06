//
//  ViewController.m
//  3D
//
//  Created by 薛坤龙 on 15/10/30.
//  Copyright © 2015年 薛坤龙. All rights reserved.
//

#import "ViewController.h"
#import "SareViewController.h"
#import "DetailViewController.h"
#import "Masonry.h"
#import "SetTableViewFoot.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIViewControllerPreviewingDelegate>

@property (nonatomic,strong) UITableView *mainTableView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"3D";
    self.tabBarItem.title = @"列表";
    [self loadNaviBar];
    [self.view addSubview:self.mainTableView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    if(self.dataArray.count>0)
    {
        [self.dataArray removeAllObjects];
    }
    
    for (int i = 0; i<20; i++)
    {
         [self.dataArray addObject:[NSString stringWithFormat:@"3D%d",i]];
    }

    [self.mainTableView reloadData];
    
    //支持判断
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        NSLog(@"你的手机支持3D Touch!");
        //通过 registerForPreviewingWithDelegate 方法，将当前 viewcontroller 增加预览功能 sourceView要设置成自己的tableview
        [self registerForPreviewingWithDelegate:(id)self sourceView:self.mainTableView];
    }else
    {
        NSLog(@"你的手机暂不支持3D Touch!");
    }
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

    __weak typeof(self) weakSelf = self;
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.edges.equalTo(weakSelf.view);
        make.width.equalTo(weakSelf.view.mas_width);
    }];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];

}

#pragma mark TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger row = [self.dataArray count];
    return row;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifier =  @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell ==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController * detailViewController = [[DetailViewController alloc] init];
    detailViewController.maintitle = [self.dataArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - 3D Touch Delegate
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    NSIndexPath *index = [self.mainTableView indexPathForRowAtPoint:location];
    //获取当前选择的表单元格
    UITableViewCell *cell = [self.mainTableView cellForRowAtIndexPath:index];
    
    if(cell != nil )
    {
        
        //防止重复加入
        if ([self.presentedViewController isKindOfClass:[DetailViewController class]])
        {
            return nil;
        }
        else
        {
            DetailViewController *detailViewController = [[DetailViewController alloc] init];
            detailViewController.maintitle = [self.dataArray objectAtIndex:index.row];
            detailViewController.preferredContentSize =(CGSize){0, 0};
            previewingContext.sourceRect = cell.frame;
            return detailViewController;
        }
    }
    return nil;
}

-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
   
    [self showViewController:viewControllerToCommit sender:self];

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

-(UITableView *)mainTableView
{
    if (!_mainTableView)
    {
        _mainTableView = [[UITableView alloc] init];
        _mainTableView.dataSource = self;
        _mainTableView.delegate = self;
        [SetTableViewFoot setExtraCellLineHidden:_mainTableView];
    }
    return _mainTableView;
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = [[NSMutableArray alloc] init];
    }

    return _dataArray;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
