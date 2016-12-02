//
//  PullDownMainView.m
//  SimilarPullDown
//
//  Created by duhaichao-iri on 16/6/26.
//  Copyright © 2016年 duhaichao-iri. All rights reserved.
//

#import "PullDownMainView.h"
static CGFloat const animationDuraion = 0.1f;
@interface PullDownMainView ()
{
//    NSString *headerTitle;
//    NSString *footerTitle;
    NSString *title;
    //NSMutableArray *pullViews;
//    PullDownView
}
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *titleLabel;
//@property (nonatomic, strong)  NSMutableArray *pullViews;
@end

@implementation PullDownMainView
@synthesize  pullViews;
/// 存放滚动页的主滚动页
- (UIScrollView *)scrollView{
    if (_scrollView == nil) {
        int width=self.bounds.size.width;
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.titleLabel.bounds.size.height
                                                                     , self.bounds.size.width,self.bounds.size.height - 50 - 64)];
        
        _scrollView.pagingEnabled = true;//分页显示
        _scrollView.showsVerticalScrollIndicator = false ;//不显示垂直滚条
        _scrollView.scrollEnabled = false; //不能滚动

        
           }
    return _scrollView;
}
- (UILabel *)titleLabel
{
    if (_titleLabel==nil) {
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 50)];
        //label.text=@"asjaskasjk";
        label.textAlignment = NSTextAlignmentCenter;
        _titleLabel=label;
    }
  
    //label.font = [UIFont systemFontSize:12];
    return _titleLabel;

}
- (void)layoutSubviews
{
    //        _scrollView.contentSize = CGSizeMake(kScreenWidth, 3 * kScreenHeight);

    //设置自身的contentSize
    self.scrollView.contentSize = CGSizeMake(self.bounds.size.width,(self->pullViews.count) * self.bounds.size.height);
    
    [self addChildView];

}
- (id)initWithFrame:(CGRect)frame withPullViews:( NSArray *)pullDownView
{
    self=[self initWithFrame:frame];
    self.pullViews=pullDownView;
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    　self = [super initWithFrame:frame];
    　　if (self) {
                　　// add subviews
        [self addSubview:(self.titleLabel)];
        [self addSubview:(self.scrollView)];
        　　}
    　　return self;
}

//- (NSMutableArray *)pullViews
//{
//    PullDownView *viewFirst=self.pullViews.firstObject;
//    viewFirst.headerTitle=self.headerTitle;
//    
//    
//    PullDownView *viewLast=self.pullViews.lastObject;
//    viewLast.footerTitle=self.footerTitle;
//    
//    return self.pullViews;
//}
- (void)similarZHPullDownView:(PullDownView*)view directionType:(PullType )direction
{
    CGPoint contentOffset=self.scrollView.contentOffset;
    int index=[pullViews indexOfObject:view];
    int paramNumber=1;
    switch (direction) {
        case PullTypeUp:
            if (view.type!=Header) {
                paramNumber=-1;
                [self pullDonewithParamNumber:paramNumber withcontentOffset:contentOffset withIndex:index ];
            }
            break;
        case PullTypeDown:
            if (view.type!=Footer)
            {
                paramNumber=1;
                [self pullDonewithParamNumber:paramNumber withcontentOffset:contentOffset withIndex:index ];
            }
            break;
        default:
            break;
    }
    
}
- (void)addChildView
{
    int width=self.bounds.size.width;
    int height=self.bounds.size.height;
    for (int i=0; i<self->pullViews.count; i++) {
        PullDownView *pullDownView=self->pullViews[i];
        pullDownView.frame=CGRectMake(0,  i * height, width, height - 64 - 50);
        //设置代理
        pullDownView.delegate = self;
        
        //添加视图
        [self.scrollView addSubview:pullDownView];

    }
    PullDownView *pullView=[self->pullViews firstObject];
    self.titleLabel.text =pullView.title;
}
//滚动操作
- (void)pullDonewithParamNumber:(int)param withcontentOffset:(CGPoint)contentoffset withIndex:(int)index
{
//    PullDownView *newPullDownView=[self addPullDownView:index withPullType:direction];
//     [self.scrollView addSubview:newPullDownView];
    contentoffset.y += (param * self.bounds.size.height);
    
    
//    [UIView animateWithDuration:animationDuraion animations:^{
         [self.scrollView setContentOffset:contentoffset animated:true];
//    } completion:^(BOOL finished) {

    
    
    
    
    
    
        
        PullDownView *view=self->pullViews[index + param];
        self.titleLabel.text = view.title;
    //}];
    
    //显示即将出现的similarZHPullDownView对象的title
  }
- (UIImageView *)createCustomView
{
    UIImageView *imageView=[[UIImageView alloc]init];
    int  count=1;
    imageView.frame=CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height*count);
    [imageView setImage:[UIImage imageNamed:@"play"]];
    imageView.contentMode=UIViewContentModeScaleToFill;
    return imageView;
}
@end
