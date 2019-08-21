package com.jsj.mapper;

import com.jsj.bean.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper extends BaseMapper<User> {

    User getUserByPassword(@Param("username") String username, @Param("password") String password);

    User getById(Integer id);

    User getUserByCommentId(Integer commentId);

    int insertUser(User user);
}
