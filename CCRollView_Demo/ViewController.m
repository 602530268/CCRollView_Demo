//
//  ViewController.m
//  CCRollView_Demo
//
//  Created by chencheng on 2018/3/5.
//  Copyright © 2018年 double chen. All rights reserved.
//

#import "ViewController.h"
#import "CCRollView.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *urls = @[@"https://cdn.pixabay.com/photo/2018/01/12/10/19/fantasy-3077928_1280.jpg",
                             @"https://cdn.pixabay.com/photo/2018/01/28/11/24/nature-3113318_1280.jpg",
                             @"https://cdn.pixabay.com/photo/2018/02/07/14/27/pension-3137209_1280.jpg",
                             @"https://cdn.pixabay.com/photo/2018/02/24/18/00/row-pension-3178766_1280.jpg",
                             @"https://cdn.pixabay.com/photo/2016/07/17/08/37/coins-1523383_1280.jpg"];
    
    NSMutableArray *imgs = @[].mutableCopy;
    
    NSLog(@"正在从网络加载图片...");
    for (int i = 0; i < urls.count; i++) {
        NSString *urlString = urls[i];
        urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        UIImage *img = [UIImage imageWithData:data];
        [imgs addObject:img];
    }
    
    CCRollView *rollView = [[CCRollView alloc] initWithFrame:CGRectZero imgs:imgs];
    [self.view addSubview:rollView];
    [rollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.equalTo(self.view);
    }];
    
    NSLog(@"网络图片加载成功");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
