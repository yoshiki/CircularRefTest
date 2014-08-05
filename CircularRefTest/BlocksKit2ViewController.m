#import "BlocksKit2ViewController.h"
#import "SomeLabel.h"
#import <BlocksKit/BlocksKit+UIKit.h>

@interface BlocksKit2ViewController ()

@property (nonatomic, strong) SomeLabel *label;

@end

@implementation BlocksKit2ViewController

- (void)dealloc
{
    NSLog(@"dealloc %@", NSStringFromClass([self class]));
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.label = [[SomeLabel alloc] initWithFrame:(CGRect){ 100, 100, 100, 100 }];
    self.label.text = @"Not OK";
    [self.label sizeToFit];
    [self.view addSubview:self.label];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"BlocksKit2";
    
    // OK
    __weak typeof(self) weakSelf = self;
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"Button" style:UIBarButtonItemStyleDone handler:^(id sender) {
        weakSelf.label.text = @"It's OK!";
        [weakSelf.label sizeToFit];
    }];
    
    // NG
    //    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] bk_initWithTitle:@"Button" style:UIBarButtonItemStyleDone handler:^(id sender) {
    //        self.label.text = @"Right button tapped!";
    //        [self.label sizeToFit];
    //    }];
    
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

@end
