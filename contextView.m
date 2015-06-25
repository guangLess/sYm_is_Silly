//
//  contextView.m
//  TEST_5
//
//  Created by Aditya Narayan on 6/9/15.
//  Copyright (c) 2015 Guang. All rights reserved.
//

#import "contextView.h"

@implementation contextView


-(void) drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextMoveToPoint(context, self.lin2Ox+1, self.lin2Oy+1);
    CGContextAddLineToPoint(context, self.linOx+1, self.linOy+1);
    CGContextAddLineToPoint(context, self.ww, self.wh);
    CGContextStrokePath(context);
}


@end
