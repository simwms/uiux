`import Ember from 'ember'`

TempObject = Ember.Object.extend
  save: (s3post, store) ->
    s3post.persist @get "datauri"
    .then (s3ticket) =>
      store.createRecord "picture",
        assocId: @get("parentId")
        assocType: @get("parentType")
        location: s3ticket.get("showUrl")
        key: s3ticket.get("key")
      .save()

PicturesCollection = Ember.ArrayProxy.extend
  files: Ember.computed.alias "content"
  datauris: Ember.computed.alias "content"
  tmpPictures: Ember.computed.map "datauris", (datauri) -> 
    TempObject.create 
      parentType: @get("parentType")
      parentId: @get("parent.id")
      datauri: datauri
  save: (s3post, store) ->
    Ember.RSVP.all @get("tmpPictures").map (pic) -> pic.save s3post, store

PicturesCollection.fromWeighticket = (weighticket) ->
  PicturesCollection.create
    parentType: "weighticket"
    parent: weighticket
    content: weighticket.getWithDefault("dataUris", [])

`export default PicturesCollection`