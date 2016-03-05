//
//  LineNumberView.m
//  NYC Subway Lines
//
//  Created by Emma Steimann on 2/21/16.
//  Copyright © 2016 Emma Steimann. All rights reserved.
//

#import "LineNumberView.h"
@interface LineNumberView ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation LineNumberView

- (void)awakeFromNib {
  self.label = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 130, 130)];
  [self.label setText:self.letter];
  [self.label setTextColor:[UIColor whiteColor]];
  [self.label setFont:[UIFont systemFontOfSize:100.0f]];
  [self.label setCenter:CGPointMake(self.center.x, self.center.y - 30)];
  [self addSubview:self.label];
}

-(void)layoutSubviews{
  [super layoutSubviews];
  [self.label setText:self.letter];
  
  
}

- (void)drawRect:(CGRect)rect
{
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  CGContextAddEllipseInRect(ctx, rect);
  UIColor *color = [UIColor whiteColor];
  if (self.hexColor) {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:self.hexColor];
    [scanner scanHexInt:&rgbValue];
    color = [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
  }
  CGContextSetFillColor(ctx, CGColorGetComponents([color CGColor]));
  CGContextFillPath(ctx);
}
@end
