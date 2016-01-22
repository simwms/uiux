`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'appointment-links-collection', 'Integration | Component | appointment links collection', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{appointment-links-collection}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#appointment-links-collection}}
      template block text
    {{/appointment-links-collection}}
  """

  assert.equal @$().text().trim(), 'template block text'
