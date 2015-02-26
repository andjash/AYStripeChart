//
//  AYStripeChartView.m
//  AYStripeChartDemo
//
//  Created by Andrey Yashnev on 26/02/15.
//  Copyright (c) 2015 Andrey Yashnev. All rights reserved.
//

#import "AYStripeChartView.h"
#import "AYStripeChartEntry.h"

@interface AYStripeChartView ()

@property (nonatomic, strong) NSArray *innerChartValues;
@property (nonatomic, strong) NSArray *stripesViews;

@property (nonatomic, strong) UIView *selectedStripe;
@property (nonatomic, strong) AYStripeChartEntry *selectedEntry;

@end

@implementation AYStripeChartView

#pragma mark - Properties

- (void)setStripeChartEntries:(NSArray *)stripeChartEntries {
    _stripeChartEntries = stripeChartEntries;
    [self recreateChartValues];
    [self recreateStripeViews];
    [self setNeedsLayout];
}

- (void)setSelectedEntry:(AYStripeChartEntry *)selectedEntry {
    _selectedEntry = selectedEntry;
    
    [UIView animateWithDuration:0.3 animations:^{
        [self placeStripes];
    }];
}

#pragma mark - UIView

- (void)layoutSubviews {
    [super layoutSubviews];
    [self recreateChartValues];
    [self placeStripes];
}

#pragma mark - Private

- (void)placeStripes {
    CGFloat summ = [self summFromChartValues:self.innerChartValues];
    
    CGFloat currentDrawingXPosition = 0;
    for (NSInteger i = 0; i < [self.innerChartValues count]; i++) {
        AYStripeChartEntry *entry = self.innerChartValues[i];
        UIView *stripeView = self.stripesViews[i];
        CGFloat entryWidth = (entry.value / summ) * self.frame.size.width;
        CGFloat viewHeight = 0;
        if (self.selectedStripe) {
            if (self.selectedStripe == stripeView) {
                viewHeight = self.frame.size.height;
            } else {
                viewHeight =  self.frame.size.height / 3;
            }
        } else {
            viewHeight = self.frame.size.height;
        }
        stripeView.frame = CGRectMake(currentDrawingXPosition,
                                      self.frame.size.height - viewHeight,
                                      entryWidth,
                                      viewHeight);
        currentDrawingXPosition += entryWidth;
    }
}


- (void)recreateStripeViews {
    for (UIView *stripeView in self.stripesViews) {
        [stripeView removeFromSuperview];
    }
    
    NSMutableArray *views = [[NSMutableArray alloc] initWithCapacity:[self.stripeChartEntries count]];
    
    for (AYStripeChartEntry *entry in self.innerChartValues) {
        UIView *stripeView = [UIView new];
        [stripeView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stripeViewTaped:)]];
        
        stripeView.backgroundColor = entry.color;
        [self addSubview:stripeView];
        [views addObject:stripeView];
    }
    self.stripesViews = views;
}

- (void)recreateChartValues {
    if (_minEntryWidth <= 0 || _minEntryWidth > self.frame.size.width) {
        self.innerChartValues = self.stripeChartEntries;
        return;
    }
    NSMutableArray *initialValues = [NSMutableArray arrayWithCapacity:[self.stripeChartEntries count]];
    CGFloat summ = 0;
    for (AYStripeChartEntry *entry in self.stripeChartEntries) {
        [initialValues addObject:@(entry.value)];
        summ += entry.value;
    }
    CGFloat minValue = (self.minEntryWidth / self.frame.size.width) * summ;
    NSArray *balancedValues = [self balanceArray:initialValues withMinValue:minValue];
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self.stripeChartEntries count]];
    for (NSInteger i = 0 ; i < [self.stripeChartEntries count]; i++) {
        AYStripeChartEntry *newEntry = [AYStripeChartEntry entryWithValue:[balancedValues[i] floatValue]
                                                                    color:[self.stripeChartEntries[i] color]];
        [result addObject:newEntry];
    }
    self.innerChartValues = result;
}

- (CGFloat)summFromChartValues:(NSArray *)pieValues {
    CGFloat result = 0;
    for (AYStripeChartEntry *entry in pieValues) {
        result += entry.value;
    }
    return result;
}

- (NSArray *)balanceArray:(NSArray *)target withMinValue:(CGFloat)minValue {
    NSMutableArray *neutralValues = [NSMutableArray array];
    NSMutableArray *valuesToDecrease = [NSMutableArray array];
    NSMutableArray *result = [NSMutableArray arrayWithArray:target];
    CGFloat balanceValue = 0;
    
    for (int i = 0; i < [target count]; i++) {
        NSNumber *number = target[i];
        CGFloat floatValue = [number floatValue];
        
        if (floatValue == minValue) {
            [neutralValues addObject:@[@(minValue), @(i)]];
            continue;
        }
        
        if (floatValue < minValue) {
            [neutralValues addObject:@[@(minValue), @(i)]];
            balanceValue += minValue + floatValue;
            continue;
        }
        
        [valuesToDecrease addObject:@[number, @(i)]];
    }
    
    NSArray *decreasedValues = [self decreaseValue:balanceValue
                                         fromArray:valuesToDecrease
                                          minValue:minValue];
    
    for (NSArray *values in decreasedValues) {
        [result replaceObjectAtIndex:[values[1] unsignedIntegerValue] withObject:values[0]];
    }
    for (NSArray *values in neutralValues) {
        [result replaceObjectAtIndex:[values[1] unsignedIntegerValue] withObject:values[0]];
    }
    
    return result;
}

- (NSArray *)decreaseValue:(CGFloat)balanceValue fromArray:(NSArray *)target minValue:(CGFloat)min {
    NSMutableArray *result = [NSMutableArray array];
    CGFloat targetArraySumm = 0;
    for (NSArray *value in target) {
        targetArraySumm += [value[0] floatValue];
    }
    
    CGFloat difRes = 0;
    for (NSArray *value in target) {
        CGFloat floatValue = [value[0] floatValue];
        
        CGFloat newValue = MAX(min, floatValue - ((floatValue / targetArraySumm) * balanceValue));
        difRes += floatValue - newValue;
        [result addObject:@[@(newValue), value[1]]];
    }
    return result;
}

#pragma mark - Acitons

- (void)stripeViewTaped:(id)sender {
    UITapGestureRecognizer *recognizer = (UITapGestureRecognizer *)sender;
    UIView *selectedView = [recognizer view];
    for (NSInteger i = 0; i < [self.stripesViews count]; i++) {
        UIView *stripeView = self.stripesViews[i];
        if (stripeView == selectedView) {
            if (self.selectedStripe == selectedView) {
                self.selectedStripe = nil;
                self.selectedEntry = nil;
            } else {
                self.selectedStripe = selectedView;
                self.selectedEntry = self.stripeChartEntries[i];
            }
            return;
        }
    }
}

@end
