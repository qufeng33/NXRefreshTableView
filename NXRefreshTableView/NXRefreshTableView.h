//
//  NXRefreshTableView.h
//
//  Created by 蒋瞿风 on 16/3/18.
//  Copyright © 2016年 maitianer. All rights reserved.
//

#import <TPKeyboardAvoiding/TPKeyboardAvoidingTableView.h>
#import <MJRefresh/MJRefresh.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>


@protocol RefreshDelegate <NSObject>

@optional
- (void)loadNewData:(MJRefreshNormalHeader *)header;
- (void)loadMoreData:(MJRefreshAutoFooter *)footer;

@end

@interface NXRefreshTableView : TPKeyboardAvoidingTableView

@property (strong, nonatomic) IBOutlet id <RefreshDelegate> refreshDelegate;

- (void)stopRefresh;

@end
