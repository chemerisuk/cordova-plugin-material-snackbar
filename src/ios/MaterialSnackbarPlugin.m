#import "MaterialSnackbarPlugin.h"

@implementation MaterialSnackbarPlugin

- (void)setAction:(CDVInvokedUrlCommand *)command {
    NSString* colorHex = [command argumentAtIndex:1];

    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:colorHex];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];

    self.buttonTextColor = [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];

    self.lastAction = [[MDCSnackbarMessageAction alloc] init];
    self.lastAction.title = [command argumentAtIndex:0];
    self.lastAction.handler = ^() {
        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    };
}

- (void)show:(CDVInvokedUrlCommand *)command {
    NSString* message = [command argumentAtIndex:0];
    NSNumber* duration = [command argumentAtIndex:1];

    MDCSnackbarMessage *snackbar = [[MDCSnackbarMessage alloc] init];
    snackbar.text = message;
    snackbar.duration = [duration intValue] / 1000;

    if (self.lastAction) {
        snackbar.buttonTextColor = self.buttonTextColor;
        snackbar.action = self.lastAction;
    }

    [MDCSnackbarManager showMessage:snackbar];

    if (self.lastAction) {
        self.lastAction = nil;
        self.buttonTextColor = nil;
    }
}

@end