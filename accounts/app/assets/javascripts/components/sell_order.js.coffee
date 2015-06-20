@SellOrder = React.createClass
  getInitialState: ->
    amount: @props.data.amount
    rate: @props.data.rate
  handleChange: (e)->
    name = e.target.name
    @setState("#{name}": e.target.value)
  handleSubmit: (e)->
    e.preventDefault()
    $.post '/sell_orders', { sell_order: @state }, (data) =>
      @setState @getInitialState()
    , 'JSON'
  calculateCost: ->
    return 0 if @state.rate == 0 || @state.rate == ""
    NumberFormat(@state.amount) / NumberFormat(@state.rate)
  calculateFee: ->
    @calculateCost() * 0.2
  calculateGet: ->
    @calculateCost() - @calculateFee()
  valid: ->
    (100000 <= NumberFormat(@state.amount) <= 1000000) && (2500 <= NumberFormat(@state.rate) <= 4000)
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Amount'
          name: 'amount'
          value: localeFormat(NumberFormat(@state.amount))
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Rate'
          name: 'rate'
          value: localeFormat(NumberFormat(@state.rate))
          onChange: @handleChange
      React.createElement SellOrderPreview, cost: @calculateCost(), fee: @calculateFee(), get: @calculateGet()
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create record'
