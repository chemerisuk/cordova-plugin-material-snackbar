var exec = require("cordova/exec");
var PLUGIN_NAME = "MaterialSnackbar";

module.exports = {
    show: function(success, error) {
        exec(success, error, PLUGIN_NAME, "show", []);
    },
    hide: function(success, error) {
        exec(success, error, PLUGIN_NAME, "hide", []);
    }
};