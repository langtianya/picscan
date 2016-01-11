//
//  MainTableViewController.m
//  picScan
//
//  Created by ocq on 14/8/28.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "MainTableViewController.h"

#import "UICheckBoxButton.h"
#import "RegViewController.h"
#import "LoginViewController.h"
#import "CustomIndexTableViewCell.h"
#import "CustomIndexTableCellBean.h"
#import "ViewControllerManager.h"
#import "PSCClickImageView.h"
#import "DemoTableHeaderView.h"
#import "DemoTableFooterView.h"
#import "NSString+Regular.h"


//@interface MainTableViewController ()
//NSInteger count;
//@end

@implementation MainTableViewController
{
    //UITouch
    // UIColor
    // NSTimer
    //    CGRect
    //    UIButton
    //    UIImage
    //    UIFont
    //
    //    NSSearchPathDirectory
    //    NSKeyedArchiver
    //    NSKeyedUnarchiver
    
//    NSObject
    //    NSDictionary
    //    NSMutableDictionary
    //    NSData
    //    NSMutableData
    //    NSArray
    //    NSMutableArray
    //    NSString
    //    NSMutableString
//    NSUserDefaults
//    NSURL
//    NSMutableURLRequest
//    NSXMLParser
//    NSXMLParserDelegate
    
}

//- (instancetype)initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:style];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
//     self.clearsSelectionOnViewWillAppear = NO;
    
   
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
   /*
   // 用户头像
    self.tableHeadIcon=[NSArray arrayWithObjects:@"wfsIcon.png",@"Default.png",@"home-icon-set.png",@"back-button-hover.png",nil];
     //用户名
    self.tableUsername=[NSArray arrayWithObjects:@"维富帅",@"喜富帅",@"权屌丝",@"xxx",nil];
     //用户状态
    self.tableUserStatus=[NSArray arrayWithObjects:@"我很有钱",@"我也很有钱",@"我是乞丐",@"xxx",nil];
     //用户等级
    self.tableUserCreditRank=[NSArray arrayWithObjects:@"5",@"4",@"3",@"2",nil];
     //正文文本
    self.tableMessageText=[NSArray arrayWithObjects:@"我真他妈的有钱，权屌丝赶紧过来，给你一万别烦我了",@"我也真他妈的有钱，权屌丝赶紧过来，给你一万别烦我了",@"谢谢两位富帅给我施舍点钱，非常感谢。另外今天捡到挺多垃圾瓶的",@"xxx",nil];
     //正文图片
    self.tableMessageImage1=[NSArray arrayWithObjects:@"login_backgroup2.jpg",@"login_backgroup2.jpg",@"laji.png",@"login_backgroup.jpeg",nil];
*/
    
   

    //另外创建一个bean
//    CustomIndexTableCellBean *wzw=[[CustomIndexTableCellBean alloc] init];
//    wzw.cellId=1;
//    wzw.headIcon=@"wfsIcon.png";
//    wzw.usernameLable=@"维富帅";
//    wzw.userStatus=@"我很有钱";
//    wzw.userCreditRank=@"5zhuanLeave.png";
//    wzw.messageText=@"我真他妈的有钱，权屌丝赶紧过来，给你一万别烦我了";
//    wzw.messageImage1=@"login_backgroup2.jpg";
    
    
    
    
    //在外围初始化好tablecell start 不可以行 不可以cell重用    owner:self必须为self
//   NSArray *nib=[[NSBundle mainBundle] loadNibNamed:@"CustomIndexTableViewCell" owner:self options:nil];
//    CustomIndexTableViewCell *wzw=[[nib objectAtIndex:0] init];

    CustomIndexTableViewCell *wzw=[[CustomIndexTableViewCell alloc] init];
    
    wzw.headIcon.image=[UIImage imageNamed:@"wfsIcon.png"];
    wzw.usernameLable.text=@"维富帅";
    wzw.userStatus.text=@"我很有钱";
    wzw.userCreditRank.image=[UIImage imageNamed:@"5zhuanLeave.png"];
     wzw.messageText.text=@"aaa我真他妈的有钱，权屌丝赶紧过来，给你一万别烦我了";
    wzw.messageImage1.image=[UIImage imageNamed:@"login_backgroup2.jpg"];
      wzw.messageImage1.canClick = YES;
    wzw.theUserTableController=self;

//    不能用
//    CustomIndexTableViewCell *csx=[[nib objectAtIndex:0] init];
//    如果没实现coping协议报错：NSInvalidArgumentException', reason: '-[CustomIndexTableViewCell copyWithZone:]: unrecognized selector sent to instance 0xaf3ef30
//    CustomIndexTableViewCell *csx=[wzw mutableCopy];
    
//    NSArray *nib2=[[NSBundle mainBundle] loadNibNamed:@"CustomIndexTableViewCell" owner:self options:nil];
//    CustomIndexTableViewCell *csx=[[nib2 objectAtIndex:0] init];
   CustomIndexTableViewCell *csx= [[CustomIndexTableViewCell alloc] init];
    csx.headIcon.image=[UIImage imageNamed:@"Default.png"];
    csx.usernameLable.text=@"喜富帅";
    csx.userStatus.text=@"我也很有钱";
    csx.userCreditRank.image=[UIImage imageNamed:@"5zhuanLeave.png"];
    csx.messageText.text=@"我也真他妈的有钱，权qqq屌丝赶紧过来，给你一万别烦我了";
    csx.messageImage1.image=[UIImage imageNamed:@"login_backgroup2.jpg"];
    csx.messageImage1.canClick = YES;
     csx.theUserTableController=self;
   
//    NSArray *nib3=[[NSBundle mainBundle] loadNibNamed:@"CustomIndexTableViewCell" owner:self options:nil];
//    CustomIndexTableViewCell *qds=[[nib3 objectAtIndex:0] init];
    
      CustomIndexTableViewCell *qds=[[CustomIndexTableViewCell alloc] init];
    qds.headIcon.image=[UIImage imageNamed:@"home-icon-set.png"];
    qds.usernameLable.text=@"权屌丝";
    qds.userStatus.text=@"我是乞丐";
    qds.userCreditRank.image=[UIImage imageNamed:@"5zhuanLeave.png"];
    qds.messageText.text=@"谢谢两位富帅给我施wwdd舍点钱，非常感谢。另外今天捡到挺多垃圾瓶的";
    qds.messageImage1.image=[UIImage imageNamed:@"laji.png"];

    
//    _tableViewCells=[NSArray arrayWithObjects:wzw,csx,qds,nil];
        _tableViewCells=[[NSMutableArray alloc] initWithObjects:wzw,csx,qds, nil];
  NSLog(@"用户名%@",wzw.usernameLable);
    //在外围初始化好tablecell end
    
    
//    if([LoginViewController isLogin]){
//        [_loginOrPostButton setTitle:@"发布" forState:UIControlStateNormal];
////        [_loginOrPostButton setHidden:YES];
//    }else{
//        [_loginOrPostButton setTitle:@"登陆" forState:UIControlStateNormal];
//    }
    
    _searchResults=[[NSMutableArray alloc] init];
//    [self resetSearch];
    //重置
//    [_table reloadData];
    //重新载入数据
    
    
    ////添加刷新用的表头表尾
//    // set the custom view for "pull to refresh". See DemoTableHeaderView.xib.
//    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DemoTableHeaderView" owner:self options:nil];
//    DemoTableHeaderView *headerView = (DemoTableHeaderView *)[nib objectAtIndex:0];
//    self.headerView = headerView;
//    
//    // set the custom view for "load more". See DemoTableFooterView.xib.
//    nib = [[NSBundle mainBundle] loadNibNamed:@"DemoTableFooterView" owner:self options:nil];
//    DemoTableFooterView *footerView = (DemoTableFooterView *)[nib objectAtIndex:0];
//    self.footerView = footerView;

    
}
-(void)viewDidAppear:(BOOL)animated{
    if([LoginViewController isLogin]){
        [_loginOrPostButton setTitle:@"发布" forState:UIControlStateNormal];
        //        [_loginOrPostButton setHidden:YES];
    }else{
        [_loginOrPostButton setTitle:@"登陆" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 定义一个table中有多少个分区 数据源的方法，两个必须实现的方法之一
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

#pragma mark 定义有多少个单元格  数据源的方法，两个必须实现的方法之一
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if (_searchResults.count<1){
        return [self.tableViewCells count];
    }else{
        return [self.searchResults count];
    }
    
//    return [_tableViewCells count]+1;
    
}

#pragma mark 定义单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Return the number of rows in the section.
    
    return 260;
}


-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{//TableView的项被选择前触发
    [_searchBar resignFirstResponder];
    //搜索条释放焦点，隐藏软键盘
    return indexPath;
}

#pragma mark逐个对单元进行初始化 初始化每一行要显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSInteger row=indexPath.row;
   
    
//      static NSString * identifier=@"CustomIndexTableViewCell";
    CustomIndexTableViewCell *cell=nil;
    
    
    
//    //因为不断的循环，所以定义成静态的，第一次的时候new对象，第二次开始就不new了，节省资源
////    [tableView registerClass:[CustomIndexTableViewCell class] forCellReuseIdentifier:@"CustomIndexTableViewCell"];
////    //根据标识获取可重复使用的单元格
//     cell = (CustomIndexTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
////    
//    if(cell==nil){
//     
////        cell=[[CustomIndexTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        //加载lib
//        cell= [[CustomIndexTableViewCell alloc] init];
//       
//   }
//    cell.headIcon.image=[UIImage imageNamed:[_tableHeadIcon objectAtIndex:indexPath.row]];
//    cell.usernameLable.text=[_tableUsername objectAtIndex:indexPath.row];
//    cell.userStatus.text=[_tableUserStatus objectAtIndex:indexPath.row];
//    
//    UIImage *userCreditRankImage=nil;
//    //如果用户的等级大于0
////    if([_tableUserCreditRank objectAtIndex:indexPath.row]>0){
//        userCreditRankImage=[UIImage imageNamed:@"5zhuanLeave.png"];
////    }
//    cell.userCreditRank.image=userCreditRankImage;
//    cell.messageText.text=[_tableMessageText objectAtIndex:indexPath.row];
//    cell.messageImage1.image=[UIImage imageNamed:[_tableMessageImage1 objectAtIndex:indexPath.row]];
//    
//    //分配信息
//    CustomIndexTableCellBean *cellbean=[_tableViewCells objectAtIndex:indexPath.row];
//    cell=[_tableViewCells objectAtIndex:indexPath.row];
//        cell.headIcon.image=[UIImage imageNamed:cellbean.headIcon];
//        cell.usernameLable.text=cellbean.usernameLable;
//        cell.userStatus.text=cellbean.userStatus;
//        cell.userCreditRank.image=[UIImage imageNamed:cellbean.userCreditRank];
//        cell.messageText.text=cellbean.messageText;
//        cell.messageImage1.image=[UIImage imageNamed:cellbean.messageImage1];
    
    
    
    //直接赋值bean
    if(row>=_tableViewCells.count){
//        row=indexPath.row-1;
        return [[UITableViewCell alloc] init];
        
    }
    
    NSLog(@"indexPath is = %i",row);
    
    
    if (_searchResults.count<1){
        cell=[_tableViewCells objectAtIndex:row];
    }else{
        cell=[_searchResults objectAtIndex:row];
    }
    
    //table cell重用 一般用类名做为标识
    /*static NSString *identifier=@"UITableViewCell";
    UITableViewCell *ycell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if(ycell==nil){
        ycell=[[UITableViewCell alloc] initWithStyle:UITableViewStylePlain reuseIdentifier:identifier];
    }*/
    
    
//    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;//辅助组件 在cell最右边 类似尖括号
//    cell.accessoryType=UITableViewCellAccessoryDetailButton;//圆按钮中有一个类似尖括号
//    cell.accessoryType=UITableViewCellAccessoryCheckmark;//钩钩
    
    
//    //被选中时的颜色
//    cell.selectionStyle=UITableViewCellSelectionStyleBlue;
    return cell;
}



// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}



// 当提交了一些编辑指令
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //删除
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //删除真实数据
        [_tableViewCells removeObjectAtIndex:indexPath.row];
        
        
        //带动画删除
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]withRowAnimation:UITableViewRowAnimationLeft];
        //刷新界面
        [tableView reloadData];
        //插入
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 }
*/
#pragma mark 取消选择行之后调用
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    UIStoryboard *sss = [UIStoryboard storyboardWithName:@"RegStoryboard"  bundle:nil];
    
    RegViewController *registVC=[sss instantiateViewControllerWithIdentifier:@"222"];
    [[self navigationController]pushViewController:sss animated:YES];
    
}


#pragma mark 选择行之后调用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"执行了选择");
    //取消选中某行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


#pragma mark 故事版跳转到xib的登陆视图控制器
- (IBAction)goToLoginOrPost {
    
     if([LoginViewController isLogin]){
//         UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard"  bundle:nil];
//         
//         //      self.view.window.rootViewController = [storyboard instantiateInitialViewController];
//         //    [self presentModalViewController:[storyboard instantiateInitialViewController] animated:YES];
//         
//         UIViewController *postViewC=[storyboard instantiateViewControllerWithIdentifier:@"9"];
         
         self.view.window.rootViewController=[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"9"];
//         [[self navigationController]pushViewController:postViewC animated:YES];
         return;
     }
    
    UIViewController *loginVC=[LoginViewController getLoginViewController:self.navigationController];
    //    [[self navigationController] set];
    //拿到当前的导航控制器
//    [[self navigationController]pushViewController:loginVC animated:YES];
//    [MainTableViewController goToLoginq:self];
}

//+(void)goToLoginq:(UIViewController*)obj{
//    
//    LoginViewController *loginVC=[[LoginViewController alloc] init];
//    
//    loginVC.title=@"登陆";
//    //改变返回按键的文字
//    obj.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
//    
//    //    [[self navigationController] set];
//    //拿到当前的导航控制器
//    [[obj navigationController]pushViewController:loginVC animated:YES];
//}

//控制器被销毁的时候调用 该方法现在不可以用了
//-(void)dealloc{
//
//    [_tableViewCells release];
//[super dealloc];
//}
//控制器的view被销毁的时候调用
-(void)viewDidUnload{
    [super viewDidUnload];
//    [_tableViewCells release];
//    _tableUsername=nil;
    _tableViewCells=nil;
    //等价于if（_tableViewCells！=nil）{
//    [_tableViewCells release];
//    _tableViewCells=[nil retain];
//}
    
}


- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    NSLog(@"searchBarShouldBeginEditing");
    //将要开始输入搜索词的时候吧导航条隐藏
    self.navigationController.navigationBarHidden=YES;
    return YES;
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
     _searchBar.showsCancelButton=YES;
//  
//    for(id cc in [_searchBar subviews])
//    {
//        if([cc isKindOfClass:[UIButton class]])
//        {
//            UIButton *btn = (UIButton *)cc;
//            [btn setTitle:@"取消" forState:UIControlStateNormal];
//        }
//    }
     NSLog(@"searchBarTextDidBeginEditing");
}                    // called when text starts editing
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    NSLog(@"searchBarShouldEndEditing");
    return YES;
}                       // return NO to not resign first responder
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
     NSLog(@"searchBarTextDidEndEditing");
    self.navigationController.navigationBarHidden=NO;
}                       // called when text ends editing
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
     NSLog(@"textDidChange");
    //搜索条输入文字修改时触发
    if([searchText length]==0)
    {//如果无文字输入
        [self resetSearch];
        return;
    }
    
  [self handleSearchForTerm:searchText];
    //有文字输入就把关键字传给handleSearchForTerm处理
}   // called when text changes (including clear)


//按软键盘右下角的搜索按钮时触发
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
     NSLog(@"searchBarSearchButtonClicked");
    NSString *searchTerm=[searchBar text];
    //读取被输入的关键字
    [self handleSearchForTerm:searchTerm];
    //根据关键字，进行处理
    [searchBar resignFirstResponder];
    //隐藏软键盘
}                     // called when keyboard search button pressed
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar{
     NSLog(@"searchBarBookmarkButtonClicked");
}                   // called when bookmark button pressed


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
     _searchBar.showsCancelButton=NO;
    //取消按钮被按下时触发
    [self resetSearch];
    //重置
    searchBar.text=@"";
  
   [searchBar resignFirstResponder];
     NSLog(@"searchBarCancelButtonClicked");
}                     // called when cancel button pressed

- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"searchBarResultsListButtonClicked");
}


-(void)resetSearch
{
    if(_searchResults.count>0){
        //清空搜索结果
        [_searchResults removeAllObjects];
        //输入框清空
        [_table reloadData];
    }
    
}
- (void)needReloadResultTableview
{
    if ([_tableViewCells count]>0) {
        [self.tableView reloadData];
    }
}

-(void)handleSearchForTerm:(NSString *)searchTerm
{
    for (CustomIndexTableViewCell * cell in _tableViewCells) {
        if ([cell.messageText.text contains:searchTerm]) {
            if (![_searchResults containsObject:cell]) {
                [_searchResults addObject:cell];
            }
        }
    }
    [self needReloadResultTableview];
    
}

- (void)refresh {
    [self performSelector:@selector(addItem) withObject:nil afterDelay:1.0];
}

- (void)addItem {
    CustomIndexTableViewCell *wzw=[[CustomIndexTableViewCell alloc] init];
    
    wzw.headIcon.image=[UIImage imageNamed:@"wfsIcon.png"];
    wzw.usernameLable.text=[NSString stringWithFormat:@"维富帅%d",++_count];
    wzw.userStatus.text=@"我很有钱";
    wzw.userCreditRank.image=[UIImage imageNamed:@"5zhuanLeave.png"];
    wzw.messageText.text=@"aaa我真他妈的有钱，权屌丝赶紧过来，给你一万别烦我了";
    wzw.messageImage1.image=[UIImage imageNamed:@"login_backgroup2.jpg"];
    wzw.messageImage1.canClick = YES;
    wzw.theUserTableController=self;
    
    NSLog(@"输出对象：%@%@",_tableViewCells,wzw);
    [self.tableViewCells insertObject:wzw atIndex:0];
    
    [self.tableView reloadData];
    
    [self stopLoading];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Pull to Refresh

//////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void) pinHeaderView
//{
//    [super pinHeaderView];
//    
//    // do custom handling for the header view
//    DemoTableHeaderView *hv = (DemoTableHeaderView *)self.headerView;
//    [hv.activityIndicator startAnimating];
//    hv.title.text = @"Loading...";
//}
//
//////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void) unpinHeaderView
//{
//    [super unpinHeaderView];
//    
//    // do custom handling for the header view
//    [[(DemoTableHeaderView *)self.headerView activityIndicator] stopAnimating];
//}
//
//////////////////////////////////////////////////////////////////////////////////////////////////////
////
//// Update the header text while the user is dragging
////
//- (void) headerViewDidScroll:(BOOL)willRefreshOnRelease scrollView:(UIScrollView *)scrollView
//{
//    DemoTableHeaderView *hv = (DemoTableHeaderView *)self.headerView;
//    if (willRefreshOnRelease)
//        hv.title.text = @"Release to refresh...";
//    else
//        hv.title.text = @"Pull down to refresh...";
//}
//
//////////////////////////////////////////////////////////////////////////////////////////////////////
////
//// refresh the list. Do your async calls here.
////
//- (BOOL) refresh
//{
//    if (![super refresh])
//        return NO;
//    
//    // Do your async call here
//    // This is just a dummy data loader:
//    [self performSelector:@selector(addItemsOnTop) withObject:nil afterDelay:2.0];
//    // See -addItemsOnTop for more info on how to finish loading
//    return YES;
//}
//
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//#pragma mark - Load More
//
//////////////////////////////////////////////////////////////////////////////////////////////////////
////
//// The method -loadMore was called and will begin fetching data for the next page (more).
//// Do custom handling of -footerView if you need to.
////
//- (void) willBeginLoadingMore
//{
//    DemoTableFooterView *fv = (DemoTableFooterView *)self.footerView;
//    [fv.activityIndicator startAnimating];
//}

////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Do UI handling after the "load more" process was completed. In this example, -footerView will
// show a "No more items to load" text.
//
//- (void) loadMoreCompleted
//{
//    [super loadMoreCompleted];
//    
//    DemoTableFooterView *fv = (DemoTableFooterView *)self.footerView;
//    [fv.activityIndicator stopAnimating];
//    
//    if (!self.canLoadMore) {
//        // Do something if there are no more items to load
//        
//        // We can hide the footerView by: [self setFooterViewVisibility:NO];
//        
//        // Just show a textual info that there are no more items to load
//        fv.infoLabel.hidden = NO;
//    }
//}
//
//////////////////////////////////////////////////////////////////////////////////////////////////////
//- (BOOL) loadMore
//{
//    if (![super loadMore])
//        return NO;
//    
//    // Do your async loading here
//    [self performSelector:@selector(addItemsOnBottom) withObject:nil afterDelay:2.0];
//    // See -addItemsOnBottom for more info on what to do after loading more items
//    
//    return YES;
//}
//
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//#pragma mark - Dummy data methods
//
//////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void) addItemsOnTop
//{
//    
//        CustomIndexTableViewCell *wzw=[[CustomIndexTableViewCell alloc] init];
//    
//        wzw.headIcon.image=[UIImage imageNamed:@"wfsIcon.png"];
//        wzw.usernameLable.text=[NSString stringWithFormat:@"维富帅%d",++_count];
//        wzw.userStatus.text=@"我很有钱";
//        wzw.userCreditRank.image=[UIImage imageNamed:@"5zhuanLeave.png"];
//        wzw.messageText.text=@"aaa我真他妈的有钱，权屌丝赶紧过来，给你一万别烦我了";
//        wzw.messageImage1.image=[UIImage imageNamed:@"login_backgroup2.jpg"];
//        wzw.messageImage1.canClick = YES;
//        wzw.theUserTableController=self;
//    
//        NSLog(@"输出对象：%@%@",_tableViewCells,wzw);
//    [self.tableViewCells insertObject:wzw atIndex:0];
//    
//    
//    [self.tableView reloadData];
//    
//    // Call this to indicate that we have finished "refreshing".
//    // This will then result in the headerView being unpinned (-unpinHeaderView will be called).
//    [self refreshCompleted];
//}
//
//////////////////////////////////////////////////////////////////////////////////////////////////////
//- (void) addItemsOnBottom
//{
//    CustomIndexTableViewCell *wzw=[[CustomIndexTableViewCell alloc] init];
//    
//    wzw.headIcon.image=[UIImage imageNamed:@"wfsIcon.png"];
//    wzw.usernameLable.text=[NSString stringWithFormat:@"xxxxddd%d",++_count];
//    wzw.userStatus.text=@"我很有钱";
//    wzw.userCreditRank.image=[UIImage imageNamed:@"5zhuanLeave.png"];
//    wzw.messageText.text=@"aaa我真他妈的有钱，权屌丝赶紧过来，给你一万别烦我了";
//    wzw.messageImage1.image=[UIImage imageNamed:@"login_backgroup2.jpg"];
//    wzw.messageImage1.canClick = YES;
//    wzw.theUserTableController=self;
//    
//    NSLog(@"输出对象：%@%@",_tableViewCells,wzw);
//    [self.tableViewCells addObject:wzw];
//    
//    [self.tableView reloadData];
//    
////    if (items.count > 50)
////        self.canLoadMore = NO; // signal that there won't be any more items to load
////    else
//        self.canLoadMore = YES;
//    
//    // Inform STableViewController that we have finished loading more items
//    [self loadMoreCompleted];
//}

////////////////////////////////////////////////////////////////////////////////////////////////////
//- (NSString *) createRandomValue
//{
//    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
//    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
//    
//    return [NSString stringWithFormat:@"%@ %@", [dateFormatter stringFromDate:[NSDate date]],
//            [NSNumber numberWithInt:rand()]];
//}
//- (CGFloat) headerRefreshHeight{
//    return 20.0f;
//}
//- (void) willShowHeaderView:(UIScrollView *)scrollView{
//    scrollView;
//}
//- (CGFloat) footerLoadMoreHeight{
//    return -1112.0f;
//}

@end
