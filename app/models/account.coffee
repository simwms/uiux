`import DS from 'ember-data'`

Account = DS.Model.extend
  accessKeyId: DS.attr "string"
  secretAccessKey: DS.attr "string"
  region: DS.attr "string"
  namespace: DS.attr "string"
  

`export default Account`