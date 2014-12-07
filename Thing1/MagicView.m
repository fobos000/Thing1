//
//  MagicView.m
//  Thing1
//
//  Created by Ostap Horbach on 9/17/14.
//  Copyright (c) 2014 Ostap Horbach. All rights reserved.
//

#import "MagicView.h"
#import "MagicLayer.h"

@interface MagicView ()

@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer;

@end

@implementation MagicView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.multipleTouchEnabled = YES;
    }
    return self;
}

- (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    return color;
}

- (void)tapRecognized:(UITapGestureRecognizer *)recognizer
{
    CGPoint tappedPoint = [recognizer locationInView:self];
    [self animateTouchAtPoint:tappedPoint];
}

- (void)animateTouchAtPoint:(CGPoint)point
{
    MagicLayer *circleLayer = [[MagicLayer alloc] init];
    circleLayer = [[MagicLayer alloc] init];
    
    CGSize  initialSize = CGSizeMake(40, 40);
    circleLayer.needsDisplayOnBoundsChange = YES;
    circleLayer.color = [self randomColor];
    
    CGPoint circleOrigin;
    circleOrigin.x = point.x - initialSize.width / 2;
    circleOrigin.y = point.y - initialSize.height / 2;
    
    CGRect circleFrame;
    circleFrame.origin = circleOrigin;
    circleFrame.size = initialSize;
    circleLayer.frame = circleFrame;
    
    if (![self.layer.sublayers containsObject:circleLayer]) {
        [self.layer addSublayer:circleLayer];
        [circleLayer setNeedsDisplay];
        
        CGSize targetSize = CGSizeMake(self.window.bounds.size.height * 2, self.window.bounds.size.height * 2);
        
        CABasicAnimation *frameAnimation = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
        frameAnimation.fillMode = kCAFillModeBoth;
        frameAnimation.duration = 1.0;
        frameAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        frameAnimation.fromValue = [NSValue valueWithCGSize:circleLayer.bounds.size];
        frameAnimation.delegate = self;
        [frameAnimation setValue:circleLayer forKey:@"animationLayer"];
        [circleLayer addAnimation:frameAnimation forKey:nil];
        
        circleLayer.bounds = CGRectMake(circleOrigin.x, circleOrigin.y, targetSize.width, targetSize.height);
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSArray *sublayers = self.layer.sublayers;
    if (self.layer.sublayers.count > 1) {
        CALayer *bottomLayer = [sublayers firstObject];
        [bottomLayer removeFromSuperlayer];
    }
}

- (void)drawCircleAtPoint:(CGPoint)point context:(CGContextRef)context
{
    CGSize size = CGSizeMake(40, 40);
    CGFloat lineWidth = 1.0;
    
    CGLayerRef layer = CGLayerCreateWithContext(context, size, NULL);
    
    CGContextRef layerContext = CGLayerGetContext(layer);
    
    CGContextSetLineWidth(layerContext, lineWidth);
    CGContextSetStrokeColorWithColor(layerContext,
                                     [UIColor blueColor].CGColor);
    CGContextSetFillColorWithColor(layerContext,
                                   [UIColor blueColor].CGColor);
    
    CGRect rectangle = CGRectMake(0 + lineWidth,
                                  0 + lineWidth,
                                  size.width - 2 * lineWidth,
                                  size.height - 2 * lineWidth);
    
    CGContextFillEllipseInRect(layerContext, rectangle);
    
    CGFloat x = point.x - size.width / 2;
    CGFloat y = point.y - size.height / 2;
    
    CGContextDrawLayerAtPoint(context, CGPointMake(x, y), layer);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        CGPoint locationInView = [touch locationInView:self];
        [self animateTouchAtPoint:locationInView];
    }
}

@end
