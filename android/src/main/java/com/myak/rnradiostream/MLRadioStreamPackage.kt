package com.myak.rnradiostream
/**
 * Created by MatheusLuz on 07/04/18.
 */

import com.facebook.react.ReactPackage
import com.facebook.react.bridge.JavaScriptModule
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.ViewManager

import java.util.ArrayList
import java.util.Collections

class MLRadioStreamPackage : ReactPackage {
    override fun createViewManagers(reactContext: ReactApplicationContext) : List<ViewManager<*,*>> {
        return emptyList()
    }

    override fun createNativeModules(reactContext: ReactApplicationContext): List<NativeModule> {
        val modules = ArrayList<NativeModule>()
        modules.add(MLRadioStream(reactContext))
        return modules
    }
}