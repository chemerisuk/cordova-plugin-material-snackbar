# cordova-plugin-material-snackbar<br>[![NPM version][npm-version]][npm-url] [![NPM downloads][npm-downloads]][npm-url]
Cordova plugin for [Material design Snackbars](https://material.io/guidelines/components/snackbars-toasts.html)

## Installation

    cordova plugin add cordova-plugin-material-snackbar --save

## Supported Platforms

- iOS (8+)
- Android

## Methods

### setAction(_label_, _color_, _callback_)
Sets action for the next slackbar.
```js
cordova.plugins.material.Snackbar.setAction("Done", "#333333" function() {
    console.log("Action was clicked");
});
```

### show(_message_, _duration_)
Display slackbar on the buttom.
```js
cordova.plugins.material.Snackbar.show("Hello world!", 5000);
```

[npm-url]: https://www.npmjs.com/package/cordova-plugin-material-snackbar
[npm-version]: https://img.shields.io/npm/v/cordova-plugin-material-snackbar.svg
[npm-downloads]: https://img.shields.io/npm/dt/cordova-plugin-material-snackbar.svg
