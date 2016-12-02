//
//  PullDownMainView.h
//  SimilarPullDown
//
//  Created by duhaichao-iri on 16/6/26.
//  Copyright © 2016年 duhaichao-iri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullDownView.h"
@interface PullDownMainView : UIScrollView<PullDownViewDelegate>
@property (nonatomic, copy) NSString *footerTitle;
@property (nonatomic, copy) NSString *headerTitle;
@property (nonatomic, strong)  NSMutableArray *pullViews;
//性能优化使用
@property (nonatomic, strong) PullDownView *lastPullDownView;
- (PullDownView *)addPullDownView:(int)index;
- (void)addFirstPullDownView;
@end
