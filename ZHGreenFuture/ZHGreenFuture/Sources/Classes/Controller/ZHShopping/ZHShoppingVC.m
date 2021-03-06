//
//  ZHShoppingVC.m
//  ZHGreenFuture
//
//  Created by admin on 14-8-30.
//  Copyright (c) 2014年 ZHiteam. All rights reserved.
//

#import "ZHShoppingVC.h"
#import "ZHShoppingCatagory.h"

@interface ZHShoppingVC ()

@property (nonatomic,strong) ZHShoppingCatagory*    catagory;
@end

@implementation ZHShoppingVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadContent];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.catagory loadRequest];
}

-(void)loadContent{
    
    [self.navigationBar setTitle:@"粮仓分类"];
    
    [self.view addSubview:self.catagory];
}

-(ZHShoppingCatagory *)catagory{
    if(!_catagory){
        _catagory = [[ZHShoppingCatagory alloc]initWithFrame:self.contentBounds];
    }
    
    return _catagory;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
