//
//  RootViewController.m
//  Thing1
//
//  Created by Ostap Horbach on 9/23/14.
//  Copyright (c) 2014 Ostap Horbach. All rights reserved.
//

#import "RootViewController.h"
#import "InspectionView.h"
#import "MagicView.h"

@interface RootViewController ()

@property (nonatomic, strong) InspectionView *inspectionView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    _inspectionView = [[InspectionView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    _inspectionView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:_inspectionView];
    
    MagicView *magicView = [[MagicView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:magicView];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [UIView animateWithDuration:1.0 animations:^{
//        _inspectionView.frame = CGRectMake(0, 0, 100, 100);
//    }];
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
