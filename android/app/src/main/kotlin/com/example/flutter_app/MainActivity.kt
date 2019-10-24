package com.example.flutter_app

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.view.FlutterView
import android.content.Intent
import android.net.Uri


class MainActivity: FlutterActivity() {

  private  final var CHANNEL="demo.flutter.com/info"

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    MethodChannel(getFlutterView(),CHANNEL)
            .setMethodCallHandler(MethodChannel.MethodCallHandler { methodCall, result ->
              run {
                if (methodCall.method.equals("getmessage")) {
                  try {
                    val text = "This is a test"// Replace with your message.

                    val toNumber = "919140404277" // Replace with mobile phone number without +Sign or leading zeros, but with country code
                    //Suppose your country is India and your phone number is “xxxxxxxxxx”, then you need to send “91xxxxxxxxxx”.


                    val intent = Intent(Intent.ACTION_VIEW)
                    intent.data = Uri.parse("http://api.whatsapp.com/send?phone=$toNumber&text=$text")
                    startActivity(intent)
                  } catch (e: Exception) {
                    e.printStackTrace()
                  }


                  var msg:String="Hi"
                    result.success(msg)
                }
              }
            })
  }
}
