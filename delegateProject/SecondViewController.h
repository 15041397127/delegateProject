//
//  SecondViewController.h
//  delegateProject
//
//  Created by zhang xu on 15/11/25.
//  Copyright © 2015年 zhang xu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol sendValue <NSObject>

-(void)sendName :(NSString *)valueName index:(NSInteger)index;

@end

@interface SecondViewController : UIViewController

@property(nonatomic, assign)NSInteger index;
@property(nonatomic, strong)NSString *valueName1;
@property(nonatomic, weak)id<sendValue>delegate;



@end
