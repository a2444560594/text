package com.text.controller.user;

import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.text.controller.commons.Output;
import com.text.controller.commons.OutputList;
import com.text.controller.commons.ReturnStatus;
import com.text.entity.user.UserEntity;
import com.text.service.user.UserService;

@RestController
@RequestMapping("user")
public class UserController {

	static Logger log = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserService userService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam String username, @RequestParam String password) {
		try {
			UserEntity user = new UserEntity(username, password);
			userService.save(user);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output edit(@RequestParam Long Id, @RequestParam String username, @RequestParam String password) {
		try {
			UserEntity user = userService.findOne(Id);
			userService.edit(user, username, password);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String userIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(userIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			userService.delete(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/findAll", method = RequestMethod.POST)
	public OutputList findAll() {
		try {
			return new OutputList(userService.findAll(), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long Id) {
		try {
			return new Output(userService.findOne(Id), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
}
