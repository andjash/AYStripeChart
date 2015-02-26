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
#import "StripeDetailView.h"

@interface ViewController ()<AYStripeChartViewDelegate>

@property (nonatomic, weak) IBOutlet AYStripeChartView *stripeChart;

@property (nonatomic, weak) IBOutlet UISlider *beerSlider;
@property (nonatomic, weak) IBOutlet UISlider *pizzaSlider;
@property (nonatomic, weak) IBOutlet UISlider *frySlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    self.stripeChart.minEntryWidth = 20.f;
    self.stripeChart.delegate = self;
    [self recreateWithPizzaValue:self.pizzaSlider.value beerValue:self.beerSlider.value fryValue:self.frySlider.value];
}

#pragma mark - Private

- (void)recreateWithPizzaValue:(CGFloat)pizzaValue
                     beerValue:(CGFloat)beerValue
                      fryValue:(CGFloat)fryValue {
    StripeDetailView *beerDetails = [StripeDetailView detailsViewFromNib];
    beerDetails.icon.image = [UIImage imageNamed:@"BeerEntry"];
    beerDetails.detailLabel.text = @"0.5";
    beerDetails.detailLabel.alpha = 0;
    
    StripeDetailView *pizzaDetails = [StripeDetailView detailsViewFromNib];
    pizzaDetails.icon.image = [UIImage imageNamed:@"PizzaEntry"];
    pizzaDetails.detailLabel.text = @"0.05";
    pizzaDetails.detailLabel.alpha = 0;
    
    StripeDetailView *fryDetails = [StripeDetailView detailsViewFromNib];
    fryDetails.icon.image = [UIImage imageNamed:@"FryEntry"];
    fryDetails.detailLabel.text = @"0.7";
    fryDetails.detailLabel.alpha = 0;
    
    fryDetails.frame =
    pizzaDetails.frame =
    beerDetails.frame = CGRectMake(0, 0, 50, 60);
    
    AYStripeChartEntry *beer = [AYStripeChartEntry entryWithValue:beerValue color:[UIColor brownColor] detailsView:beerDetails];
    AYStripeChartEntry *pizza = [AYStripeChartEntry entryWithValue:pizzaValue color:[UIColor redColor] detailsView:pizzaDetails];
    AYStripeChartEntry *fry = [AYStripeChartEntry entryWithValue:fryValue color:[UIColor orangeColor] detailsView:fryDetails];

    self.stripeChart.stripeChartEntries = @[beer, pizza, fry];
}

#pragma mark - AYStripeChartViewDelegate

- (BOOL)stripeChart:(AYStripeChartView *)chartView willSelectChartEntry:(AYStripeChartEntry *)entry {
    return YES;
}
- (void)stripeChart:(AYStripeChartView *)chartView didSelectChartEntry:(AYStripeChartEntry *)entry {
    StripeDetailView *details = (StripeDetailView *)entry.detailsView;
    details.detailLabel.alpha = 1;
}

- (void)stripeChart:(AYStripeChartView *)chartView didDeselectChartEntry:(AYStripeChartEntry *)entry {
    StripeDetailView *details = (StripeDetailView *)entry.detailsView;
    details.detailLabel.alpha = 0;
}

#pragma mark - Action

- (IBAction)sliderValueChanged:(id)sender {
    [self recreateWithPizzaValue:self.pizzaSlider.value beerValue:self.beerSlider.value fryValue:self.frySlider.value];
}

@end
