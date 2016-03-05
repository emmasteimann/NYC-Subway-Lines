//
//  SubwayLineTableCell.m
//  NYC Subway Lines
//
//  Created by Emma Steimann on 2/21/16.
//  Copyright © 2016 Emma Steimann. All rights reserved.
//

#import "SubwayLineTableCell.h"


@implementation SubwayLineTableCell
- (void)setSubwayLine:(SubwayLine *)subwayLine {
  self.cellSubwayLine = subwayLine;
  if (![self.cellSubwayLine.name isEqualToString:@""]) {
    self.lineTitle.text = self.cellSubwayLine.name;
  }
  
  if (![self.cellSubwayLine.desc isEqualToString:@""]) {
    self.lineDescription.text = self.cellSubwayLine.desc;
  }
  
  if (![self.cellSubwayLine.letter isEqualToString:@""] && ![self.cellSubwayLine.hexcolor isEqualToString:@""]) {
    self.lineNumber.letter = self.cellSubwayLine.letter;
    self.lineNumber.hexColor = self.cellSubwayLine.hexcolor;
    [self.lineNumber layoutSubviews];
    [self.lineNumber setNeedsDisplay];
  }
  
}

@end
