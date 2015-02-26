//
//  ViewController.m
//  AYStripeChartDemo
//
//  Created by Andrey Yashnev on 26/02/15.
//  Copyright (c) 2015 Andrey Yashnev. All rights reserved.
//

#import "ViewController.h"
#import "AYStripeChartView.h"
#import "AYStripeChartEntry.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet AYStripeChartView *stripeChart;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stripeChart.minEntryWidth = 20.f;
    
    AYStripeChartEntry *beer = [AYStripeChartEntry entryWithValue:0.5 color:[UIColor brownColor]];
    AYStripeChartEntry *pizza = [AYStripeChartEntry entryWithValue:0.2 color:[UIColor redColor]];
    AYStripeChartEntry *fry = [AYStripeChartEntry entryWithValue:0.7 color:[UIColor orangeColor]];
    AYStripeChartEntry *one = [AYStripeChartEntry entryWithValue:0.01 color:[UIColor greenColor]];
    AYStripeChartEntry *two = [AYStripeChartEntry entryWithValue:0.05 color:[UIColor blueColor]];
    
    self.stripeChart.stripeChartEntries = @[beer, pizza, fry, one, two];
}

@end
