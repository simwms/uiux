`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'top-nav', 'Integration | Component | top nav', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{top-nav}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#top-nav}}
      template block text
    {{/top-nav}}
  """

  assert.equal @$().text().trim(), 'template block text'
