//
//  PresentedViewController.m
//  swiftolddriver-modalpresentation-demo
//
//  Created by 汪泽伟 on 2021/6/26.
//

#import "PresentedViewController.h"

@interface PresentedViewController ()
@property (nonatomic, strong) UIButton *closeButton;
@end

@implementation PresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.systemPurpleColor;
    
    self.closeButton = [UIButton buttonWithType:UIButtonTypeClose];
    self.closeButton.frame = (CGRect){
        .origin.x = (CGRectGetWidth(self.view.bounds) - 44)/2.0f,
        .origin.y = 100.f,
        .size.width = 44.f,
        .size.height = 44.f
    };
    [self.view addSubview:self.closeButton];
    
    [self.closeButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
}

- (void)close {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"presented %@", NSStringFromSelector(_cmd));
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"presented %@", NSStringFromSelector(_cmd));
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"presented %@", NSStringFromSelector(_cmd));
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"presented %@", NSStringFromSelector(_cmd));
}

@end
