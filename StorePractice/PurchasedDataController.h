//
//  PurchasedDataController.h
//  StorePractice
//
//  Created by Skyler Tanner on 8/31/15.
//  Copyright © 2015 Skyler Tanner. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSString *const kPurchasedContentUpdated = @"kPurchasedContentUpdated";

@interface PurchasedDataController : NSObject

@property (assign, nonatomic, readonly) BOOL adsRemoved;
//@property (strong, nonatomic, readonly) NSNumber *goldCoins;

+ (PurchasedDataController *)sharedInstance;

@end
