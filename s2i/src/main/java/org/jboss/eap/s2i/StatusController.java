package org.jboss.eap.s2i;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;

@Path("status")
@Produces(MediaType.APPLICATION_JSON)
public class StatusController {

	@GET
	public Status isUp() {
		Logger log = Logger.getLogger(getClass());

		log.info("****** Called the StatusController ******");
		Status restStatus = new Status("The Java REST API is something different!");

		return restStatus;

	}
}
