//
//  Copyright (c) 2021 Open Whisper Systems. All rights reserved.
//

#import <SignalServiceKit/BaseModel.h>

NS_ASSUME_NONNULL_BEGIN

@class SignalServiceAddress;

@interface TSGroupMember : BaseModel

@property (nonatomic, readonly) SignalServiceAddress *address;
@property (nonatomic, readonly) NSString *groupThreadId;
@property (nonatomic, readonly) uint64_t lastInteractionTimestamp;


+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (nullable instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;
- (instancetype)initWithUniqueId:(NSString *)uniqueId NS_UNAVAILABLE;
- (instancetype)initWithGrdbId:(int64_t)grdbId uniqueId:(NSString *)uniqueId NS_UNAVAILABLE;
- (instancetype)initWithAddress:(SignalServiceAddress *)address
                  groupThreadId:(NSString *)groupThreadId
       lastInteractionTimestamp:(uint64_t)lastInteractionTimestamp NS_DESIGNATED_INITIALIZER;

// --- CODE GENERATION MARKER

// This snippet is generated by /Scripts/sds_codegen/sds_generate.py. Do not manually edit it, instead run
// `sds_codegen.sh`.

// clang-format off

- (instancetype)initWithGrdbId:(int64_t)grdbId
                      uniqueId:(NSString *)uniqueId
                   groupThreadId:(NSString *)groupThreadId
        lastInteractionTimestamp:(uint64_t)lastInteractionTimestamp
                     phoneNumber:(nullable NSString *)phoneNumber
                      uuidString:(nullable NSString *)uuidString
NS_DESIGNATED_INITIALIZER NS_SWIFT_NAME(init(grdbId:uniqueId:groupThreadId:lastInteractionTimestamp:phoneNumber:uuidString:));

// clang-format on

// --- CODE GENERATION MARKER

- (void)updateWithLastInteractionTimestamp:(uint64_t)lastInteractionTimestamp
                               transaction:(SDSAnyWriteTransaction *)transaction;

@end

NS_ASSUME_NONNULL_END
