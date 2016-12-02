//
//  PullDownView.m
//  SimilarPullDown
//
//  Created by duhaichao-iri on 16/6/26.
//  Copyright © 2016年 duhaichao-iri. All rights reserved.
//

#import "PullDownView.h"
#import "Common.h"
@interface PullDownView()
{
//    NSString *headerTitle;
//   NSString * footerTitle;

    //PullDownType *type;
}
@property (nonatomic, strong) UIScrollView *bottomScrollView;
@property (nonatomic, strong) UIView *customView;

@end

@implementation PullDownView
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //获得偏移量
    
    int contentOffsetY = scrollView.contentOffset.y;
    //当前响应的高度，因为下拉，所以响应距离为负数
    int  beforeHeight = responseHeight * (-1);
    if(contentOffsetY < beforeHeight)
    {
        NSLog(@"我是DownView,上一页!");
        //表示上一页
        
        [self.delegate similarZHPullDownView:self directionType:PullTypeUp];
    }
    
    //偏移量是视图左上角，所以垂直坐标需要-滚动视图的高度
    else if(contentOffsetY > (scrollView.contentSize.height - scrollView.bounds.size.height + responseHeight))
    {
        
        NSLog(@"我是DownView,  下一页!");
        //表示上一页
        
        [self.delegate similarZHPullDownView:self directionType:PullTypeDown];    }

}
- (UIScrollView *)bottomScrollView{
    if (_bottomScrollView == nil) {
        int width=self.bounds.size.width;
        _bottomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, self.bounds.size.height)];
        [_bottomScrollView addSubview:_customView];
        //自定义视图的的高度
        int height = self.customView.bounds.size.height;
        //头页
        CGRect rectHead=CGRectMake(0,-1 * responseHeight,width,30);
        [_bottomScrollView addSubview:[self createLableFrame:&rectHead withTitle:self->_headerTitle]];
        //尾页
        CGRect rectFooter=CGRectMake(0,height,width,responseHeight);
        [_bottomScrollView addSubview:[self createLableFrame:&rectFooter withTitle:self->_footerTitle]];
        
        //设置ContentSize的高度，保证不小于视图的高度
        height = (height > self.bounds.size.height ? height : self.bounds.size.height);
        
        _bottomScrollView.contentSize = CGSizeMake( self.bounds.size.width, height);
        _bottomScrollView.delegate = self;


    }
    return _bottomScrollView;
}
//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    [self addSubview:self.bottomScrollView];
//
//}
- (void)didMoveToSuperview
{
    [self addSubview:self.bottomScrollView];
}
//- (void)willMoveToSuperview:(UIView *)newSuperview
//{
//    
//}
//创造标签
- (UILabel *)createLableFrame:(CGRect *)frame withTitle:(NSString *)title
{
    UILabel *label=[[UILabel alloc]initWithFrame:*frame];
    label.text=title;
    label.textAlignment = NSTextAlignmentCenter;
    //label.font = [UIFont systemFontSize:12];
    return label;

}
- (void)layoutSubviews
{
    [self addSubview:self.bottomScrollView];
    
}
- (id)initWithCustomView:(UIView *)custom withTitle:(NSString *)title
{
    self.title=title;
    return [self initWithCustomView:custom];
}
- (id)initWithCustomView:(UIView *)custom
{
    return [self initWithFrame:CGRectNull withCustomView:custom];
}
- (id)initWithFrame:(CGRect)frame
　　{
    　　self = [super initWithFrame:frame];
    　　if (self) {
        _headerTitle =@ "上一篇";
        _footerTitle = @"下一篇";
        //self.title = @"Titleashajshajsajsh";
        _type=Default;
        　　}
    　　return self;
    }
- (id)initWithFrame:(CGRect)frame withCustomView:(UIView *)custom
{
    self=[self initWithFrame:frame];
    self.customView=custom;
    return self;
}
@end
