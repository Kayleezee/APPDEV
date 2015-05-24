package com.naumann.klaus.myfirstandroidapp;

import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;


public class DisplayMessageActivity extends MyActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // get message from intent
        Intent intent = getIntent();
        String message = intent.getStringExtra(MyActivity.EXTRA_MESSAGE);

        // create textview
        TextView textView = new TextView(this);
        textView.setTextSize(40);
        textView.setText(message);

        // set textview as activity layout
        setContentView(textView);

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    }

}
