package com.wzxy.science.exception;

public class AccessDeniedException extends BaseRuntimeException {
    private static final long serialVersionUID = -3775777284874712238L;

    public AccessDeniedException(String msg) {
        super(msg);

    }
}
