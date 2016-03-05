//
//  SubwayLineModelController.h
//  NYC Subway Lines
//
//  Created by Emma Steimann on 2/21/16.
//  Copyright © 2016 Emma Steimann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubwayLine.h"

@interface SubwayLineModelController : NSObject
@property (nonatomic, strong) NSArray *subwayModels;

+ (SubwayLineModelController *)sharedInstance;
- (NSUInteger)count;
- (SubwayLine *)modelAtIndex:(NSUInteger)index;

@end
