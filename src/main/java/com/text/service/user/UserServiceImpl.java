package com.text.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.text.entity.user.UserEntity;
import com.text.repository.user.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepository;

	@Override
	public void save(UserEntity user) {
		userRepository.save(user);
	}

	@Override
	public void edit(UserEntity user, String username, String password) {
		user.setUsername(username);
		user.setPassword(password);
		userRepository.save(user);
	}

	@Override
	public void delete(List<Long> userIds) {
		Iterable<UserEntity> it = userRepository.findByIdIn(userIds);
		userRepository.delete(it);
	}

	@Override
	public List<UserEntity> findAll() {
		return (List<UserEntity>) userRepository.findAll();
	}

	@Override
	public UserEntity findOne(Long Id) {
		return userRepository.findOne(Id);
	}
}
