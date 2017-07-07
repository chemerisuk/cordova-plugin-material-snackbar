#import "MaterialSnackbarPlugin.h"
#import "MaterialSnackbar.h"

@implementation MaterialSnackbarPlugin

- (void)show:(CDVInvokedUrlCommand *)command {
    NSString* message = [command argumentAtIndex:0];
    NSString* actionText = [command argumentAtIndex:1];
    NSNumber* duration = [command argumentAtIndex:2];

    MDCSnackbarMessage *snackbar = [[MDCSnackbarMessage alloc] init];
    snackbar.text = message;
    if (duration) {
        snackbar.duration = [duration intValue] / 1000;
    } else {
        snackbar.duration = MDCSnackbarMessageDurationMax;
    }

    if (actionText) {
        MDCSnackbarMessageAction *action = [[MDCSnackbarMessageAction alloc] init];
        action.title = actionText;
        snackbar.action = action;
    }

    [MDCSnackbarManager showMessage:snackbar];
}

@end