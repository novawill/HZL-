//
//  HZLTextField.m
//  HZL猫头鹰
//
//  Created by 黄梓伦 on 3/15/16.
//  Copyright © 2016 黄梓伦. All rights reserved.
//

#import "HZLTextField.h"

@implementation HZLTextField

- (CGRect)leftViewRectForBounds:(CGRect)bounds{
    
    
    CGFloat margin = 10;
    CGFloat scale = 2/3.0f;
    
    CGFloat width = bounds.size.height * scale;
    
    CGFloat x = margin;
    CGFloat y = (bounds.size.height - width)/2.0f;
    
    return CGRectMake(x, y, width, width);
    
}

@end
