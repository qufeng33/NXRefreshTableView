//
//  NXRefreshTableView.m
//
//  Created by 蒋瞿风 on 16/3/18.
//  Copyright © 2016年 maitianer. All rights reserved.
//

#import "NXRefreshTableView.h"

@implementation NXRefreshTableView

- (instancetype)init{
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        [self initialize];
    }
    return self;
}

- (void)addRefreshHeader{
    MJRefreshNormalHeader *header      = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDown:)];
    header.lastUpdatedTimeLabel.hidden = YES;
    self.mj_header                     = header;
}

- (void)initialize{
    [self addRefreshFooter];
    [self addRefreshHeader];
}

- (void)addRefreshFooter{
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(pullUp:)];
    footer.automaticallyHidden        = YES;
    footer.refreshingTitleHidden      = YES;
}

- (void)stopRefresh{
    if (self.mj_header.state == MJRefreshStateRefreshing) {
        [self.mj_header endRefreshing];
    }
    
    if (self.mj_footer.state == MJRefreshStateRefreshing) {
        [self.mj_footer endRefreshing];
    }
}

- (void)pullDown:(MJRefreshNormalHeader *)header{
    [self.mj_footer resetNoMoreData];
    [self.mj_footer endRefreshing];
    if ([self.refreshDelegate respondsToSelector:@selector(loadNewData:)]) {
        [self.refreshDelegate loadNewData:header];
    }
}

- (void)pullUp:(MJRefreshAutoNormalFooter *)footer{
    [self.mj_header endRefreshing];
    if ([self.refreshDelegate respondsToSelector:@selector(loadMoreData:)]) {
        [self.refreshDelegate loadMoreData:footer];
    }
}

@end
