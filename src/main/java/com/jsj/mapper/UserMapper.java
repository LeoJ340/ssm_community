package com.jsj.mapper;

import com.jsj.bean.User;

public interface UserMapper extends BaseMapper<User> {

    User getUserByPassword(String username, String password);

    User getById(Integer id);

    User getUserByCommentId(Integer commentId);
}
