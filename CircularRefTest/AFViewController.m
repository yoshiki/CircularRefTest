#import "AFViewController.h"
#import "SomeTextView.h"
#import <AFNetworking/AFNetworking.h>

@interface AFViewController ()

@property (nonatomic, strong) SomeTextView *textView;

@end

@implementation AFViewController

- (void)dealloc
{
    NSLog(@"dealloc %@", NSStringFromClass([self class]));
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];

    self.textView = [[SomeTextView alloc] initWithFrame:self.view.bounds];
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.textView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Using AFNetworking";

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://echo.jsontest.com/key/value/one/two" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.textView.text = [NSString stringWithFormat:@"%@", responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //
    }];
}

@end
