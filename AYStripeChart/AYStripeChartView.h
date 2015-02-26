//
//  AYStripeChartView.h
//  AYStripeChartDemo
//
//  Created by Andrey Yashnev on 26/02/15.
//  Copyright (c) 2015 Andrey Yashnev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AYStripeChartEntry;
@class AYStripeChartView;

@protocol AYStripeChartViewDelegate <NSObject>

@optional
- (BOOL)stripeChart:(AYStripeChartView *)chartView willSelectChartEntry:(AYStripeChartEntry *)entry;
- (void)stripeChart:(AYStripeChartView *)chartView didSelectChartEntry:(AYStripeChartEntry *)entry;
- (void)stripeChart:(AYStripeChartView *)chartView didDeselectChartEntry:(AYStripeChartEntry *)entry;
@end

@interface AYStripeChartView : UIView

@property (nonatomic, strong) NSArray *stripeChartEntries;
@property (nonatomic, assign) CGFloat minEntryWidth;
@property (nonatomic, strong) AYStripeChartEntry *selectedEntry;

@property (nonatomic, assign) id<AYStripeChartViewDelegate> delegate;

@end
