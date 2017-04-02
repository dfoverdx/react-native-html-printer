//
//  RNHTMLPrinter.h
//  RNHTMLPrinter
//
//  Created by Jordan Hitch on 4/2/17.
//  Copyright © 2017 Jordan Hitch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "React/RCTBridgeModule.h"
#import "React/RCTView.h"


@interface RNHTMLPrinter : RCTView <RCTBridgeModule, UIPrintInteractionControllerDelegate>

@end
