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

@property (nonatomic)  CGFloat tableOffsetHight;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"3D";
    [self loadNaviBar];
    [self.view addSubview:self.mainTableView];
    
    //支持判断
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
         NSLog(@"你的手机支持3D Touch!");
        
        //通过 registerForPreviewingWithDelegate 方法，将当前 viewcontroller 增加预览功能
         [self registerForPreviewingWithDelegate:(id)self sourceView:self.view];
        
    }else
    {
        NSLog(@"你的手机暂不支持3D Touch!");
    }
    

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    if(self.dataArray.count>0)
    {
        [self.dataArray removeAllObjects];
    }
    
    [self.dataArray addObject:@"3D0"];
    [self.dataArray addObject:@"3D1"];
    [self.dataArray addObject:@"3D2"];
    [self.dataArray addObject:@"3D3"];
    [self.dataArray addObject:@"3D4"];
    [self.dataArray addObject:@"3D5"];
    [self.dataArray addObject:@"3D6"];
    [self.dataArray addObject:@"3D7"];
    [self.dataArray addObject:@"3D8"];
    [self.dataArray addObject:@"3D9"];
    [self.dataArray addObject:@"3D10"];
    [self.dataArray addObject:@"3D11"];
    [self.dataArray addObject:@"3D12"];
    [self.dataArray addObject:@"3D13"];
    [self.dataArray addObject:@"3D14"];
    
    _tableOffsetHight = 0.0;
    
    [self.mainTableView reloadData];
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

    __weak typeof(self) weakSelf = self;
    
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make)
    {
//        make.edges.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view.mas_top).offset(69);
        make.left.equalTo(weakSelf.view.mas_left);
        make.right.equalTo(weakSelf.view.mas_right);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-49);
        make.width.equalTo(weakSelf.view.mas_width);
    }];


}

#pragma mark TableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
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
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");
    NSLog(@"%f",scrollView.contentOffset.y);
    _tableOffsetHight = scrollView.contentOffset.y;
}

#pragma mark - 3D Touch Delegate
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    CGPoint  newLocation = CGPointMake(location.x, _tableOffsetHight+location.y-69);
    NSIndexPath *index = [self.mainTableView indexPathForRowAtPoint:newLocation];
    //获取当前选择的表单元格
    UITableViewCell *cell = [self.mainTableView cellForRowAtIndexPath:index];
    
    if(cell != nil )
    {
        DetailViewController *detailViewController = [[DetailViewController alloc] init];
        detailViewController.maintitle = [self.dataArray objectAtIndex:index.row];
        //预览窗口只截取详情视频 detailViewController 的上半部分，高度设置为 240
        detailViewController.preferredContentSize =(CGSize){0, 240};
        //除了这个单元格，需要模糊其它位置
        previewingContext.sourceRect = cell.frame;
        
        return detailViewController;
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
