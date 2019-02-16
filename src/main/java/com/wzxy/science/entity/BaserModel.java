package com.wzxy.science.entity;

import java.io.Serializable;

/**
 * 模型基类，所有子类继承于它并覆盖toString方法
 */
public abstract class BaserModel implements Serializable {
    private static final long serialVersionUID = -6388545626195096054L;
    public abstract String toString();
}
