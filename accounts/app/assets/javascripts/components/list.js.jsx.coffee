@List = React.createClass
  render: ->
    `<li id={this.props.key}>
        {this.props.value}
     </li>`
