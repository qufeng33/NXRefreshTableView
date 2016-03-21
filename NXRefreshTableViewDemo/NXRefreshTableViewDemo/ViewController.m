//
//  ViewController.m
//  NXRefreshTableViewDemo
//
//  Created by 蒋瞿风 on 16/3/18.
//  Copyright © 2016年 nightx. All rights reserved.
//

#import "ViewController.h"
#import "NXRefreshTableView.h"

@interface ViewController ()<RefreshDelegate,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet NXRefreshTableView *tableView;
@property (strong, nonatomic) NSMutableArray *items;

@end

static NSString *cellIdentifier = @"Cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.items = [[NSMutableArray alloc] init];
    for (int i = 0; i<20; i++) {
        NSLog(@"%@",[NSNumber numberWithInt:i].stringValue);
        [self.items addObject:[NSNumber numberWithInt:i].stringValue];
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - RefreshDelegate
- (void)loadMoreData:(MJRefreshAutoFooter *)footer{
    
}

- (void)loadNewData:(MJRefreshNormalHeader *)header{
    
}

#pragma mark = UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [self.items objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark = UITableViewDelegate



@end
