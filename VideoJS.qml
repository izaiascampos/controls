///Video palyer based on JWplayer
Item {
	width: 640; height: 480;
	signal error;		///< error occured signal
	signal finished;	///< video finished signal
	property string	source;	///< video source URL
	property Color	backgroundColor: "#000";	///< default background color
	property float	volume: 1.0;		///< video volume value [0:1]
	property bool	loop: false;		///< video loop flag
	property bool	ready: false;		///< read only property becomes 'true' when video is ready to play, 'false' otherwise
	property bool	muted: false;		///< volume mute flag
	property bool	paused: false;		///< video paused flag
	property bool	waiting: false;		///< wating flag while video is seeking and not ready to continue playing
	property bool	seeking: false;		///< seeking flag
	property bool	autoPlay: false;	///< play video immediately after source changed
	property int	duration;			///< content duration in seconds (valid only for not live videos)
	property int	progress;			///< current playback progress in seconds
	property int	buffered;			///< buffered contetnt in seconds
	property bool	logsEnabled: recursiveVisible;

	///@private
	function getTag() { return 'video' }

	///@private
	constructor: {
		this.element.setAttribute('id', 'videojs')
		this.element.setAttribute('controls', '')
		this.element.setAttribute('preload', 'auto')
		this.element.setAttribute('data-setup', '{}')
		this.element.setAttribute('class', 'video-js')

		this._player = window.videojs('videojs')

	}

	///@private
	onSourceChanged: {
		this._player.src(value);
		this._player.ready(function() {
			log("VIDEOJS ready");
		});
	}

	play(state): {
		this._player.play(state)
	}

	onWidthChanged: { 
		this.element.dom.width = value;
		if (this._player)
			this._player.width = value;
	}
	onHeightChanged: { this.element.dom.height = value; }
}