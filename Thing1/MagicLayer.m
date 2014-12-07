//
//  MagicLayer.m
//  Thing1
//
//  Created by Ostap Horbach on 9/23/14.
//  Copyright (c) 2014 Ostap Horbach. All rights reserved.
//

#import "MagicLayer.h"

@implementation MagicLayer

- (void)drawInContext:(CGContextRef)ctx
{
    CGContextSetFillColorWithColor(ctx, self.color.CGColor);
    CGContextFillEllipseInRect(ctx, self.bounds);
}

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:@"bounds"])
        return YES;
    return [super needsDisplayForKey:key];
}

@end
