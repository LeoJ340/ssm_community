package com.jsj.mapper;

import java.util.List;

public interface BaseMapper<T> {

    default List<T> getAll(){
        return null;
    }

    default T getById(Integer id){
        return null;
    }

    default int insert(T entity){
        return -1;
    }

    default int update(T entity){
        return -1;
    }

    default int delete(Integer id){
        return -1;
    }
}
