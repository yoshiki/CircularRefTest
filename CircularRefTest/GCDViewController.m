#import "GCDViewController.h"
#import "SomeView.h"
#import "SomeButton.h"

@interface GCDViewController ()

@property (nonatomic, strong) SomeView *someView;
@property (nonatomic, strong) SomeButton *someButton;

@end

@implementation GCDViewController

- (void)dealloc
{
    NSLog(@"dealloc %@", NSStringFromClass([self class]));
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.someView = [[SomeView alloc] initWithFrame:(CGRect){ 0, 0, 100, 100 }];
    self.someView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.someView];
    
    self.someButton = [SomeButton buttonWithType:UIButtonTypeRoundedRect];
    [self.someButton setTitle:@"Button" forState:UIControlStateNormal];
    [self.someButton addTarget:self action:@selector(buttonDidPush:) forControlEvents:UIControlEventTouchUpInside];
    [self.someButton sizeToFit];
    CGRect someButtonFrame = self.someButton.frame;
    someButtonFrame.origin.x = 100;
    someButtonFrame.origin.y = 100;
    self.someButton.frame = someButtonFrame;
    [self.view addSubview:self.someButton];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
// OK
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:5];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.someView.backgroundColor = [UIColor blueColor];
        });
    });
}

- (void)buttonDidPush:(id)sender
{
    NSLog(@"Push!");
}

@end
