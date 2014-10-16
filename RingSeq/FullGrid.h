//
//  FullGrid.h
//  RingSeq
//
//  Created by Nir Boneh on 10/15/14.
//  Copyright (c) 2014 Clouby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "layout.h"

@interface FullGrid : UIView<UIScrollViewDelegate>{
    NSArray *layers;
    UIView *container;
}

-(id)initWithStaff:(Staff *)staff env:(DetailViewController *)env;

-(void)play;
@end
