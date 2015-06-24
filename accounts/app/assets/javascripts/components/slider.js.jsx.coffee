#= require react-slider

@Slider = React.createClass
  getInitialState: ->
    value: @props.defaultValue

  handleChange: (value)->
    @setState({value: value})

  render: ->
    `<div className="order-preview">
       <ReactSlider value={this.state.value} onChange={this.handleChange} step={2} />
     </div>
     `
