#import "SomeButton.h"

@implementation SomeButton

- (void)dealloc
{
    NSLog(@"dealloc %@", NSStringFromClass([self class]));
}

@end
