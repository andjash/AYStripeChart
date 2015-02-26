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
    
    
    UIImageView *beerView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BeerEntry"]];
    UIImageView *pizzaView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PizzaEntry"]];
    UIImageView *fryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FryEntry"]];
    
    AYStripeChartEntry *beer = [AYStripeChartEntry entryWithValue:0.5 color:[UIColor brownColor] detailsView:beerView];
    AYStripeChartEntry *pizza = [AYStripeChartEntry entryWithValue:0.05 color:[UIColor redColor] detailsView:pizzaView];
    AYStripeChartEntry *fry = [AYStripeChartEntry entryWithValue:0.7 color:[UIColor orangeColor] detailsView:fryView];
    
    self.stripeChart.stripeChartEntries = @[beer, pizza, fry];
}

@end
