#import "CircularReferenceViewController.h"
#import "SomeView.h"

@interface CircularReferenceViewController ()

@property (nonatomic, copy) void (^block)();
@property (nonatomic, strong) SomeView *someView;

@end

@implementation CircularReferenceViewController

- (void)dealloc
{
    NSLog(@"dealloc %@", NSStringFromClass([self class]));
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Recycle reference";

// Recycle reference occured
//    self.block = ^{
//        self.someView = [[SomeView alloc] initWithFrame:(CGRect){ 0, 0, 100, 100 }];
//        self.someView.backgroundColor = [UIColor greenColor];
//        [self.view addSubview:self.someView];
//    };

    __weak typeof(self) weakSelf = self;
    self.block = ^{
        weakSelf.someView = [[SomeView alloc] initWithFrame:(CGRect){ 0, 0, 100, 100 }];
        weakSelf.someView.backgroundColor = [UIColor greenColor];
        [weakSelf.view addSubview:weakSelf.someView];
    };
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.block();
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
