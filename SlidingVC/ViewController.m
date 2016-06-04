//
//  ViewController.m
//  SlidingVC
//
//  Created by 龙少 on 16/6/4.
//  Copyright © 2016年 龙少. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#include "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"

#import "DLTabedSlideView.h"

enum{
    VCType_One = 0,
    VCType_Two,
    VCType_Three,
    VCType_Four,
    
    VCType_One_Invalid
};

@interface ViewController ()<DLTabedSlideViewDelegate>{
    DLTabedSlideView *tabedSlideView;
    NSInteger showNumber;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tabedSlideView = [[DLTabedSlideView alloc] init];
    tabedSlideView.frame = CGRectMake(0,20, self.view.bounds.size.width, self.view.bounds.size.height-20);
    [tabedSlideView setDelegate:self];
    
    [tabedSlideView setBaseViewController:self];
    [tabedSlideView setTabItemNormalColor:[UIColor blackColor]];
    [tabedSlideView setTabItemSelectedColor:[UIColor redColor]];
    [tabedSlideView setTabbarTrackColor:[UIColor brownColor]];
    [tabedSlideView setTabbarBottomSpacing:3.0];
    
    DLTabedbarItem *item1 = [DLTabedbarItem itemWithTitle:@"全部" image:nil selectedImage:nil];
    DLTabedbarItem *item2 = [DLTabedbarItem itemWithTitle:@"待付款" image:nil selectedImage:nil];
    DLTabedbarItem *item3 = [DLTabedbarItem itemWithTitle:@"待发货" image:nil selectedImage:nil];
    DLTabedbarItem *item4 = [DLTabedbarItem itemWithTitle:@"待收货" image:nil selectedImage:nil];
    
    [tabedSlideView setTabbarItems:@[item1,item2,item3,item4]];
    [tabedSlideView buildTabbar];
    
    showNumber = [tabedSlideView.tabbarItems count];
    
    tabedSlideView.selectedIndex = 0;
    [self.view addSubview:tabedSlideView];

}

-(NSInteger)numberOfTabsInDLTabedSlideView:(DLTabedSlideView *)sender{
    return showNumber;
}

-(UIViewController*)DLTabedSlideView:(DLTabedSlideView *)sender controllerAt:(NSInteger)index{
    switch (index) {
        case VCType_One:
        {
            OneViewController *one = [[OneViewController alloc] init];
            return one;
        }
            break;
        case VCType_Two:
        {
            TwoViewController *two = [[TwoViewController alloc] init];
            return two;
        }
            break;
        case VCType_Three:
        {
            ThreeViewController *three = [[ThreeViewController alloc] init];
            return three;
        }
            break;
        case VCType_Four:
        {
            FourViewController *four = [[FourViewController alloc] init];
            return four;
        }
            break;
        default:
            break;
    }
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
