`import Ember from 'ember'`

groupInto3s = (strs, char) ->
  [str, xs...] = strs
  if str.length >= 3
    [char].concat strs
  else
    xs.unshift  char.concat str
    xs

separateWith = (numStr, sep) ->
  numStr
  .split("")
  .reduceRight(groupInto3s, [""])
  .join(sep)

# This function receives the params `params, hash`
num = ([number, separator]) ->
  number ?= 0
  separator ?= ","
  [whole, decimal] = number.toString().split(".")
  [separateWith(whole, separator), decimal]
  .filter (x) -> x?
  .join separator

NumHelper = Ember.HTMLBars.makeBoundHelper num

`export { num }`

`export default NumHelper`
