//
// ServerConfig.m
//  Wallet
//
//  All rights reserved.
//

#import "ServerConfig.h"
#import "WalletMgr.h"

@import Vsys;

static NSString *const MainnetHost = @"https://qb.t.top/api";
static NSString *const TestnetHost = @"https://testqb.t.top/api";

@implementation ServerConfig

+ (NSString *)ApiHost {
    if ([WalletMgr.shareInstance.network isEqualToString:NetworkMainnet]) {
        return MainnetHost;
    } else {
        return TestnetHost;
    }
}

@end
