//
//  ViewController.m
//  Test
//
//  Created by Ashimar on 16/11/6.
//  Copyright © 2016年 ZHZ. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "ClassifyOfLeftTableView.h"
#import "ClassifyOfRightCollectionView.h"

@interface ViewController ()
{
    ClassifyOfLeftTableView *leftView;
    
}
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) ClassifyOfRightCollectionView *rightView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    leftView  = [[ClassifyOfLeftTableView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width/4, self.view.frame.size.height)];
    [self.view addSubview:leftView];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    self.rightView = [[ClassifyOfRightCollectionView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4, 0, self.view.frame.size.width*3/4, self.view.frame.size.height) collectionViewLayout:layout];
    self.rightView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.rightView];
    
    [self loadData];
    
    __weak ViewController *weakSelf = self;
    
    leftView.tapLeftBlock = ^(NSInteger index){
        
        weakSelf.rightView.rightDataSource = weakSelf.dataSource[index][@"sonItems"];
    };
    
    self.rightView.tapRightBlock = ^(NSInteger productID) {
        NSLog(@"你选中了 id 为 %ld的产品",productID);
    };
    
}

- (void)loadData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    manager.requestSerializer.HTTPShouldHandleCookies = YES;
    
    manager.requestSerializer.timeoutInterval = 10.0f;
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *url = @"http://123.57.81.236/sixmarket/sixmarket/index.php/Webservice/v410/goods_type_list";
    [manager POST:url parameters:@{@"agent_id":@"101"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"response = %@",response);
        
        self.dataSource = [NSArray arrayWithArray:response[@"infor"][@"listItems"]];
        
        NSLog(@"self.dataSource = %@",self.dataSource);
        
        self.rightView.rightDataSource = self.dataSource[0][@"sonItems"];
        leftView.leftDataSource = self.dataSource;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
