`import Ember from 'ember'`

VideoProxyComponent = Ember.Component.extend
  tagName: 'video'
  classNames: ['video-proxy', 'videojs']
  sizeOptions:
    width: "100%"
    height: "100%"

  didInsertElement: ->
    @manageSource()

  src: Ember.computed "stream", ->
    return if Ember.isBlank @get "stream"
    return if @get "stream.ended"
    window.URL.createObjectURL @get "stream"
    
  manageSource: Ember.observer "src", ->
    return if Ember.isBlank @get "src"
    @set "videoPlayer", videojs @$()[0], @sizeOptions
    @get("videoPlayer").play()

`export default VideoProxyComponent`