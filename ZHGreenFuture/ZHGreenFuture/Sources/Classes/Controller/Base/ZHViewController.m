//
//  HKWFViewController.m
//  Stock4HKWF
//
//  Created by elvis on 13-8-26.
//  Copyright (c) 2013年 HKWF. All rights reserved.
//

#import "ZHViewController.h"
#import "NavigationViewController.h"

@interface ZHViewController ()

-(void)_initNavigationBar;
-(void)addNavigationBar;
@end

@implementation ZHViewController

-(id)init{
    if ((self = [super init])) {
        _animationType = ANIMATE_TYPE_DEFAULT;
        _hasNavitaiongBar = YES;
        
        [self _initNavigationBar];
    }
    
    return self;
}

-(void)loadView{
    [super loadView];
    
    if (!CGRectEqualToRect(self.viewFrame, CGRectZero)) {
        self.view.frame = self.viewFrame;
    }
}

-(void)_back{
    [self.navigationCtl popWithAnimation:self.animationType];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.5];
    self.swipeBack = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(_back)];
    [self.view addGestureRecognizer:self.swipeBack];
    
    if (_hasNavitaiongBar) {
        [self addNavigationBar];
        self.contentBounds = CGRectMake(0, _navigationBar.height, self.view.width, self.view.height-_navigationBar.height);
    }
}

-(void)_initNavigationBar{
    if (!_navigationBar) {
        _navigationBar = [[NavigationBar alloc]initWithFrame:CGRectMake(0, 0, FULL_WIDTH, NAVIGATION_BAR_HEIGHT)];
    }
}

-(void)addNavigationBar{
    
    [self _initNavigationBar];
    
    if (_navigationBar.superview != self.view) {
        [self.view addSubview:_navigationBar];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSUInteger)interfaceOrientations{
    return INTERFACE_ORIENTATIONS;
}

//#if IOS_VERSION_5
-(NSUInteger)supportedInterfaceOrientations{
    return [self interfaceOrientations];
}
//#else
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    NSUInteger interface = [self interfaceOrientations];
    
    return interface&toInterfaceOrientation;
}
//#endif

@end