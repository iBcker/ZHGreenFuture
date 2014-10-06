//
//  SecondCatagoryModel.m
//  ZHGreenFuture
//
//  Created by elvis on 8/31/14.
//  Copyright (c) 2014 ZHiteam. All rights reserved.
//

#import "SecondCatagoryModel.h"

@implementation SecondCatagoryModel

+(id)praserModelWithInfo:(id)info{
    SecondCatagoryModel* model = [[SecondCatagoryModel alloc]init];
    
    if (![info isKindOfClass:[NSDictionary class]]){
        return model;
    }
    
    NSDictionary* dic = (NSDictionary*)info;
    
    model.page = 0;
    model.lastPage = NO;
    
    model.title = dic[@"name"];
    if (isEmptyString(model.title)){
        model.title = dic[@"title"];
    }
    
    model.categoryId = [NSString stringWithFormat:@"%d",[dic[@"categoryId"]intValue]];
    
    model.descript = dic[@"description"];
    if (isEmptyString(model.descript)){
        model.descript = dic[@"subTitle"];
    }
    
    model.imageUrl = dic[@"backgourndImageUrl"];
    
    model.lastPage = [dic[@"lastPage"] boolValue];
    
    if ([dic[@"productList"] isKindOfClass:[NSArray class]]){
        NSArray* infoArray = (NSArray*)dic[@"productList"];
        NSMutableArray* array = [[NSMutableArray alloc] initWithCapacity:infoArray.count];
        
        for (id val in infoArray){
            if ([val isKindOfClass:[NSDictionary class]]){
                ZHProductItem* item = (ZHProductItem*)[ZHProductItem praserModelWithInfo:val];
                if (item){
                    [array addObject:item];
                }
            }
        }
        [model setData:array];
    }
    
    return model;
}

#pragma -mark CategoryPageingDelegate
-(BOOL)isLastPage{
    return self.lastPage;
}

-(NSInteger)currentPage{
    return self.page;
}

-(void)setCurrentPage:(NSInteger)page{
    self.page = page;
}

-(void)setLastPage:(BOOL)bLastPage{
    _lastPage = bLastPage;
}

-(void)appendData:(NSArray*)data{
    if (!self.dataItems){
        [self setData:data];
    }
    else{
        [self.dataItems addObjectsFromArray:data];
    }
}

-(void)setData:(NSArray*)data{
    if (!data){
        self.dataItems = nil;
    }
    else{
        self.dataItems = [NSMutableArray arrayWithArray:data];
    }
}

-(NSArray *)datas{
    return self.dataItems;
}

-(NSString *)categoryIdentify{
    return self.categoryId;
}
@end
