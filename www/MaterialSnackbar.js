var exec = require("cordova/exec");
var PLUGIN_NAME = "MaterialSnackbar";

module.exports = {
    show: function(message, action, duration, success, error) {
        exec(success, error, PLUGIN_NAME, "show", [message, action, duration]);
    }
};