//
//  SubwayLine.m
//  NYC Subway Lines
//
//  Created by Emma Steimann on 2/21/16.
//  Copyright © 2016 Emma Steimann. All rights reserved.
//

#import "SubwayLine.h"

@implementation SubwayLine
- (instancetype)initWithJSONDictionary:(NSDictionary *)lineInformation {
  self = [super init];
  if (self) {
    [self setValuesForKeysWithDictionary:lineInformation];
  }
  return self;
}
@end
