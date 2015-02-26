//
//  StripeDetailView.m
//  AYStripeChartDemo
//
//  Created by Andrey Yashnev on 26/02/15.
//  Copyright (c) 2015 Andrey Yashnev. All rights reserved.
//

#import "StripeDetailView.h"

@implementation StripeDetailView

+ (instancetype)detailsViewFromNib {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil];
    if ([views count] > 0) {
        return views[0];
    }
    return  nil;
}

@end
