#import "SharedObjectViewController.h"
#import "Util.h"
#import "SomeView.h"

@interface SharedObjectViewController ()

@property (nonatomic, strong) SomeView *someView;

@end

@implementation SharedObjectViewController

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

- (void)viewDidLoad
{
    [super viewDidLoad];

// OK
//    [[Util sharedObject] safeMethod:^{
//        self.someView = [[SomeView alloc] initWithFrame:(CGRect){ 0, 0, 100, 100 }];
//        self.someView.backgroundColor = [UIColor yellowColor];
//        [self.view addSubview:self.someView];
//    }];

// OK
    __weak typeof(self) weakSelf = self;
    [[Util sharedObject] unsafeMethod:^{
        weakSelf.someView = [[SomeView alloc] initWithFrame:(CGRect){ 0, 0, 100, 100 }];
        weakSelf.someView.backgroundColor = [UIColor yellowColor];
        [weakSelf.view addSubview:weakSelf.someView];
    }];

// NG
//    [[Util sharedObject] unsafeMethod:^{
//        self.someView = [[SomeView alloc] initWithFrame:(CGRect){ 0, 0, 100, 100 }];
//        self.someView.backgroundColor = [UIColor yellowColor];
//        [self.view addSubview:self.someView];
//    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
