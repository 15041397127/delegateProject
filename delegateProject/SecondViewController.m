//
//  SecondViewController.m
//  delegateProject
//
//  Created by zhang xu on 15/11/25.
//  Copyright © 2015年 zhang xu. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *text;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}





//-(void)viewWillAppear:(BOOL)animated{
//    
//    [super viewWillAppear:animated];
//    
//    self.text.text=nil;
//    
//}

//
//- (IBAction)sendValueAction:(id)sender {
//    
//    
//    if ([self.nameTextFiled.text isEqualToString:@""]) {
//        [self.delegate sendValueWithName:self.valueName index:self.index];
//    }else{
//        [self.delegate sendValueWithName:self.nameTextFiled.text index:self.index];
//    }
//    
//    
//    [self.navigationController popToRootViewControllerAnimated:YES  ];
//    
//}

- (IBAction)saveValue:(id)sender {
   
    if ([self.delegate respondsToSelector:@selector(sendName:index:)]) {
        [self.delegate sendName:self.text.text index:self.index];
        NSLog(@"%@",self.text.text);
        NSLog(@"%ld",(long)self.index);
        
    }
    
    

    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)dealloc{
    
   //比如:观察者 通知 NSTimer
    
    self.delegate=nil;
}




- (void)didReceiveMemoryWarning {
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
