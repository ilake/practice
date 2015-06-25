@SellOrderPreview = React.createClass
  test: ->
    "This is from ref Component"
  render: ->
    `<div className="order-preview">
       <div>Cost:  {currencyFormat(this.props.cost)}</div>
       <div>Fee: -:  {currencyFormat(this.props.fee)}</div>
       <div>You Get:  {currencyFormat(this.props.get)}</div>
       <div>{this.test()}</div>
     </div>
    `
