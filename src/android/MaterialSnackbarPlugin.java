package by.chemerisuk.cordova.material;

import android.app.Activity;
import android.graphics.Color;
import android.support.design.widget.Snackbar;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;


public class MaterialSnackbarPlugin extends CordovaPlugin {
    private static final String TAG = "MaterialSnackbarPlugin";

    private int lastActionColor;
    private String lastActionText;
    private CallbackContext lastActionCallback;

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if ("setAction".equals(action)) {
            setAction(args.getString(0), args.getString(1), callbackContext);
        } else if ("show".equals(action)) {
            show(args.getString(0), args.getInt(1), callbackContext);
        } else {
            return false;
        }

        return true;
    }

    private void setAction(String actionText, String colorHex, CallbackContext callbackContext) {
        this.lastActionText = actionText;

        if (colorHex != null) {
            this.lastActionColor = Color.parseColor(colorHex);
        }

        this.lastActionCallback = callbackContext;
    }

    private void show(final String message, final int duration, final CallbackContext callbackContext) {
        cordova.getActivity().runOnUiThread(new Runnable() {
            @Override
            public void run() {
                Snackbar snackbar = Snackbar.make(webView.getView(), message, duration);
                TextView textView = (TextView)snackbar.getView().findViewById(android.support.design.R.id.snackbar_text);
                // fix snackbar text color to white
                textView.setTextColor(Color.WHITE);

                if (lastActionText != null) {
                    snackbar.setActionTextColor(lastActionColor);
                    snackbar.setAction(lastActionText, new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            lastActionCallback.success();
                        }
                    });

                    lastActionText = null;
                }

                snackbar.show();

                callbackContext.success();
            }
        });
    }
}