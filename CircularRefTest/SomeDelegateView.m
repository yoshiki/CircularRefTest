#import "SomeDelegateView.h"
#import <BlocksKit/BlocksKit+UIKit.h>

@implementation SomeDelegateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
// OK
//        UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self
//                                                                             action:@selector(tapped:)];

// OK
        __weak typeof(self) weakSelf = self;
        UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] bk_initWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
            if (weakSelf.delegate != nil && [weakSelf.delegate respondsToSelector:@selector(viewDidTap:)]) {
                [weakSelf.delegate viewDidTap:weakSelf];
            }
        }];

// NG
//        UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] bk_initWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
//            if (self.delegate != nil && [self.delegate respondsToSelector:@selector(viewDidTap:)]) {
//                [self.delegate viewDidTap:self];
//            }
//        }];

        [self addGestureRecognizer:gr];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"dealloc %@", NSStringFromClass([self class]));
}

- (void)tapped:(UITapGestureRecognizer *)gr
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(viewDidTap:)]) {
        [self.delegate viewDidTap:self];
    }
}

@end
