#import "Util.h"

@interface Util ()

@property (nonatomic, copy) void (^block)();

@end

@implementation Util

+ (instancetype)sharedObject
{
    static Util *_sharedObject;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedObject = [[Util alloc] init];
    });
    return _sharedObject;
}

- (void)safeMethod:(void (^)())block
{
    if (block) {
        block();
    }
}

- (void)unsafeMethod:(void (^)())block
{
    self.block = block;
    if (self.block) {
        self.block();
    }
}

@end
