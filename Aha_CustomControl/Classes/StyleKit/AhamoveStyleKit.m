//
//  AhamoveStyleKit.m
//  Ahamove
//
//  Created by DuongNgo on 12/30/17.
//  Copyright (c) 2017 Ahamove. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import "AhamoveStyleKit.h"


@implementation AhamoveStyleKit

#pragma mark Initialization

+ (void)initialize
{
}

#pragma mark Drawing Methods

+ (void)drawMapDestIconWithFrame: (CGRect)frame pin_color: (UIColor*)pin_color text_color: (UIColor*)text_color number: (NSString*)number fontSize: (CGFloat)fontSize
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* fillColor2 = [UIColor colorWithRed: 0.682 green: 0.656 blue: 0.634 alpha: 0.2];
    UIColor* fillColor4 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];


    //// Subframes
    CGRect pin_origin = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame) - 0.02);


    //// pin_origin
    {
        //// bounds Drawing


        //// path206 Drawing
        UIBezierPath* path206Path = [UIBezierPath bezierPath];
        [path206Path moveToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.69528 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.71767 * CGRectGetHeight(pin_origin))];
        [path206Path addCurveToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.42918 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.79773 * CGRectGetHeight(pin_origin)) controlPoint1: CGPointMake(CGRectGetMinX(pin_origin) + 0.57996 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.71767 * CGRectGetHeight(pin_origin)) controlPoint2: CGPointMake(CGRectGetMinX(pin_origin) + 0.46082 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.75352 * CGRectGetHeight(pin_origin))];
        [path206Path addCurveToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.53600 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.87583 * CGRectGetHeight(pin_origin)) controlPoint1: CGPointMake(CGRectGetMinX(pin_origin) + 0.40187 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.83588 * CGRectGetHeight(pin_origin)) controlPoint2: CGPointMake(CGRectGetMinX(pin_origin) + 0.44861 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.86779 * CGRectGetHeight(pin_origin))];
        [path206Path addCurveToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.54194 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.88501 * CGRectGetHeight(pin_origin)) controlPoint1: CGPointMake(CGRectGetMinX(pin_origin) + 0.54716 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.87686 * CGRectGetHeight(pin_origin)) controlPoint2: CGPointMake(CGRectGetMinX(pin_origin) + 0.54395 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.88024 * CGRectGetHeight(pin_origin))];
        [path206Path addLineToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.49320 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 1.00000 * CGRectGetHeight(pin_origin))];
        [path206Path addLineToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.60743 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.88665 * CGRectGetHeight(pin_origin))];
        [path206Path addCurveToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.62734 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.87590 * CGRectGetHeight(pin_origin)) controlPoint1: CGPointMake(CGRectGetMinX(pin_origin) + 0.61207 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.88204 * CGRectGetHeight(pin_origin)) controlPoint2: CGPointMake(CGRectGetMinX(pin_origin) + 0.61533 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.87686 * CGRectGetHeight(pin_origin))];
        [path206Path addCurveToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.84677 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.79773 * CGRectGetHeight(pin_origin)) controlPoint1: CGPointMake(CGRectGetMinX(pin_origin) + 0.72655 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.86796 * CGRectGetHeight(pin_origin)) controlPoint2: CGPointMake(CGRectGetMinX(pin_origin) + 0.81940 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.83598 * CGRectGetHeight(pin_origin))];
        [path206Path addCurveToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.69528 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.71767 * CGRectGetHeight(pin_origin)) controlPoint1: CGPointMake(CGRectGetMinX(pin_origin) + 0.87842 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.75352 * CGRectGetHeight(pin_origin)) controlPoint2: CGPointMake(CGRectGetMinX(pin_origin) + 0.81059 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.71767 * CGRectGetHeight(pin_origin))];
        [path206Path closePath];
        path206Path.miterLimit = 4;

        path206Path.usesEvenOddFillRule = YES;

        [fillColor2 setFill];
        [path206Path fill];


        //// path218 Drawing
        UIBezierPath* path218Path = [UIBezierPath bezierPath];
        [path218Path moveToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.49824 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.00000 * CGRectGetHeight(pin_origin))];
        [path218Path addCurveToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.21548 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.28337 * CGRectGetHeight(pin_origin)) controlPoint1: CGPointMake(CGRectGetMinX(pin_origin) + 0.34207 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.00000 * CGRectGetHeight(pin_origin)) controlPoint2: CGPointMake(CGRectGetMinX(pin_origin) + 0.21548 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.12687 * CGRectGetHeight(pin_origin))];
        [path218Path addCurveToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.43585 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.55979 * CGRectGetHeight(pin_origin)) controlPoint1: CGPointMake(CGRectGetMinX(pin_origin) + 0.21548 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.41838 * CGRectGetHeight(pin_origin)) controlPoint2: CGPointMake(CGRectGetMinX(pin_origin) + 0.30970 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.53133 * CGRectGetHeight(pin_origin))];
        [path218Path addCurveToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.45277 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.59226 * CGRectGetHeight(pin_origin)) controlPoint1: CGPointMake(CGRectGetMinX(pin_origin) + 0.45196 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.56343 * CGRectGetHeight(pin_origin)) controlPoint2: CGPointMake(CGRectGetMinX(pin_origin) + 0.45088 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.57539 * CGRectGetHeight(pin_origin))];
        [path218Path addLineToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.49824 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.99926 * CGRectGetHeight(pin_origin))];
        [path218Path addLineToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.54306 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.59806 * CGRectGetHeight(pin_origin))];
        [path218Path addCurveToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.55960 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.56002 * CGRectGetHeight(pin_origin)) controlPoint1: CGPointMake(CGRectGetMinX(pin_origin) + 0.54488 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.58176 * CGRectGetHeight(pin_origin)) controlPoint2: CGPointMake(CGRectGetMinX(pin_origin) + 0.54427 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.56342 * CGRectGetHeight(pin_origin))];
        [path218Path addCurveToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.78099 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.28337 * CGRectGetHeight(pin_origin)) controlPoint1: CGPointMake(CGRectGetMinX(pin_origin) + 0.68626 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.53194 * CGRectGetHeight(pin_origin)) controlPoint2: CGPointMake(CGRectGetMinX(pin_origin) + 0.78099 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.41874 * CGRectGetHeight(pin_origin))];
        [path218Path addCurveToPoint: CGPointMake(CGRectGetMinX(pin_origin) + 0.49824 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.00000 * CGRectGetHeight(pin_origin)) controlPoint1: CGPointMake(CGRectGetMinX(pin_origin) + 0.78099 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.12687 * CGRectGetHeight(pin_origin)) controlPoint2: CGPointMake(CGRectGetMinX(pin_origin) + 0.65440 * CGRectGetWidth(pin_origin), CGRectGetMinY(pin_origin) + 0.00000 * CGRectGetHeight(pin_origin))];
        [path218Path closePath];
        path218Path.miterLimit = 4;

        path218Path.usesEvenOddFillRule = YES;

        [pin_color setFill];
        [path218Path fill];


        //// path222 Drawing
        UIBezierPath* path222Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(pin_origin) + floor(CGRectGetWidth(pin_origin) * 0.25000 + 0.5), CGRectGetMinY(pin_origin) + floor(CGRectGetHeight(pin_origin) * 0.03410 - 0.08) + 0.58, floor(CGRectGetWidth(pin_origin) * 0.74773 - 0.4) - floor(CGRectGetWidth(pin_origin) * 0.25000 + 0.5) + 0.9, floor(CGRectGetHeight(pin_origin) * 0.53204 + 0.02) - floor(CGRectGetHeight(pin_origin) * 0.03410 - 0.08) - 0.1)];
        [fillColor4 setFill];
        [path222Path fill];
    }


    //// Text Drawing
    CGRect textRect = CGRectMake(CGRectGetMinX(frame) + floor(CGRectGetWidth(frame) * 0.25000 + 0.5), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.03409 - 0.1) + 0.6, floor(CGRectGetWidth(frame) * 0.74773 - 0.4) - floor(CGRectGetWidth(frame) * 0.25000 + 0.5) + 0.9, floor(CGRectGetHeight(frame) * 0.53182) - floor(CGRectGetHeight(frame) * 0.03409 - 0.1) - 0.1);
    NSMutableParagraphStyle* textStyle = [NSMutableParagraphStyle new];
    textStyle.alignment = NSTextAlignmentCenter;

    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: fontSize], NSForegroundColorAttributeName: text_color, NSParagraphStyleAttributeName: textStyle};

    CGFloat textTextHeight = [number boundingRectWithSize: CGSizeMake(textRect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes context: nil].size.height;
    CGContextSaveGState(context);
    CGContextClipToRect(context, textRect);
    [number drawInRect: CGRectMake(CGRectGetMinX(textRect), CGRectGetMinY(textRect) + (CGRectGetHeight(textRect) - textTextHeight) / 2, CGRectGetWidth(textRect), textTextHeight) withAttributes: textFontAttributes];
    CGContextRestoreGState(context);
}

+ (void)drawFromMarkerWithFrame: (CGRect)frame pin_color: (UIColor*)pin_color
{

    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame))];
    [pin_color setFill];
    [ovalPath fill];
}

+ (void)drawDestMarkerWithFrame: (CGRect)frame pin_color: (UIColor*)pin_color
{

    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame) - 0, CGRectGetHeight(frame) - 0)];
    [pin_color setFill];
    [ovalPath fill];


    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + floor(CGRectGetWidth(frame) * 0.24138 + 0.5), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.24138 + 0.5) + 0, floor(CGRectGetWidth(frame) * 0.75855 - 0.5) - floor(CGRectGetWidth(frame) * 0.24138 + 0.5) + 1, floor(CGRectGetHeight(frame) * 0.75855 + 0.5) - floor(CGRectGetHeight(frame) * 0.24138 + 0.5) - 0)];
    [UIColor.whiteColor setFill];
    [oval2Path fill];
}

+ (void)drawDistanceMarkerWithFrame: (CGRect)frame title: (NSString*)title fontSize: (CGFloat)fontSize
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* shadowColor = [UIColor colorWithRed: 0.333 green: 0.333 blue: 0.333 alpha: 1];
    UIColor* fillColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.609];

    //// Shadow Declarations
    NSShadow* shadow = [[NSShadow alloc] init];
    [shadow setShadowColor: [shadowColor colorWithAlphaComponent: CGColorGetAlpha(shadowColor.CGColor) * 0.6]];
    [shadow setShadowOffset: CGSizeMake(1.1, 1.1)];
    [shadow setShadowBlurRadius: 5];


    //// Subframes
    CGRect group = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame));


    //// Group
    {
        //// path- Drawing
        UIBezierPath* pathPath = [UIBezierPath bezierPath];
        [pathPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.58182 * CGRectGetHeight(group))];
        [pathPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41291 * CGRectGetHeight(group))];
        [pathPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.25338 * CGRectGetHeight(group))];
        [pathPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.05404 * CGRectGetHeight(group))];
        [pathPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.02675 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00000 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.02420 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.01193 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00000 * CGRectGetHeight(group))];
        [pathPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.97325 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00000 * CGRectGetHeight(group))];
        [pathPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 1.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.05418 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.98802 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00000 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 1.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.02427 * CGRectGetHeight(group))];
        [pathPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 1.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.77163 * CGRectGetHeight(group))];
        [pathPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.97335 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.82582 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 1.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.80156 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.98793 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.82582 * CGRectGetHeight(group))];
        [pathPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.58163 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.82582 * CGRectGetHeight(group))];
        [pathPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.50000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.82582 * CGRectGetHeight(group))];
        [pathPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.42177 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.82582 * CGRectGetHeight(group))];
        [pathPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.37333 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.82582 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.42177 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.82582 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.41680 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.82582 * CGRectGetHeight(group))];
        [pathPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.29333 * CGRectGetWidth(group), CGRectGetMinY(group) + 1.00000 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.36462 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.82582 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.29333 * CGRectGetWidth(group), CGRectGetMinY(group) + 1.00000 * CGRectGetHeight(group))];
        [pathPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.20192 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.82582 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.29333 * CGRectGetWidth(group), CGRectGetMinY(group) + 1.00000 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.21523 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.82582 * CGRectGetHeight(group))];
        [pathPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.02678 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.82582 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.10081 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.82582 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.02678 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.82582 * CGRectGetHeight(group))];
        [pathPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.77167 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.01199 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.82582 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.80153 * CGRectGetHeight(group))];
        [pathPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.00000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.58182 * CGRectGetHeight(group))];
        [pathPath closePath];
        pathPath.miterLimit = 4;

        pathPath.usesEvenOddFillRule = YES;

        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, [shadow.shadowColor CGColor]);
        [fillColor setFill];
        [pathPath fill];
        CGContextRestoreGState(context);

    }


    //// Text Drawing
    CGRect textRect = CGRectMake(CGRectGetMinX(frame) + 2, CGRectGetMinY(frame) + 5, CGRectGetWidth(frame) - 4, CGRectGetHeight(frame) - 17);
    NSMutableParagraphStyle* textStyle = [NSMutableParagraphStyle new];
    textStyle.alignment = NSTextAlignmentCenter;

    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: fontSize], NSForegroundColorAttributeName: UIColor.whiteColor, NSParagraphStyleAttributeName: textStyle};

    CGFloat textTextHeight = [title boundingRectWithSize: CGSizeMake(textRect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes context: nil].size.height;
    CGContextSaveGState(context);
    CGContextClipToRect(context, textRect);
    [title drawInRect: CGRectMake(CGRectGetMinX(textRect), CGRectGetMinY(textRect) + (CGRectGetHeight(textRect) - textTextHeight) / 2, CGRectGetWidth(textRect), textTextHeight) withAttributes: textFontAttributes];
    CGContextRestoreGState(context);
}

+ (void)drawEtaMarkerWithFrame: (CGRect)frame title: (NSString*)title fontSize: (CGFloat)fontSize
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* shadowColor = [UIColor colorWithRed: 0.333 green: 0.333 blue: 0.333 alpha: 1];
    UIColor* fillColor4 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* fillColor3 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* colorEta = [UIColor colorWithRed: 0.137 green: 0.137 blue: 0.137 alpha: 1];

    //// Shadow Declarations
    NSShadow* shadow = [[NSShadow alloc] init];
    [shadow setShadowColor: [shadowColor colorWithAlphaComponent: CGColorGetAlpha(shadowColor.CGColor) * 0.6]];
    [shadow setShadowOffset: CGSizeMake(1.1, 1.1)];
    [shadow setShadowBlurRadius: 5];


    //// Subframes
    CGRect iOSFoodv2 = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame));


    //// iOS-Food-v2
    {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadow.shadowOffset, shadow.shadowBlurRadius, [shadow.shadowColor CGColor]);
        CGContextBeginTransparencyLayer(context, NULL);


        //// ic_left_top
        {
            //// Group-7
            {
                //// Rectangle-28
                {
                    //// path-1 Drawing
                    UIBezierPath* path1Path = [UIBezierPath bezierPath];
                    [path1Path moveToPoint: CGPointMake(CGRectGetMinX(iOSFoodv2) + 0.00000 * CGRectGetWidth(iOSFoodv2), CGRectGetMinY(iOSFoodv2) + 0.00000 * CGRectGetHeight(iOSFoodv2))];
                    [path1Path addLineToPoint: CGPointMake(CGRectGetMinX(iOSFoodv2) + 1.00000 * CGRectGetWidth(iOSFoodv2), CGRectGetMinY(iOSFoodv2) + 0.00000 * CGRectGetHeight(iOSFoodv2))];
                    [path1Path addLineToPoint: CGPointMake(CGRectGetMinX(iOSFoodv2) + 1.00000 * CGRectGetWidth(iOSFoodv2), CGRectGetMinY(iOSFoodv2) + 0.76991 * CGRectGetHeight(iOSFoodv2))];
                    [path1Path addLineToPoint: CGPointMake(CGRectGetMinX(iOSFoodv2) + 0.12430 * CGRectGetWidth(iOSFoodv2), CGRectGetMinY(iOSFoodv2) + 0.76991 * CGRectGetHeight(iOSFoodv2))];
                    [path1Path addLineToPoint: CGPointMake(CGRectGetMinX(iOSFoodv2) + 0.00000 * CGRectGetWidth(iOSFoodv2), CGRectGetMinY(iOSFoodv2) + 1.00000 * CGRectGetHeight(iOSFoodv2))];
                    [path1Path addLineToPoint: CGPointMake(CGRectGetMinX(iOSFoodv2) + 0.00000 * CGRectGetWidth(iOSFoodv2), CGRectGetMinY(iOSFoodv2) + 0.00000 * CGRectGetHeight(iOSFoodv2))];
                    [path1Path closePath];
                    path1Path.miterLimit = 4;

                    path1Path.usesEvenOddFillRule = YES;

                    [fillColor3 setFill];
                    [path1Path fill];


                    //// path- Drawing
                    UIBezierPath* pathPath = [UIBezierPath bezierPath];
                    [pathPath moveToPoint: CGPointMake(CGRectGetMinX(iOSFoodv2) + 0.00000 * CGRectGetWidth(iOSFoodv2), CGRectGetMinY(iOSFoodv2) + 0.00000 * CGRectGetHeight(iOSFoodv2))];
                    [pathPath addLineToPoint: CGPointMake(CGRectGetMinX(iOSFoodv2) + 1.00000 * CGRectGetWidth(iOSFoodv2), CGRectGetMinY(iOSFoodv2) + 0.00000 * CGRectGetHeight(iOSFoodv2))];
                    [pathPath addLineToPoint: CGPointMake(CGRectGetMinX(iOSFoodv2) + 1.00000 * CGRectGetWidth(iOSFoodv2), CGRectGetMinY(iOSFoodv2) + 0.76991 * CGRectGetHeight(iOSFoodv2))];
                    [pathPath addLineToPoint: CGPointMake(CGRectGetMinX(iOSFoodv2) + 0.12430 * CGRectGetWidth(iOSFoodv2), CGRectGetMinY(iOSFoodv2) + 0.76991 * CGRectGetHeight(iOSFoodv2))];
                    [pathPath addLineToPoint: CGPointMake(CGRectGetMinX(iOSFoodv2) + 0.00000 * CGRectGetWidth(iOSFoodv2), CGRectGetMinY(iOSFoodv2) + 1.00000 * CGRectGetHeight(iOSFoodv2))];
                    [pathPath addLineToPoint: CGPointMake(CGRectGetMinX(iOSFoodv2) + 0.00000 * CGRectGetWidth(iOSFoodv2), CGRectGetMinY(iOSFoodv2) + 0.00000 * CGRectGetHeight(iOSFoodv2))];
                    [pathPath closePath];
                    pathPath.miterLimit = 4;

                    pathPath.usesEvenOddFillRule = YES;

                    [fillColor4 setFill];
                    [pathPath fill];
                }
            }
        }


        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }


    //// Text Drawing
    CGRect textRect = CGRectMake(CGRectGetMinX(frame) + 2, CGRectGetMinY(frame) + 5, CGRectGetWidth(frame) - 4, CGRectGetHeight(frame) - 17);
    NSMutableParagraphStyle* textStyle = [NSMutableParagraphStyle new];
    textStyle.alignment = NSTextAlignmentCenter;

    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica-Bold" size: fontSize], NSForegroundColorAttributeName: colorEta, NSParagraphStyleAttributeName: textStyle};

    CGFloat textTextHeight = [title boundingRectWithSize: CGSizeMake(textRect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes context: nil].size.height;
    CGContextSaveGState(context);
    CGContextClipToRect(context, textRect);
    [title drawInRect: CGRectMake(CGRectGetMinX(textRect), CGRectGetMinY(textRect) + (CGRectGetHeight(textRect) - textTextHeight) / 2, CGRectGetWidth(textRect), textTextHeight) withAttributes: textFontAttributes];
    CGContextRestoreGState(context);
}

+ (void)drawPumbWithOuterColor: (UIColor*)outerColor innerColor: (UIColor*)innerColor viewHeight: (CGFloat)viewHeight viewWidth: (CGFloat)viewWidth maxOuterSize: (CGFloat)maxOuterSize maxInnerSize: (CGFloat)maxInnerSize minInnerSize: (CGFloat)minInnerSize progress: (CGFloat)progress
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* outerColorGradient1 = [outerColor colorWithAlphaComponent: 0.6];
    UIColor* outerColorGradient2 = [outerColor colorWithAlphaComponent: 0.1];

    //// Gradient Declarations
    CGFloat outerGradientLocations[] = {0, 1};
    CGGradientRef outerGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)outerColorGradient1.CGColor, (id)outerColorGradient2.CGColor], outerGradientLocations);

    //// Variable Declarations
    CGFloat centerY = viewHeight / 2.0;
    CGFloat centerX = viewWidth / 2.0;
    CGFloat progressInner = MIN(sin(180 * progress * M_PI/180) * 10 / 9.0, 1);
    CGFloat innerSize = (maxInnerSize - minInnerSize) * progressInner + minInnerSize;
    CGFloat innerRadius = -innerSize / 2.0;
    CGFloat outerSize = (maxOuterSize - minInnerSize) * progress + minInnerSize;
    CGFloat outerRadius = -outerSize / 2.0;

    //// Oval Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, centerX, centerY);

    CGRect ovalRect = CGRectMake(outerRadius, outerRadius, outerSize, outerSize);
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: ovalRect];
    CGContextSaveGState(context);
    [ovalPath addClip];
    CGFloat ovalResizeRatio = MIN(CGRectGetWidth(ovalRect) / 58.18, CGRectGetHeight(ovalRect) / 58.18);
    CGContextDrawRadialGradient(context, outerGradient,
        CGPointMake(CGRectGetMidX(ovalRect) + 4.15 * ovalResizeRatio, CGRectGetMidY(ovalRect) + -4.15 * ovalResizeRatio), 8.3 * ovalResizeRatio,
        CGPointMake(CGRectGetMidX(ovalRect) + 0 * ovalResizeRatio, CGRectGetMidY(ovalRect) + 0 * ovalResizeRatio), 24.91 * ovalResizeRatio,
        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);

    CGContextRestoreGState(context);


    //// Oval 2 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, centerX, centerY);
    CGContextRotateCTM(context, 0.25 * M_PI / 180);

    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(innerRadius, innerRadius, innerSize, innerSize)];
    [innerColor setFill];
    [oval2Path fill];

    CGContextRestoreGState(context);


    //// Cleanup
    CGGradientRelease(outerGradient);
    CGColorSpaceRelease(colorSpace);
}

#pragma mark Generated Images

+ (UIImage*)imageOfMapDestIconWithFrame: (CGRect)frame pin_color: (UIColor*)pin_color text_color: (UIColor*)text_color number: (NSString*)number fontSize: (CGFloat)fontSize
{
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0.0f);
    [AhamoveStyleKit drawMapDestIconWithFrame: CGRectMake(0, 0, frame.size.width, frame.size.height) pin_color: pin_color text_color: text_color number: number fontSize: fontSize];

    UIImage* imageOfMapDestIcon = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return imageOfMapDestIcon;
}

+ (UIImage*)imageOfFromMarkerWithFrame: (CGRect)frame pin_color: (UIColor*)pin_color
{
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0.0f);
    [AhamoveStyleKit drawFromMarkerWithFrame: CGRectMake(0, 0, frame.size.width, frame.size.height) pin_color: pin_color];

    UIImage* imageOfFromMarker = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return imageOfFromMarker;
}

+ (UIImage*)imageOfDestMarkerWithFrame: (CGRect)frame pin_color: (UIColor*)pin_color
{
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0.0f);
    [AhamoveStyleKit drawDestMarkerWithFrame: CGRectMake(0, 0, frame.size.width, frame.size.height) pin_color: pin_color];

    UIImage* imageOfDestMarker = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return imageOfDestMarker;
}

+ (UIImage*)imageOfDistanceMarkerWithFrame: (CGRect)frame title: (NSString*)title fontSize: (CGFloat)fontSize
{
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0.0f);
    [AhamoveStyleKit drawDistanceMarkerWithFrame: CGRectMake(0, 0, frame.size.width, frame.size.height) title: title fontSize: fontSize];

    UIImage* imageOfDistanceMarker = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return imageOfDistanceMarker;
}

+ (UIImage*)imageOfEtaMarkerWithFrame: (CGRect)frame title: (NSString*)title fontSize: (CGFloat)fontSize
{
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0.0f);
    [AhamoveStyleKit drawEtaMarkerWithFrame: CGRectMake(0, 0, frame.size.width, frame.size.height) title: title fontSize: fontSize];

    UIImage* imageOfEtaMarker = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return imageOfEtaMarker;
}

@end
