//
//  MainViewController.m
//  TestLimitTextField
//
//  Created by wangjun on 14-2-28.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"

@interface MainViewController ()
{
    MainView *m_mainView;
}

@property (nonatomic, retain) MainView *mainView;

@end

@implementation MainViewController
@synthesize mainView = m_mainView;

- (void)dealloc
{
    RELEASE_SAFETY(m_mainView);
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    
    self.mainView = [[[MainView alloc] initWithFrame:MAIN_NAV_BOUNDS] autorelease];
    [self.view addSubview:m_mainView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
