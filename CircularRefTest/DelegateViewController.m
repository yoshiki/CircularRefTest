#import "DelegateViewController.h"

@interface DelegateViewController ()

@property (nonatomic, strong) SomeDelegateView *someDelegateView;

@end

@implementation DelegateViewController

- (void)dealloc
{
    NSLog(@"dealloc %@", NSStringFromClass([self class]));
}

- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.someDelegateView = [[SomeDelegateView alloc] initWithFrame:(CGRect){ 0, 0, 100, 100 }];
    self.someDelegateView.backgroundColor = [UIColor redColor];
    self.someDelegateView.delegate = self;
    [self.view addSubview:self.someDelegateView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Delegate";
}

#pragma mark - SomeDelegateViewDelegate methods

- (void)viewDidTap:(SomeDelegateView *)someDelegateView
{
    NSLog(@"Tapped!");
}

@end
