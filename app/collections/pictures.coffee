`import Ember from 'ember'`
`import {makeBucket} from 'uiux/utils/s3'`

TempObject = Ember.Object.extend
  save: (store) ->
    makeBucket().upload @
    .then ({Location, ETag, key}) =>
      store.createRecord "picture",
        assocId: @get("parentId")
        assocType: @get("parentType")
        location: Location
        etag: ETag
        key: key
      .save()

PicturesCollection = Ember.ArrayProxy.extend
  files: Ember.computed.alias "content"
  tmpPictures: Ember.computed.map "files", (file) -> 
    TempObject.create 
      parentType: @get("parentType")
      parentId: @get("parent.id")
      file: file
  save: (store) ->
    Ember.RSVP.all @get("tmpPictures").map (pic) -> pic.save store

PicturesCollection.fromWeighticket = (weighticket) ->
  PicturesCollection.create
    parentType: "weighticket"
    parent: weighticket
    content: weighticket.getWithDefault("dataUris", [])

`export default PicturesCollection`