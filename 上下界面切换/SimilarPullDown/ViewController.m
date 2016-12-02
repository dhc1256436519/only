//
//  ViewController.m
//  SimilarPullDown
//
//  Created by duhaichao-iri on 16/6/26.
//  Copyright © 2016年 duhaichao-iri. All rights reserved.
//

#import "ViewController.h"
#import "PullDownView.h"
#import "PullDownMainView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Yue";
    PullDownMainView *pullMain=[[PullDownMainView alloc]initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width,self.view.bounds.size.height)];
    
//    pullMain.headerTitle=@"啦啦啦,我已经是第一篇了";
//    pullMain.footerTitle=@"哈哈哈,我是最后一篇啦";
    //[pullMain addFirstPullDownView];
    pullMain.pullViews=[self createPullDownViews];
    NSLog(@"......");
    //添加视图
    [self.view addSubview:pullMain];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSArray *)createPullDownViews
{
    NSMutableArray *tempArrayViews=[NSMutableArray array];
    for (int i=0; i<5; i++) {
      
        PullDownView *pullView=[[PullDownView alloc] initWithCustomView:[self createCustomView] withTitle:[NSString stringWithFormat:@"Test-%d",i]];
        if (i==0) {
            pullView.headerTitle=@"啦啦啦,我已经是第一篇了";
            pullView.type=Header;
        }
        if (i==4) {
             pullView.footerTitle=@"哈哈哈,我是最后一篇啦";
            pullView.type=Footer;
        }
        [tempArrayViews addObject:pullView];
    }
    return tempArrayViews;
}
- (UIImageView *)createCustomView
{
    UIImageView *imageView=[[UIImageView alloc]init];
    int  count=1;
    imageView.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*count);
    [imageView setImage:[UIImage imageNamed:@"play"]];
    imageView.contentMode=UIViewContentModeScaleToFill;
    return imageView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
