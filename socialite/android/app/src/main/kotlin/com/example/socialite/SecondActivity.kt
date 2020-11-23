package com.example.socialite

import android.app.Activity
import android.os.Bundle
import android.util.Log
import kotlinx.android.synthetic.main.activity_second.*

class SecondActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second)

        if (intent.hasExtra("ARG")) {
            tvText.text = intent.getStringExtra("ARG")
        }
        Log.i("Meenu", "This is Second Activity")

    }
}