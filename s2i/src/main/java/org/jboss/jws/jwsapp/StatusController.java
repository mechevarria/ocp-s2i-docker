package org.jboss.jws.jwsapp;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;


@Path("status")
@Produces(MediaType.APPLICATION_JSON)
public class StatusController {
	
	@GET
	public Status isUp() {

		Status restStatus = new Status("The Java REST API is now up!");

		return restStatus;

	}
}
