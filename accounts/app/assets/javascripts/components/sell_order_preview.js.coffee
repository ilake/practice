@SellOrderPreview = React.createClass
  render: ->
    React.DOM.div
      className: "order-preview"
      React.DOM.div null,
        "Cost: " + currencyFormat(@props.cost)
      React.DOM.div null,
        "Fee: -" + currencyFormat(@props.fee)
      React.DOM.div null,
        "You Get: " + currencyFormat(@props.get)
