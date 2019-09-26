package com.jsj.mapper;

public interface BaseMapper<T> {

    default T getById(Integer id){
        return null;
    }

    default int insert(T entity){
        return -1;
    }

}
