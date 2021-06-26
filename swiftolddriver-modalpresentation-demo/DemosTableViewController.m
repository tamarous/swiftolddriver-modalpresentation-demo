//
//  DemosTableViewController.m
//  swiftolddriver-modalpresentation-demo
//
//  Created by 汪泽伟 on 2021/6/26.
//

#import "DemosTableViewController.h"
#import "PresentedViewController.h"

static NSString * const cellReuseIdentifier = @"cellReuseIdentifier";

@interface DemosTableViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign) UIModalPresentationStyle selectedStyle;
@property (nonatomic, copy) NSArray *styles;
@property (nonatomic, copy) NSDictionary *styleToTextDict;
@end

@implementation DemosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Demo";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:cellReuseIdentifier];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@(UIModalPresentationAutomatic)];
    //[array addObject:@(UIModalPresentationNone)];
    [array addObject:@(UIModalPresentationFullScreen)];
    [array addObject:@(UIModalPresentationPageSheet)];
    [array addObject:@(UIModalPresentationFormSheet)];
    [array addObject:@(UIModalPresentationCurrentContext)];
    [array addObject:@(UIModalPresentationCustom)];
    [array addObject:@(UIModalPresentationOverFullScreen)];
    [array addObject:@(UIModalPresentationOverCurrentContext)];
    //[array addObject:@(UIModalPresentationPopover)];
    self.styles = [array copy];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@(UIModalPresentationAutomatic)] = @"UIModalPresentationAutomatic";
    //dict[@(UIModalPresentationNone)] = @"UIModalPresentationNone";
    dict[@(UIModalPresentationFullScreen)] = @"UIModalPresentationFullScreen";
    dict[@(UIModalPresentationPageSheet)] = @"UIModalPresentationPageSheet";
    dict[@(UIModalPresentationFormSheet)] = @"UIModalPresentationFormSheet";
    dict[@(UIModalPresentationCurrentContext)] = @"UIModalPresentationCurrentContext";
    dict[@(UIModalPresentationCustom)] = @"UIModalPresentationCustom";
    dict[@(UIModalPresentationOverFullScreen)] = @"UIModalPresentationOverFullScreen";
    dict[@(UIModalPresentationOverCurrentContext)] = @"UIModalPresentationOverCurrentContext";
    //dict[@(UIModalPresentationPopover)] = @"UIModalPresentationPopover";
    self.styleToTextDict = [dict copy];
    
    NSParameterAssert(self.styles.count == self.styleToTextDict.allKeys.count);
}

#pragma mark -LifeCycle
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"presenting %@", NSStringFromSelector(_cmd));
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"presenting %@", NSStringFromSelector(_cmd));
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"presenting %@", NSStringFromSelector(_cmd));
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"presenting %@", NSStringFromSelector(_cmd));
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.styles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseIdentifier];
    }
    NSString *text = self.styleToTextDict[self.styles[indexPath.row]];
    cell.textLabel.text = text;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UIModalPresentationStyle style = (UIModalPresentationStyle)[self.styles[indexPath.row] intValue];
    if (style == UIModalPresentationOverCurrentContext) {
        self.definesPresentationContext = YES;
    } else {
        self.definesPresentationContext = NO;
    }
    PresentedViewController *presented = [[PresentedViewController alloc] init];
    presented.modalPresentationStyle = style;
    [self presentViewController:presented animated:YES completion:nil];
}


@end
