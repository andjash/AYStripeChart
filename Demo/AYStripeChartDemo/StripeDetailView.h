//
//  StripeDetailView.h
//  AYStripeChartDemo
//
//  Created by Andrey Yashnev on 26/02/15.
//  Copyright (c) 2015 Andrey Yashnev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StripeDetailView : UIView

@property (nonatomic, weak) IBOutlet UIImageView *icon;
@property (nonatomic, weak) IBOutlet UILabel *detailLabel;

+ (instancetype)detailsViewFromNib;

@end
