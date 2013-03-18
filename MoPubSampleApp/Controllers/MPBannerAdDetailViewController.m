//
//  MPBannerAdDetailViewController.m
//  MoPubSampleApp
//
//  Created by pivotal on 3/18/13.
//  Copyright (c) 2013 MoPub. All rights reserved.
//

#import "MPBannerAdDetailViewController.h"
#import "MPBannerAdInfo.h"
#import "MPSampleAppInstanceProvider.h"

@interface MPBannerAdDetailViewController ()

@property (nonatomic, strong) MPBannerAdInfo *info;
@property (nonatomic, strong) MPAdView *adView;

@end

@implementation MPBannerAdDetailViewController

- (id)initWithBannerAdInfo:(MPBannerAdInfo *)info
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.info = info;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Banner";
    self.titleLabel.text = self.info.title;
    self.IDLabel.text = self.info.ID;

    self.adView = [[MPSampleAppInstanceProvider sharedProvider] buildMPAdViewWithAdUnitID:self.info.ID
                                                                                     size:MOPUB_BANNER_SIZE];
    self.adView.delegate = self;
    [self.adViewContainer addSubview:self.adView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self.adView loadAd];
}

#pragma mark - <MPAdViewDelegate>

- (UIViewController *)viewControllerForPresentingModalView
{
    return self;
}

@end