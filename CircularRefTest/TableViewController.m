#import "TableViewController.h"
#import "CircularReferenceViewController.h"
#import "SharedObjectViewController.h"
#import "DelegateViewController.h"
#import "GCDViewController.h"
#import "AFViewController.h"
#import "BlocksKitViewController.h"
#import "BlocksKit2ViewController.h"

@interface TableViewController ()

@property (nonatomic, strong) NSArray *rows;

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _rows = @[
                  @"Recycle reference",
                  @"Shared Object",
                  @"Delegate",
                  @"GCD",
                  @"Using AFNetworking",
                  @"BlocksKit",
                  @"BlocksKit2",
                  ];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Circular Ref Test";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_rows count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }

    cell.textLabel.text = _rows[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0: {
            CircularReferenceViewController *vc = [[CircularReferenceViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1: {
            SharedObjectViewController *vc = [[SharedObjectViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2: {
            DelegateViewController *vc = [[DelegateViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3: {
            GCDViewController *vc = [[GCDViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 4: {
            AFViewController *vc = [[AFViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 5: {
            BlocksKitViewController *vc = [[BlocksKitViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 6: {
            BlocksKit2ViewController *vc = [[BlocksKit2ViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        default:
            break;
    }
}

@end
