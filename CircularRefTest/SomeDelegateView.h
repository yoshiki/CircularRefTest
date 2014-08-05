#import <UIKit/UIKit.h>

@class SomeDelegateView;

@protocol SomeDelegateViewDelegate <NSObject>

- (void)viewDidTap:(SomeDelegateView *)someDelegateView;

@end

@interface SomeDelegateView : UIView

@property (nonatomic, weak) id<SomeDelegateViewDelegate> delegate;
// NG
//@property (nonatomic, strong) id<SomeDelegateViewDelegate> delegate;

@end
