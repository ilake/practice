var CommentList = React.createClass({
  var commentNodes = this.props.data.map(function (comment) {
    return (
      <Comment author={comment.author}>
        {comment.text}
      </Comment>
    );
  });

  render: function() {
    return (
      <div className="commentList">
        {commentNodes}
      </div>
    );
  }
});
