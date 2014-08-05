#import "BlocksKitViewController.h"
#import "SomeLabel.h"
#import <BlocksKit/BlocksKit+UIKit.h>

@interface BlocksKitViewController ()

@property (nonatomic, strong) SomeLabel *label;

@end

@implementation BlocksKitViewController

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
    self.title = @"BlocksKit";
    
    UIAlertView *alert = [[UIAlertView alloc] bk_initWithTitle:@"Title" message:@"Message"];
    [alert bk_addButtonWithTitle:@"OK" handler:^{
        self.label.text = @"It's OK!";
        [self.label sizeToFit];
    }];
    [alert show];
}

@end
