#import "RecycleReferenceViewController.h"
#import "SomeView.h"

@interface RecycleReferenceViewController ()

@property (nonatomic, copy) void (^block)();
@property (nonatomic, strong) SomeView *someView;

@end

@implementation RecycleReferenceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"dealloc %@", NSStringFromClass([self class]));
}

- (void)loadView
{
    [super loadView];

    self.title = @"Recycle reference";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

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
