#import "EnumerateViewController.h"
#import "SomeLabel.h"

@interface EnumerateViewController ()

@property (nonatomic, strong) NSMutableArray *arr;
@property (nonatomic, strong) SomeLabel *label;
@property (nonatomic, assign) NSInteger sum;

@end

@implementation EnumerateViewController

- (void)dealloc
{
    NSLog(@"dealloc %@", NSStringFromClass([self class]));
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.sum = 0;

    self.label = [[SomeLabel alloc] initWithFrame:(CGRect){ 100, 100, 0, 0 }];
    self.label.text = @"Nan";
    [self.label sizeToFit];
    
    [self.view addSubview:self.label];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Enumerate";
    
    self.arr = [[NSMutableArray alloc] init];
    [self.arr addObject:@(1)];
    [self.arr addObject:@(2)];
    [self.arr addObject:@(3)];
    
    [self.arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        self.sum += [obj integerValue];
        self.label.text = [NSString stringWithFormat:@"%d", self.sum];
    }];
}

@end
