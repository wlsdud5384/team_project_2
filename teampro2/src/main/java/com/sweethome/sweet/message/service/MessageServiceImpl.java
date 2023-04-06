package com.sweethome.sweet.message.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sweethome.sweet.message.vo.MessageVO;
import com.sweethome.sweet.message.dao.MessageDAO;

@Service("messageService")
@Transactional(propagation = Propagation.REQUIRED)
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	MessageDAO messageDAO;
	
	//���� ��� ����
	@Override
	public List<MessageVO>selectAllMessageList(String member_id)throws Exception {
		return messageDAO.selectAllMessageList(member_id);
	}
	
	//���� �ۼ�

	@Override
	public void insertMessage(MessageVO messageVO)throws Exception {
		messageDAO.insertMessage(messageVO);
	}
	
	//�󼼺��� �߰�
    @Override
    public MessageVO noteRead(int no) throws Exception {
        return messageDAO.noteRead(no);
    }
    
    //���� ����
    @Override
    public void deleteNote(int no)throws Exception {
    	messageDAO.noteDelete(no);
    }
}
