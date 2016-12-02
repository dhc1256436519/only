//
//  PullDownView.h
//  SimilarPullDown
//
//  Created by duhaichao-iri on 16/6/26.
//  Copyright © 2016年 duhaichao-iri. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PullDownView;
typedef NS_ENUM(NSInteger)
{
    //以下是枚举成员
    PullTypeUp = 0,
    PullTypeDown = 1
}PullType;

typedef NS_ENUM(NSInteger)
{
    //以下是枚举成员
    Default = 0,
    Header = 1,
    Footer=2
}PullDownType;
@protocol PullDownViewDelegate <NSObject,UIScrollViewDelegate>
@optional  //可选
- (void)similarZHPullDownView:(PullDownView*)view directionType:(PullType *)direction;
@required //必须

@end

@interface PullDownView : UIView<UIScrollViewDelegate>
@property(assign) id<PullDownViewDelegate> delegate;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString * footerTitle;
@property (nonatomic, assign) PullDownType type;
- (id)initWithCustomView:(UIView *)custom withTitle:(NSString *)title;
- (id)initWithFrame:(CGRect)frame withCustomView:(UIView *)custom;
//@property (nonatomic, assign) PullType contenttype; // 类型
//@property (nonatomic, assign) PullDownType contenttype1; // 类型
@end
