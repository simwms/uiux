`import moment from 'moment'`
`import D from './debug-ex'`
startOfWorkday = (m) -> 
  r = moment(m) if m?
  r ?= moment()
  r.startOf("day").add(6, "hours")

finishOfWorkday = (m) -> startOfWorkday(m).add(14, "hours")

withinWorkingHours = (m) ->
  startOfWorkday(m) < m < finishOfWorkday(m)

class PunchCard
  @startOfWorkday = startOfWorkday
  @finishOfWorkday = finishOfWorkday
  @withinWorkingHours = withinWorkingHours

`export default PunchCard`
`export {
  startOfWorkday,
  finishOfWorkday,
  withinWorkingHours
}`