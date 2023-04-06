package com.sweethome.sweet.message.service;

import java.util.List;
import java.util.Map;

import com.sweethome.sweet.message.vo.MessageVO;

public interface MessageService {
	//�������
	public List<MessageVO> selectAllMessageList(String member_id) throws Exception; 
	//��������
	public void insertMessage(MessageVO messageVO) throws Exception;
	//�󼼺��� �߰�
	public MessageVO noteRead(int no) throws Exception;
	//���� ���� �߰�
	public void deleteNote(int no)throws Exception;
}
