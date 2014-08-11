EBView = require '../EBView'
ScrollView = require 'famous/views/ScrollView'
Surface = require 'famous/core/Surface'
ImageSurface = require 'famous/surfaces/ImageSurface'
Modifier = require 'famous/core/Modifier'
Transform = require 'famous/core/Transform'
$ = require '../../EBHttp'

EBInstagramListItem = require './EBInstagramListItem'

class EBInstagramList extends EBView
  constructor: ->
    super
    console.log 'creating new instagram view'

    background = new Surface
      properties:
        backgroundColor: '#FFC897'
      classes: ['main-background']

    backgroundModifier = new Modifier
      transform: Transform.translate 0, 0, 1

    @add backgroundModifier
    .add background
    
    @scrollView = new ScrollView @options.scroll
    scrollViewPositioningModifier = new Modifier
      transform: Transform.translate 0, 7.5, 2
    @images = []
    @scrollView.sequenceFrom @images
    @add scrollViewPositioningModifier
    .add @scrollView
    @getImages().catch @error

EBInstagramList.DEFAULT_OPTIONS =
  scroll:
    clipSize: 600
    margin: 600

EBInstagramList::getImages = ->
  $.get 'https://s3-us-west-2.amazonaws.com/com.adamcmiel.energiesbalanced/eb_instagram_feed.json'
   .endAsync (data) =>
     imageData = JSON.parse data.text
     @addImages imageData

EBInstagramList::addImages = (data) ->
  console.log "Adding Images, API Version: #{data.api_version}"
  (@addImage imageURL for imageURL in data.images)

EBInstagramList::addImage = (url) ->
  image = new EBInstagramListItem url
  @scrollView.subscribe image
  @images.push image

EBInstagramList::Error = class EBInstagramListError extends Error
  constructor: (@message) ->
    @name = "EBInstagramListError"
    Error.captureStackTrace(this, EBInstagramListError)

module.exports = EBInstagramList
