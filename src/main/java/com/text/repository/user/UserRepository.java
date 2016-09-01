package com.text.repository.user;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.text.entity.user.UserEntity;

public interface UserRepository extends CrudRepository<UserEntity, Long>{

	Iterable<UserEntity> findByIdIn(List<Long> userIds);
}
