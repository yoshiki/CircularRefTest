#import "SomeLabel.h"

@implementation SomeLabel

- (void)dealloc
{
    NSLog(@"dealloc %@", NSStringFromClass([self class]));
}

@end
