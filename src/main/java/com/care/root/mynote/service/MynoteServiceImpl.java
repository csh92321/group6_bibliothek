package com.care.root.mynote.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.mybatis.mynote.MynoteMapper;

@Service
public class MynoteServiceImpl implements MynoteService {

	@Autowired MynoteMapper mapper;
	
}
