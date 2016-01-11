//
//  UserInfoTableViewControlerTableViewController.m
//  picScan
//
//  Created by ocq on 14/11/9.
//  Copyright (c) 2014年 ocq. All rights reserved.
//

#import "UserInfoTableViewControler.h"
#import "ViewControllerManager.h"
#import "PSCAlbumCollectionCell.h"
#import "PSCClickImageView.h"
#import "CustomIndexTableViewCell.h"
#import "ViewController.h"
@interface UserInfoTableViewControler ()

@end

@implementation UserInfoTableViewControler

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //[mySegmentedControladdTarget:selfaction:@selector(segmentAction:)forControlEvents:UIControlEventValueChanged];  //添加委托方法
    
    _myNeedMessageTable.hidden=YES;
    _albumCollectionView.hidden=YES;
    
    _albumCollectionView.tag=3;
    _myNeedMessageTable.tag=2;
    _myHomeTable.tag=1;
    
    _albumCollectionView.backgroundColor=[UIColor whiteColor];
    
    [_infoSwitch addTarget:self action:@selector(segmentAction:)forControlEvents:UIControlEventValueChanged];
    
    _userHeaderIcon.image=_customIndexTableViewCell.headIcon.image;
     _userName.text=_customIndexTableViewCell.usernameLable.text;
 
    
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
    //      return [_tableHeadIcon count];
    return 5;
    
}

#pragma mark 定义单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Return the number of rows in the section.
    //    switch (indexPath.row) {
    //        case 0:
    //            return  80;
    //        default:
    //            break;
    //    }
    return 50;
}

#pragma mark逐个对单元进行初始化 初始化每一行要显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    UITableViewCellStyleDefault,	// Simple cell with text label and optional image view (behavior of UITableViewCell in iPhoneOS 2.x)
    //    UITableViewCellStyleValue1,		// Left aligned label on left and right aligned label on right with blue text (Used in Settings)
    //    UITableViewCellStyleValue2,		// Right aligned label on left with blue text and left aligned label on right (Used in Phone/Contacts)
    //    UITableViewCellStyleSubtitle	// Left aligned label on top and left aligned label on bottom with gray text (Used in iPod).
    //
    
    UITableViewCell *cell=nil;
    if(tableView.tag==1){
        
        //table cell重用 一般用类名做为标识
        static NSString *identifier=@"UserInfoTableViewControler";
        cell=[tableView dequeueReusableCellWithIdentifier:identifier];
        
        if(cell==nil){
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }//UITableViewStylePlain
        
        
        
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;//辅助组件 在cell最右边 类似尖括号
        //    cell.accessoryType=UITableViewCellAccessoryDetailButton;//圆按钮中有一个类似尖括号
        //    cell.accessoryType=UITableViewCellAccessoryCheckmark;//钩钩
        
        switch (indexPath.row) {
                //        case 0:
                ////            //cell的子视图contentView的3个子视图
                ////            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
                ////            cell.imageView.image=[UIImage imageNamed:[_tableHeadIcon objectAtIndex:indexPath.row]];
                ////            cell.textLabel.text=[_tableUsername objectAtIndex:indexPath.row];
                ////            cell.detailTextLabel.text=@"你好xxx";
                ////            //            cell.detailTextLabel.textAlignment=NSTextAlignmentLeft;
                //            break;
            case 0:
                cell.imageView.image=[UIImage imageNamed:@"friends.png"];
                cell.textLabel.text=@"我的好友";
                break;
            case 1:
                cell.imageView.image=[UIImage imageNamed:@"userHomeWelcome.jpg"];
                cell.textLabel.text=@"我的需求";
                break;
            case 2:
                cell.imageView.image=[UIImage imageNamed:@"album.png"];
                cell.textLabel.text=@"我的相册";
                break;
            case 3:
                //             cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identifier];
                cell.imageView.image=[UIImage imageNamed:@"exit.png"];
                cell.textLabel.text=@"退出";
                break;
            default:
                break;
        }
        cell.selectionStyle=UITableViewCellSelectionStyleBlue;
        
    }else if(tableView.tag==2){
        //table cell重用 一般用类名做为标识
        static NSString *identifier=@"UserInfoTableViewControler2";
        cell=[tableView dequeueReusableCellWithIdentifier:identifier];
        
        if(cell==nil){
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.imageView.image=[UIImage imageNamed:@"friends.png"];
            cell.textLabel.text=@"我的需求";
        }//UITableViewStylePlain
        NSLog(@"选择了第二个table");
        
    }
    
    
    //    //被选中时的颜色
    return cell;
    
}



#pragma mark 选择了行之后调用
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"执行了选择");
    
    
    //取消选中某行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIStoryboard *sss = [UIStoryboard storyboardWithName:@"RegStoryboard"  bundle:nil];
    
    
    //    RegViewController *registVC=[sss instantiateViewControllerWithIdentifier:@"222"];
    //    [[self navigationController]pushViewController:sss animated:YES];
    
}




//具体委托方法实例

-(void)segmentAction:(UISegmentedControl *)Seg{
    
    NSInteger Index = Seg.selectedSegmentIndex;
    
    NSLog(@"Index %i", Index);
    
    switch (Index) {
            
        case 0:
            _myHomeTable.hidden=NO;
            _albumCollectionView.hidden=YES;
            _myNeedMessageTable.hidden=YES;
            
            break;
            
        case 1:
            _myNeedMessageTable.hidden=NO;
            _albumCollectionView.hidden=YES;
            _myHomeTable.hidden=YES;
            break;
            
        case 2:
            _myHomeTable.hidden=YES;
            _myNeedMessageTable.hidden=YES;
            _albumCollectionView.hidden=NO;
            
            
            break;
            
        default:
            
            break;
            
    }
}

- (IBAction)backTo:(id)sender {
    
    //    [self.navigationController pushViewController:[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"4"] animated:YES];
    //故事版版本
//    self.view.window.rootViewController=[ViewControllerManager getMainStoryboardViewControllerWithIdentifier:@"1"] ;
    self.view.window.rootViewController=[ViewController getInstance];
}



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////collectionView实现//////////////////////////////////////////////////////////


#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    NSLog(@"%d",indexPath.row);
    if (indexPath.row==0) {
        [collectionView registerClass:[PSCAlbumCollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];
        //        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CollectionCell"];
        //         collectionView = [[UIViewController alloc] initWithCollectionViewLayout:[[CircleLayout alloc] init]];
    }
    
    static NSString * CellIdentifier = @"CollectionCell";
    //    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    PSCAlbumCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    if(cell==nil){
        //        cell=[[UICollectionViewCell alloc] init forCellWithReuseIdentifier:CellIdentifier];
        
        //      [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
        [collectionView registerClass:[PSCAlbumCollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];
        
    }
    
    
    //    cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    cell.backgroundColor =[UIColor grayColor];
    
    //图片名称
    NSString *imageToLoad = [NSString stringWithFormat:@"album%d.jpg", indexPath.row];
    //    cell.photoImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:imageToLoad]];
    
    
    //有一种情况会报错
    
    cell.photoImageView.image=[UIImage imageNamed:imageToLoad];
    //
    cell.photoImageView.canClick = YES;
    //加载图片
    //    cell.imageView.image = [UIImage imageNamed:imageToLoad];
    //    //设置label文字
    //    cell.label.text = [NSString stringWithFormat:@"{%ld,%ld}",(long)indexPath.row,(long)indexPath.section];
    //
    return cell;
    
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(96, 100);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    static NSInteger edgeInset=6;
    return UIEdgeInsetsMake(edgeInset, edgeInset, edgeInset, edgeInset);
    //    return UIEdgeInsetsMake(5, 5, 5, 5);
    //    return UIEdgeInsetsMake(0, 0, 0, 0);
}
#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法  //点击某项后跳转事件与UITableView类似，实现代理方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end

