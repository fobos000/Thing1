//
//  InspectionLayer.m
//  Thing1
//
//  Created by Ostap Horbach on 9/23/14.
//  Copyright (c) 2014 Ostap Horbach. All rights reserved.
//

#import "InspectionLayer.h"

@implementation InspectionLayer

- (void)addAnimation:(CAAnimation *)anim forKey:(NSString *)key
{
    NSLog(@"adding animation: %@", [anim debugDescription]);
    [super addAnimation:anim forKey:key];
}

@end
