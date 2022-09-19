package com.example.dengage_flutter

import android.util.Log
import com.google.gson.Gson
import com.dengage.sdk.push.NotificationReceiver
import com.dengage.sdk.domain.push.model.Message
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import io.flutter.plugin.common.EventChannel.EventSink;


open class DengageNotificationReciever(_events: EventSink?) : NotificationReceiver() {
 val events = _events
 
    override fun  onReceive(context: Context, intent: Intent?) {
        Log.d("den/Flutter", "inOnReceiveOfCreateNotifReceiver.")
        val intentAction = intent?.action
        if (intentAction != null) {
          when (intentAction.hashCode()) {
            -825236177 -> {
              if (intentAction == "com.dengage.push.intent.RECEIVE") {
                Log.d("den/Flutter", "received new push.")
                val message: Message = intent?.getExtras()?.let { Message.createFromIntent(it) }!!
                if (events != null) {
                  // todo: later when required emit seperate event for onNotificationReceived
//                  events.success(Gson().toJson(message))
                } else {
                  Log.d("den/flutter", "events is null while received push")
                }
              }
            }
            -520704162 -> {
              // intentAction == "com.dengage.push.intent.RECEIVE"
              Log.d("den/Flutter", "push is clicked.")
              val message: Message = intent?.getExtras()?.let { Message.createFromIntent(it) }!!
              if (events != null) {
                events.success(Gson().toJson(message))
              } else {
                Log.d("den/flutter", "events is null while clicked push")
              }
            }
          }
        }
      }
}