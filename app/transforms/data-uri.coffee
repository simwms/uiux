`import DS from 'ember-data'`
`import dataUriToJpgBlob from '../utils/data-uri-to-jpg-blob'`
DataUriTransform = DS.Transform.extend
  deserialize: (serialized) ->
    throw new Error "We should never have to deserialize files from the server"

  serialize: (deserialized) -> 
    dataUriToJpgBlob deserialized

`export default DataUriTransform`
