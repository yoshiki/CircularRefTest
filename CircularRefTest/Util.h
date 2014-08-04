#import <Foundation/Foundation.h>

@interface Util : NSObject

+ (instancetype)sharedObject;

- (void)safeMethod:(void (^)())block;
- (void)unsafeMethod:(void (^)())block;

@end
