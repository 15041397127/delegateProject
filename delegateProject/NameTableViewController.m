//
//  NameTableViewController.m
//  delegateProject
//
//  Created by zhang xu on 15/11/25.
//  Copyright © 2015年 zhang xu. All rights reserved.
//

#import "NameTableViewController.h"
#import "NameTableViewCell.h"
#import "SecondViewController.h"
@interface NameTableViewController ()<sendValue>
@property(nonatomic,strong)SecondViewController *sdVC;
@property(nonatomic,strong)NSMutableArray *arr;
@end

@implementation NameTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self upUI];
    

    
    self.arr =[NSMutableArray  arrayWithObjects:@"Tom",@"Linda",@"Kevin",@"Marrsa",@"Lee",@"Alan",@"Bill",@"Colbert",@"Jim",@"Lewis",@"Rod", nil];
    
    UIStoryboard *sendStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    self.sdVC=[sendStoryBoard instantiateViewControllerWithIdentifier:@"vc_id"];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



-(void)upUI{
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"NameTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
    
}


-(void)sendName:(NSString *)valueName index:(NSInteger)index{
    
//    [self.arr replaceObjectAtIndex:index withObject:valueName];
    self.arr[index]=valueName;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.ValueName.text=[self.arr objectAtIndex:indexPath.row];
    
    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    return 120;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //storyBoard里面跳转用下面的方法
//    UIStoryboard *sendStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    
//    SecondViewController *SdVC=[sendStoryBoard instantiateViewControllerWithIdentifier:@"vc_id"];
    
   self.sdVC.delegate=self;
   self.sdVC.index=indexPath.row;
    

//    self.sdVC.valueName1=self.arr[indexPath.row];
    [self.navigationController pushViewController:self.sdVC animated:YES];
    
    
    

    
    
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
