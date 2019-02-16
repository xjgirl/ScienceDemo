package com.wzxy.science.exception;

/**
 * 业务层异常类
 */
public class ServiceException extends BaseRuntimeException {

    private static final long serialVersionUID = -6507789621489718179L;
    public ServiceException(String msg) {
        super(msg);

    }
    public ServiceException(String msg, Throwable cause) {
        super(msg, cause);
    }

}
