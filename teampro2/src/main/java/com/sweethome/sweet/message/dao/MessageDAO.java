package com.sweethome.sweet.message.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.sweethome.sweet.message.vo.MessageVO;

public interface MessageDAO {
	
	//���� ���
	public List<MessageVO>selectAllMessageList(String member_id) throws Exception;
	//���� ����
	public void insertMessage(MessageVO messageVO) throws Exception;
	//�߰�
	public MessageVO noteRead(int no) throws Exception;
	//����
	public void noteDelete(int no) throws Exception;
}
