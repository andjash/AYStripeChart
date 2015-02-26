# AYStripeChart

Configurable stripe chart

### Preview

![Preview1](https://raw.githubusercontent.com/andjash/AYStripeChart/master/screenshots/screen_1.png)
![Preview2](https://raw.githubusercontent.com/andjash/AYStripeChart/master/screenshots/screen_2.png)
![Preview3](https://raw.githubusercontent.com/andjash/AYStripeChart/master/screenshots/screen_3.png)

### Usage

Import required headers

```objc

#import "AYStripeChartView.h"
#import "AYStripeChartEntry.h"

```

Create instance of AYStripeChartView and attach it to another view.
Create instances of AYStripeChartEntry according to your data and attach entries to AYPieChartView

```objc
    
    AYStripeChartEntry *beer = [AYStripeChartEntry entryWithValue:0.2 color:[UIColor brownColor] detailsView:beerDetails];
    AYStripeChartEntry *pizza = [AYStripeChartEntry entryWithValue:0.1 color:[UIColor redColor] detailsView:pizzaDetails];
    AYStripeChartEntry *fry = [AYStripeChartEntry entryWithValue:0.5 color:[UIColor orangeColor] detailsView:fryDetails];

    self.stripeChart.stripeChartEntries = @[beer, pizza, fry];

```

Thats all for simple case!

For more interesting cases pls review demo.
