//
//  ViewController.m
//  TableView
//
//  Created by iOS Wizard on 27/12/22.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) UITableView *tableView ;

@end

@implementation ViewController

NSString *cellId = @"cellId";

- (void)loadView {
  [super loadView];
  self.view = self.tableView ;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.navigationItem.title = @"Apple Event";
  self.navigationController.navigationBar.prefersLargeTitles = YES;
  
  [self setupTableView];
}

-(void) setupTableView {
  self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
  [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:cellId];
  [self.tableView setDelegate:self];
  [self.tableView setDataSource:self];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
  UIListContentConfiguration *content = [cell defaultContentConfiguration];
  
    // Configure content.
  content.text = @"Ready. Set. Code.";
  content.textProperties.font = [UIFont boldSystemFontOfSize:12];
  content.textProperties.color = UIColor.secondaryLabelColor;
  
  content.secondaryText = @"#WWDC22";
  content.secondaryTextProperties.font = [UIFont systemFontOfSize:14];
  content.secondaryTextProperties.color = UIColor.labelColor;
  
  content.image = [UIImage systemImageNamed:@"hammer"];
  
  cell.contentConfiguration = content;
  return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 5;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 5;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  return @"vids";
}

@end
