//
//  RNHTMLPrinter.m
//  RNHTMLPrinter
//
//  Created by Jordan Hitch on 4/2/17.
//  Copyright © 2017 Jordan Hitch. All rights reserved.
//

#import "RNHTMLPrinter.h"
#import <React/RCTUtils.h>

@implementation RNHTMLPrinter

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(printHTML:(NSString *) htmlText
                  resolver:(RCTPromiseResolveBlock) resolve
                  rejecter:(RCTPromiseRejectBlock) reject) {
    UIMarkupTextPrintFormatter* html = [[UIMarkupTextPrintFormatter alloc] initWithMarkupText:htmlText];
    UIPrintInteractionController* printController = [UIPrintInteractionController sharedPrintController];
    [printController setPrintFormatter:html];
    
    void (^completionHandler)(UIPrintInteractionController*, BOOL, NSError*) =
    ^(UIPrintInteractionController* printController, BOOL completed, NSError* error){
        if (!completed && error) {
            NSLog(@"Printing could not be completed because of error: %@", error);
            reject(RCTErrorUnspecified, nil, RCTErrorWithMessage(error.description));
        } else {
            resolve(nil);
        }
    };
    
    [printController presentAnimated:YES completionHandler:completionHandler];
}


@end
