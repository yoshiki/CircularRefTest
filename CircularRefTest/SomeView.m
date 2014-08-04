#import "SomeView.h"

@implementation SomeView

- (void)dealloc
{
    NSLog(@"dealloc %@", NSStringFromClass([self class]));
}

@end
