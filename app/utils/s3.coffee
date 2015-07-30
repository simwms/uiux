`import Ember from 'ember'`
`import dataUriToJpgBlog from './data-uri-to-jpg-blob'`

class S3
  @accessKeyId = 'AKIAINYEM24JX5TX33LA'
  @secretAccessKey = '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'
  @region = 'us-east-1'
  @namespace = 'charlie-bravo'

makeBucket = ->
  new S3.Bucket S3

buildParams = (pic) ->
  file = dataUriToJpgBlog pic.get "file"
  
  ACL: "public-read-write"
  StorageClass: "REDUCED_REDUNDANCY"
  Key: "catsome-key-56546.jpg"
  Body: file
  ContentType: file.type

class S3.Bucket
  @makeBucket = makeBucket
  constructor: ({accessKeyId, secretAccessKey, region}) ->
    AWS.config.update {accessKeyId, secretAccessKey}
    AWS.config.region = region
    @bucket = new AWS.S3 
      params: 
        Bucket: "simwms"

  upload: (pic) ->
    params = buildParams pic
    new Ember.RSVP.Promise (resolve, reject) =>
      @bucket.upload params, (err, data) ->
        if err
          reject data
        else
          data.key = params["Key"]
          console.log data
          resolve data


`export {makeBucket}`
`export default S3`