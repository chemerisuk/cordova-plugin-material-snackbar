#import <Cordova/CDV.h>
#import "MaterialSnackbar.h"

@interface MaterialSnackbarPlugin : CDVPlugin

- (void)setAction:(CDVInvokedUrlCommand *)command;
- (void)show:(CDVInvokedUrlCommand *)command;

@property (nonatomic, copy) MDCSnackbarMessageAction *lastAction;
@property (nonatomic, copy) UIColor *buttonTextColor;

@end