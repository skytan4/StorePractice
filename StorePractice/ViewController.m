//
//  ViewController.m
//  StorePractice
//
//  Created by Skyler Tanner on 8/31/15.
//  Copyright (c) 2015 Skyler Tanner. All rights reserved.
//

#import "ViewController.h"
@import iAd;

@interface ViewController () <ADBannerViewDelegate>
@property (strong, nonatomic) ADBannerView *adBannerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
    
    self.adBannerView = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
    self.adBannerView.frame = CGRectMake(0,-50, self.adBannerView.frame.size.width, self.adBannerView.frame.size.height);
    [self.view addSubview:self.adBannerView];
    self.adBannerView.delegate = self;
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    [UIView animateWithDuration:1.0 animations:^{
        banner.frame = CGRectMake(0, 0, banner.frame.size.width, banner.frame.size.height);
    }];
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    [UIView animateWithDuration:1.0 animations:^{
        banner.frame = CGRectMake(0, -50, banner.frame.size.width, banner.frame.size.height);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
