package com.myak.rnradiostream

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import android.net.Uri
import com.google.android.exoplayer2.ExoPlayerFactory
import com.google.android.exoplayer2.source.ExtractorMediaSource
import com.google.android.exoplayer2.upstream.DefaultDataSourceFactory
import com.google.android.exoplayer2.upstream.DefaultBandwidthMeter
import com.google.android.exoplayer2.trackselection.DefaultTrackSelector
import com.google.android.exoplayer2.trackselection.AdaptiveTrackSelection
import com.google.android.exoplayer2.extractor.DefaultExtractorsFactory
import com.google.android.exoplayer2.SimpleExoPlayer
import com.google.android.exoplayer2.util.Util

import java.util.HashMap

/**
 * Created by MatheusLuz on 07/04/18.
 */

class MLRadioStream(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {
    override fun getName(): String {
        return "MLRadioStreamManager"
    }

    private lateinit var player: SimpleExoPlayer

    private fun initPlayer(url: String) {
        val bandwidthMeter = DefaultBandwidthMeter()
        val extractorsFactory = DefaultExtractorsFactory()
        val trackSelectionFactory = AdaptiveTrackSelection.Factory(bandwidthMeter)
        val trackSelector = DefaultTrackSelector(trackSelectionFactory)
        val defaultBandwidthMeter = DefaultBandwidthMeter()
        val dataSourceFactory = DefaultDataSourceFactory(reactApplicationContext,
                Util.getUserAgent(reactApplicationContext, "MLRadioStream"), defaultBandwidthMeter)
        val mediaSource = ExtractorMediaSource(Uri.parse(url), dataSourceFactory, extractorsFactory, null, null)
        player = ExoPlayerFactory.newSimpleInstance(reactApplicationContext, trackSelector)
        player.prepare(mediaSource)
    }

    @ReactMethod
    fun play(url: String) {
        initPlayer(url)
        player.playWhenReady = true
    }

    @ReactMethod
    fun stop() {
        player.playWhenReady = false
    }

    @ReactMethod
    fun setupRadio(radioArtist: String, radioTitle: String) {
        print(radioArtist)
    }
}