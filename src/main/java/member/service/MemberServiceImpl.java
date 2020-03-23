package member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public MemberDTO login(Map<String, String> map) {
		return memberDAO.login(map);
	}

	@Override
	public String isExistId(String id) {
		MemberDTO memberDTO = memberDAO.isExistId(id);
		if(memberDTO!=null)
			return "exist";
		else
			return "non_exist";
	}

	@Override
	public List<ZipcodeDTO> postSearch(Map<String, String> map) {
		return memberDAO.postSearch(map);
	}

	@Override
	public int write(MemberDTO memberDTO) {
		return memberDAO.write(memberDTO);
	}

}










