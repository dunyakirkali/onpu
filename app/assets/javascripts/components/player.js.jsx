var Player = React.createClass({
  propTypes: {
    title: React.PropTypes.string,
    audio: React.PropTypes.string,
    price: React.PropTypes.string
  },

  getPlaybackTime: function(time) {
    var hours = Math.floor(time / 3600);
    var minutes = Math.floor(time / 60);
    if (minutes > 59) {
      minutes = Math.floor(time / 60) - 60;
    }

    var seconds = Math.round(time - minutes * 60);
    if (seconds > 3599) {
      seconds = Math.round(time - minutes * 60) - 3600;
    }

    return time;
  },

  playLocation: function() {
    this.setState({player: $('.player')[0]}, function() {
      var playbackTime = this.getPlaybackTime(this.state.player.currentTime);
      var playbackTime = localStorage.getItem('reactPlayer');

      if (playbackTime !== null) {
        this.state.player.currentTime = playbackTime;
      }
      this.state.player.play();
    })
  },

  pause: function() {
    var playbackTime = this.getPlaybackTime(this.state.player.currentTime);

    localStorage.setItem('reactPlayer', playbackTime);
  },

  ended: function() {
    // Set playback_time to 0.
    localStorage.setItem('reactPlayer', playbackTime);
  },

  render: function() {
    return (
      <div>
        <div>Title: {this.props.title}</div>
        <audio controls className="player" preload="false">
          <source src="{this.props.audio}" />
        </audio>
      </div>
    )
  }
});
