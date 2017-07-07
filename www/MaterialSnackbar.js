var exec = require("cordova/exec");
var PLUGIN_NAME = "MaterialSnackbar";

module.exports = {
    setAction: function(label, color, success, error) {
        exec(success, error, PLUGIN_NAME, "setAction", [label, color]);

        return this;
    },
    show: function(message, duration, success, error) {
        exec(success, error, PLUGIN_NAME, "show", [message, duration || 10000]);
    }
};