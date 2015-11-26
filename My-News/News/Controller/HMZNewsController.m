//
//  HMZNewsController.m
//  My-News
//
//  Created by 赵志丹 on 15/11/24.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

#import "HMZNewsController.h"
#import "HMZNews.h"
#import "HMZNewsCell.h"

@interface HMZNewsController ()

@property (nonatomic,strong) NSMutableArray *newsList;
@end

@implementation HMZNewsController

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)setURLString:(NSString *)URLString{
    _URLString = URLString;
    
    self.newsList = @[].copy;
    [self.tableView reloadData];
    
    __weak typeof(self) weakSelf = self;
    [HMZNews newsListWithURLString:self.URLString  finishBlock:^(NSMutableArray *newsList) {
        weakSelf.newsList = newsList;
    }];
}

- (void)setNewsList:(NSMutableArray *)newsList{
    _newsList = newsList;
    [self.tableView reloadData];
}



#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HMZNews *news = self.newsList[indexPath.row];
    static NSString *identifier = nil;
    if (news.imgType){//是否大图
        identifier = @"BigCell";
    }
    else if (news.imgextra.count == 2) {//是否是多张图
        identifier = @"ImagesCell";
    }else{
        identifier = @"BaseCell";
    }
//    HMZNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
//    cell.news = news;
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    HMZNews *news = self.newsList[indexPath.row];
    CGFloat cellHeight = 0;
    if (news.imgType){
        cellHeight = 180;
    }
    else if (news.imgextra.count == 2) {
        cellHeight = 120;
    }else {
        cellHeight = 80;
    }
    return cellHeight;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    //1.取出模型进行判断
//    HMZNews *news = self.newsList[indexPath.row];
//    
//    static NSString *identifier =nil;
//    //根据模型来判断,显示的是哪种类型的cell
//    if (news.imgType) {
//        identifier= @"BigCell";
//    }else if(news.imgextra.count==2){
//        identifier= @"ImagesCell";
//    }else{
//        identifier= @"BaseCell";
//    }
//    
//    HMZNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
//    
//    cell.news = news;
//    
//    return cell;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    HMZNews *news = self.newsList[indexPath.row];
//    
//    CGFloat cellHeight = 0;
//    //根据模型来判断,显示的是哪种类型的cell
//    if (news.imgType) {
//        cellHeight= 180;
//    }else if(news.imgextra.count == 2){
//        cellHeight= 120;
//    }else{
//        cellHeight= 80;
//    }
//    
//    return cellHeight;
//}



@end
