/**
 * I am a ColdBox module that logs ColdBox Framework Inits with BugLog
 */
component {

	this.name = "cbInitLogger-buglog";
    this.author = "Gavin Pickin";
    this.webUrl = "https://github.com/gpickin/cbInitLogger-buglog";

    function configure() {

    }

    /**
     * This function is the core of the Reinit Logger Buglog module. This fires on are Init and logs the reinit with BugLog
     * @event
     * @interceptData
     * @buffer
     * @rc
     * @prc
     */
    function afterAspectsLoad( event, interceptData, buffer, rc, prc ) {
		wireBox.getInstance( "BugLogService@bugloghq" ).notifyService(
			message 		= "Framework Initialized",
			exception 		= { message = "Framework Initialized"},
			extraInfo 		= { cgi = cgi, requestData = getHTTPRequestData() },
			severityCode 	= "info"
		);

	}
}