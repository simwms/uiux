`import DS from 'ember-data'`

ArrayTransform = DS.Transform.extend
  deserialize: (serialized) -> serialized

  serialize: (deserialized) -> deserialized

`export default ArrayTransform`
