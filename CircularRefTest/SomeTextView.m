#import "SomeTextView.h"

@implementation SomeTextView

- (void)dealloc
{
    NSLog(@"dealloc %@", NSStringFromClass([self class]));
}

@end
