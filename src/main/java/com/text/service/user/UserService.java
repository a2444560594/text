package com.text.service.user;

import java.util.List;

import com.text.entity.user.UserEntity;

public interface UserService {

	void save(UserEntity user);

	void edit(UserEntity user, String username, String password);

	void delete(List<Long> userIds);

	List<UserEntity> findAll();

	UserEntity findOne(Long Id);

}
