//
// ReceiveSetAmountViewController.h
//  Wallet
//
//  All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReceiveSetAmountViewController : UIViewController

- (instancetype)initWithResult:(void(^)(int64_t amount))result;

@end

NS_ASSUME_NONNULL_END
