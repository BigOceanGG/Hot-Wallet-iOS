//
//  Wallet.h
//  Wallet
//
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

static NSString* const NetworkMainnet = @";";
static NSString* const NetworkTestnet = @"T";

static NSString* const AddressVersion = @"29";

@import Vsys;

NS_ASSUME_NONNULL_BEGIN

@interface WalletMgr : NSObject

@property (nonatomic, strong, nullable) VsysWallet *wallet;

@property (nonatomic, copy, nullable) NSString *seed;

@property (nonatomic, copy, nullable) NSString *salt;

@property (nonatomic, copy, nullable) NSString *network;

@property (nonatomic, copy, nullable) NSArray *accountSeeds;

@property (nonatomic, copy, nullable) NSArray <Account *> *accounts;

@property (nonatomic, copy, nullable) NSArray <Account *> *monitorAccounts;

@property (nonatomic, assign) NSInteger nonce;

@property (nonatomic, copy, nullable) NSString *password;

@property (nonatomic, copy, nullable) NSData *securePassword;



+ (instancetype)shareInstance;

- (BOOL)checkWalletBackup;

- (NSError *)loadWallet:(NSString *)password;

- (NSError *)saveToStorage;

- (NSError *)logoutWallet;

- (NSString *)createAddress:(NSString *)seed : (NSInteger)nonce : (NSString *)network :(NSString *)version;

- (NSString *)createAddress:(NSString* )network : (NSString *)publicKey : (NSString *)version;

- (BOOL)validateAddress:(NSString* )address;

- (NSString *)getNetworkFromAddress:(NSString*)address;

- (NSString *)networkDescription;

- (NSError *)generateSalt:(NSString *)password;

- (void)clearPropertyValue;

- (void)deleteMonitorAccount:(Account *)account;

- (BOOL)addMonitorAccount:(Account *)account;
@end

NS_ASSUME_NONNULL_END
