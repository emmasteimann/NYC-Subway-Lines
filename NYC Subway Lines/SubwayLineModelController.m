//
//  SubwayLineModelController.m
//  NYC Subway Lines
//
//  Created by Emma Steimann on 2/21/16.
//  Copyright © 2016 Emma Steimann. All rights reserved.
//

#import "SubwayLineModelController.h"
#import "SubwayLine.h"

@interface SubwayLineModelController ()
@end

@implementation SubwayLineModelController

+ (SubwayLineModelController *)sharedInstance {
  static SubwayLineModelController *sharedInstance = nil;
  static dispatch_once_t onceToken;
  
  dispatch_once(&onceToken, ^{
    sharedInstance = [[self alloc] init];
  });
  
  return sharedInstance;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    self.subwayModels = [self retrieveSubwayLinesData];
  }
  return self;
}


- (NSArray *)retrieveSubwayLinesData {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"subway-lister" ofType:@"json"];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
  
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSMutableArray *allSubwayModels = [NSMutableArray array];
  
    NSArray *lines = [jsonDictionary objectForKey:@"lines"];
    for(NSDictionary *lineInformation in lines) {
      SubwayLine *line = [[SubwayLine alloc] initWithJSONDictionary:lineInformation];
      [allSubwayModels addObject:line];
    }
    return allSubwayModels;
}

- (NSUInteger)count {
  return self.subwayModels.count;
}

- (SubwayLine *)modelAtIndex:(NSUInteger)index {
  if (index > self.subwayModels.count-1) {
    return nil;
  }
  return self.subwayModels[index];
}

@end
