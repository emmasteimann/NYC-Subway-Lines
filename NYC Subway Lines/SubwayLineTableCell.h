//
//  SubwayLineTableCell.h
//  NYC Subway Lines
//
//  Created by Emma Steimann on 2/21/16.
//  Copyright © 2016 Emma Steimann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubwayLine.h"
#import "LineNumberView.h"

@interface SubwayLineTableCell : UITableViewCell
@property (nonatomic, strong) SubwayLine *cellSubwayLine;

@property (weak, nonatomic) IBOutlet UILabel *lineTitle;
@property (weak, nonatomic) IBOutlet UILabel *lineDescription;
@property (weak, nonatomic) IBOutlet LineNumberView *lineNumber;

- (void)setSubwayLine:(SubwayLine *)subwayLine;

@end
