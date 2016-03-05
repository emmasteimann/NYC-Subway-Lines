//
//  SubwayLinesTableViewController.m
//  NYC Subway Lines
//
//  Created by Emma Steimann on 2/21/16.
//  Copyright © 2016 Emma Steimann. All rights reserved.
//

#import "SubwayLinesTableViewController.h"
#import "SubwayLineModelController.h"
#import "SubwayLineTableCell.h"

@interface SubwayLinesTableViewController ()
@property (nonatomic, strong) SubwayLineModelController *modelController;
@end

@implementation SubwayLinesTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadSubwayLines];
}

- (void)loadSubwayLines {
  self.modelController = [SubwayLineModelController sharedInstance];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.modelController.count;
}

- (SubwayLineTableCell *)tableView:(UITableView *)tableView
             cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  
  SubwayLine *subwayLine = [self.modelController modelAtIndex:indexPath.row];
  
  static NSString* cellIdentifier = @"SubwayLineTableCell";
  SubwayLineTableCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (cell == nil) {
    cell = [[SubwayLineTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
  }
  
  [cell setSubwayLine:subwayLine];
  return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  SubwayLine *subwayLine = [self.modelController modelAtIndex:indexPath.row];
  NSString *text = subwayLine.desc;
  
  CGSize constraint = CGSizeMake(360, 20000.0f);
  CGSize size;
  
  NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
  CGSize boundingBox = [text boundingRectWithSize:constraint
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                context:context].size;
  
  size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));

  return size.height + 200;
}

@end
