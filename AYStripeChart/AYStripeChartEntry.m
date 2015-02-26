//
//  AYStripeChartEntry.m
//  AYStripeChartDemo
//
//  Created by Andrey Yashnev on 26/02/15.
//  Copyright (c) 2015 Andrey Yashnev. All rights reserved.
//

#import "AYStripeChartEntry.h"

@interface AYStripeChartEntry ()

@property (nonatomic, assign, readwrite) CGFloat value;
@property (nonatomic, retain, readwrite) UIColor *color;

@end

@implementation AYStripeChartEntry

#pragma mark - Static

+ (instancetype)entryWithValue:(CGFloat)value
                         color:(UIColor *)color {
    AYStripeChartEntry *result = [AYStripeChartEntry new];
    result.value = value;
    result.color = color;
    return result;
}

@end
