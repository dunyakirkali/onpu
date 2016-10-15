var Player = React.createClass({
  propTypes: {
    title: React.PropTypes.string,
    audio: React.PropTypes.string,
    price: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
        <div>Title: {this.props.title}</div>
        <div>Audio: {this.props.audio}</div>
        <div>Price: {this.props.price}</div>
      </div>
    );
  }
});
