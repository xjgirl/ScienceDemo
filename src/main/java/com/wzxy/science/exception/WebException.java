package com.wzxy.science.exception;

public class WebException extends BaseRuntimeException {

    private static final long serialVersionUID = 343429387410330920L;

    public WebException(String msg) {
        super(msg);

    }

    public WebException(String msg, Throwable cause) {
        super(msg, cause);

    }
}
