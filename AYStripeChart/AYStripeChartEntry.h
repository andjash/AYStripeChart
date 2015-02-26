//
//  AYStripeChartEntry.h
//  AYStripeChartDemo
//
//  Created by Andrey Yashnev on 26/02/15.
//  Copyright (c) 2015 Andrey Yashnev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AYStripeChartEntry : UIView

@property (nonatomic, assign, readonly) CGFloat value;
@property (nonatomic, retain, readonly) UIColor *color;

+ (instancetype)entryWithValue:(CGFloat)value
                         color:(UIColor *)color;

@end
