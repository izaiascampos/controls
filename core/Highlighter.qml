Rectangle {
	property Object target;
	property string updatePositionProperty: "currentIndex";
	width: 100;
	height: 100;
	color: "#fff";

	function _updatePos() {
		var target = this.target
		var item = target.getItemPosition(target[this.updatePositionProperty])
		var horizontal = target.orientation ===  _globals.core.ListView.prototype.Horizontal
		if (horizontal) {
			this.x = target.x + item[0]
			this.width = item[2]
		} else {
			this.y = target.y + item[1]
			this.height = item[3]
		}
	}

	onCompleted: {
		var target = this.target
		this.connectOnChanged(target, this.updatePositionProperty, this._updatePos.bind(this))
		this.connectOnChanged(target, "count", this._updatePos.bind(this))
		this.connectOnChanged(target, "activeFocus", this._updatePos.bind(this))
		this._updatePos()
	}
}
