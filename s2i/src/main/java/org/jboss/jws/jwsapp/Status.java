package org.jboss.jws.jwsapp;

import java.time.LocalDateTime;

public class Status {
    String message;
    String time;

    public Status(String message) {
        this.message = message;
        time = LocalDateTime.now().toString();
    }

    // Standard getter/setter

    public String getMessage() {
        return this.message;
    }
    public void setMessage(String message) {
        this.message = message;
    }

    public String getTime() {
        return this.time;
    }
    public void setTime(String time) {
        this.time = time;
    }
}