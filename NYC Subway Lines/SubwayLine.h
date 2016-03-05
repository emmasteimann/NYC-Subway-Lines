//
//  SubwayLine.h
//  NYC Subway Lines
//
//  Created by Emma Steimann on 2/21/16.
//  Copyright © 2016 Emma Steimann. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubwayLine : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *hexcolor;
@property (nonatomic, strong) NSString *letter;
@property (nonatomic, strong) NSString *desc;
- (instancetype)initWithJSONDictionary:(NSDictionary *)lineInformation;
@end
