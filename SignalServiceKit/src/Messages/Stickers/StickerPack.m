//
//  Copyright (c) 2021 Open Whisper Systems. All rights reserved.
//

#import <SignalServiceKit/SignalServiceKit-Swift.h>
#import <SignalServiceKit/StickerPack.h>

NS_ASSUME_NONNULL_BEGIN

@implementation StickerPackItem

- (instancetype)initWithStickerId:(UInt32)stickerId
                      emojiString:(NSString *)emojiString
                      contentType:(nullable NSString *)contentType
{
    self = [super init];

    if (!self) {
        return self;
    }

    _stickerId = stickerId;
    _emojiString = emojiString;
    if (contentType.length > 0) {
        _contentType = contentType;
    }

    return self;
}

- (StickerInfo *)stickerInfoWithStickerPack:(StickerPack *)stickerPack
{
    return [[StickerInfo alloc] initWithPackId:stickerPack.packId packKey:stickerPack.packKey stickerId:self.stickerId];
}

@end

#pragma mark -

@interface StickerPack ()

@property (nonatomic) BOOL isInstalled;

@end

#pragma mark -

@implementation StickerPack

- (nullable instancetype)initWithCoder:(NSCoder *)coder
{
    return [super initWithCoder:coder];
}

- (instancetype)initWithInfo:(StickerPackInfo *)info
                       title:(nullable NSString *)title
                      author:(nullable NSString *)author
                       cover:(StickerPackItem *)cover
                    stickers:(NSArray<StickerPackItem *> *)items
{
    OWSAssertDebug(info.packId.length > 0);
    OWSAssertDebug(info.packKey.length > 0);
    // Title and empty might be nil or empty.
    OWSAssertDebug(cover);
    OWSAssertDebug(items.count > 0);

    self = [super initWithUniqueId:[StickerPack uniqueIdForStickerPackInfo:info]];

    if (!self) {
        return self;
    }

    _info = info;
    _title = title;
    _author = author;
    _cover = cover;
    _items = items;
    _dateCreated = [NSDate new];

    return self;
}

- (NSData *)packId
{
    return self.info.packId;
}

- (NSData *)packKey
{
    return self.info.packKey;
}

- (StickerInfo *)coverInfo
{
    return [[StickerInfo alloc] initWithPackId:self.packId packKey:self.packKey stickerId:self.cover.stickerId];
}

- (NSArray<StickerInfo *> *)stickerInfos
{
    NSMutableArray<StickerInfo *> *stickerInfos = [NSMutableArray new];
    for (StickerPackItem *item in self.items) {
        [stickerInfos addObject:[item stickerInfoWithStickerPack:self]];
    }
    return stickerInfos;
}

// --- CODE GENERATION MARKER

// This snippet is generated by /Scripts/sds_codegen/sds_generate.py. Do not manually edit it, instead run `sds_codegen.sh`.

// clang-format off

- (instancetype)initWithGrdbId:(int64_t)grdbId
                      uniqueId:(NSString *)uniqueId
                          author:(nullable NSString *)author
                           cover:(StickerPackItem *)cover
                     dateCreated:(NSDate *)dateCreated
                            info:(StickerPackInfo *)info
                     isInstalled:(BOOL)isInstalled
                           items:(NSArray<StickerPackItem *> *)items
                           title:(nullable NSString *)title
{
    self = [super initWithGrdbId:grdbId
                        uniqueId:uniqueId];

    if (!self) {
        return self;
    }

    _author = author;
    _cover = cover;
    _dateCreated = dateCreated;
    _info = info;
    _isInstalled = isInstalled;
    _items = items;
    _title = title;

    return self;
}

// clang-format on

// --- CODE GENERATION MARKER

+ (NSString *)uniqueIdForStickerPackInfo:(StickerPackInfo *)info
{
    return info.asKey;
}

- (void)updateWithIsInstalled:(BOOL)isInstalled transaction:(SDSAnyWriteTransaction *)transaction
{
    [self anyUpdateWithTransaction:transaction
                             block:^(StickerPack *instance) {
                                 instance.isInstalled = isInstalled;
                             }];
}

@end

NS_ASSUME_NONNULL_END
