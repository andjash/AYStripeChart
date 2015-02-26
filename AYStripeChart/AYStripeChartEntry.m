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
@property (nonatomic, strong, readwrite) UIColor *color;
@property (nonatomic, strong, readwrite) UIView *detailsView;

@end

@implementation AYStripeChartEntry

#pragma mark - Static

+ (instancetype)entryWithValue:(CGFloat)value
                         color:(UIColor *)color
                   detailsView:(UIView *)detailsView {
    AYStripeChartEntry *result = [AYStripeChartEntry new];
    result.value = value;
    result.color = color;
    result.detailsView = detailsView;
    return result;
}

@end
