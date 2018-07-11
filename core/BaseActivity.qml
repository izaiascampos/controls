///base activity control
Item {
	property string name;			///< activity name
	property Item manager: parent;	///< activities manager
	visible: false;					///< @private

	signal started;		///< activity started signal
	signal stopped;		///< activity stopped signal

	/**
	 * Initialize activity
	 * @param {object} intent - required data for activity
	 * @param {object} state - init activity state
	 */
	init(intent, state): { }

	/**
	 * Push activity in manager activities stack to show it
	 * @param {string} name - activity name
	 * @param {object} intent - required data for activity
	 * @param {object} state - init activity state
	 */
	push(name, intent, state): { this.manager.push(name, intent, state) }

	/**
	 * Replace top activity with new one
	 * @param {string} name - activity name
	 * @param {object} intent - required data for activity
	 * @param {object} state - init activity state
	 */
	replaceTopActivity(name, intent, state): { this.manager.replaceTopActivity(name, intent, state) }

	/**
	 * Change activity state
	 * @param {object} state - init activity state
	 * @param {string} name - activity name
	 */
	setState(state, name): { this.manager.setState(state, name) }

	/**
	 * Change activity intent
	 * @param {object} state - init activity state
	 * @param {string} name - activity name
	 */
	setIntent(state, name): { this.manager.setIntent(state, name) }

	///clear all activities from manager stack
	clear: { this.manager.clear() }

	/// Pop current top activity from manager stack
	pop: { this.manager.pop() }

	///@private
	onBackPressed: { this.manager.pop(); return true }
}