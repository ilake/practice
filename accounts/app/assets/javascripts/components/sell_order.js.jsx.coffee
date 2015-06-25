#= require utils
#= require react-slider

@SellOrder = React.createClass
  mixins: [@Common]
  getInitialState: ->
    amount: @props.data.amount
    rate: @props.data.rate
  handleChange: (e)->
    name = e.target.name
    newState = {}
    newState[e.target.name] = e.target.value
    console.info(e.target.value)
    @setState(newState)
  sliderChange: (value)->
    @setState({rate: value})
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
  testRefFeature: (e)->
    e.preventDefault()
    alert(@refs.preview.test())
  valid: ->
    (100000 <= NumberFormat(@state.amount) <= 1000000) && (2500 <= NumberFormat(@state.rate) <= 4000)
  render: ->
    `<div>
      <button type="button" className="btn btn-primary" onClick={this.testRefFeature}>
        Test Ref Feature
      </button>
      <button type="button" className="btn btn-primary" onClick={this.shared}>
        Test Mix Feature
      </button>
      <form className="form-inline" onSubmit={this.handleSubmit}>
        <div className="form-group">
          <input type="text" className="form-control" placeholder="100,000 min" name="amount"
                 value={localeFormat(NumberFormat(this.state.amount))} onChange={this.handleChange}/>
        </div>
        <div className="form-group">
          <input type="text" className="form-control" placeholder="Rate" name="rate" readOnly
                 value={localeFormat(NumberFormat(this.state.rate))} onChange={this.handleChange}/>
        </div>

        <ReactSlider value={this.state.rate} onChange={this.sliderChange} min={2000} max={4000} step={50} withBars />
        <SellOrderPreview cost={this.calculateCost()} fee={this.calculateFee()} get={this.calculateGet()} ref="preview" />
        <button type="submit" className="btn btn-primary" disabled={!this.valid()}>
          Create Order
        </button>
      </form>
     </div>`
