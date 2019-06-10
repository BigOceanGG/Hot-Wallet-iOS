//
//  CellItem.h
//  Wallet
//
//  All rights reserved.
//

#import <Foundation/Foundation.h>

#define VCellItem(cellId, cellType, cellTitle, cellIcon, cellDesc, cellDict, cellImage ) [[CellItem alloc] initWithIdentifier:cellId type:cellType title:cellTitle icon:(NSString *)cellIcon desc:cellDesc other:cellDict image:(NSString *)cellImage]

NS_ASSUME_NONNULL_BEGIN

@interface CellItem : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSDictionary *dict;

- (instancetype)initWithIdentifier: (NSString *)identifier type:(NSString *)type title: (NSString *)title icon:(NSString *)icon desc: (NSString *)desc other: (NSDictionary *)dict image: (NSString *)image;

@end

NS_ASSUME_NONNULL_END
