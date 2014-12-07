//
//  InspectionView.m
//  Thing1
//
//  Created by Ostap Horbach on 9/23/14.
//  Copyright (c) 2014 Ostap Horbach. All rights reserved.
//

#import "InspectionView.h"
#import "InspectionLayer.h"

@implementation InspectionView

+ (Class)layerClass
{
    return [InspectionLayer class];
}

@end
