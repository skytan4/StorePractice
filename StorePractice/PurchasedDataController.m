//
//  PurchasedDataController.m
//  StorePractice
//
//  Created by Skyler Tanner on 8/31/15.
//  Copyright © 2015 Skyler Tanner. All rights reserved.
//

#import "PurchasedDataController.h"
#import "StorePurchaseController.h"

static NSString * const kAdsRemovedKey = @"kAdsRemovedKey";
@interface PurchasedDataController()
@property (assign, nonatomic) BOOL adsRemoved;
@end

@implementation PurchasedDataController

+ (PurchasedDataController *)sharedInstance {
    static PurchasedDataController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PurchasedDataController new];
        [sharedInstance loadFromDefaults];
        [sharedInstance registerForNotifications];
    });
    return sharedInstance;
}

- (void)registerForNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(purchaseNotificationFired:) name:kInAppPurchaseCompletedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(purchaseNotificationFired:) name:kInAppPurchaseCompletedNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)loadFromDefaults {
    self.adsRemoved = [[NSUserDefaults standardUserDefaults]boolForKey:kAdsRemovedKey];
}

- (void) purchaseNotificationFired:(NSNotification *)notification {
    NSString *productID = notification.userInfo[kProductIDKey];
    
    if ([productID isEqualToString:@""]) {
        self.adsRemoved = YES;
        
        //store in NSUserDefaults in case they dont have internet
        [[NSUserDefaults standardUserDefaults] setBool:self.adsRemoved forKey:kAdsRemovedKey];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kPurchasedContentUpdated object:nil];
}



@end
