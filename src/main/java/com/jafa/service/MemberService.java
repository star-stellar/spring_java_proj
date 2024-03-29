package com.jafa.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jafa.domain.AuthVO;
import com.jafa.domain.MemberDTO;
import com.jafa.domain.MemberType;
import com.jafa.domain.MemberVO;
import com.jafa.repository.AuthRepository;
import com.jafa.repository.MemberRepository;

@Service
public class MemberService {

	@Autowired
	MemberRepository memberRepository;
	
	@Autowired
	AuthRepository authRepository; 
	
	// 비밀번호 암호화 
	@Autowired
	PasswordEncoder passwordEncoder;
	
	// 회원가입
	@Transactional
	public void join(MemberDTO dto) {
		dto.setPassword(passwordEncoder.encode(dto.getPassword())); // 비밀번호 암호화 
		memberRepository.save(dto);
		AuthVO authVO = AuthVO.builder()
				.memberId(dto.getMemberId())
				.memberType(MemberType.ROLE_ASSOCIATE_MEMBER)
				.ordinal(MemberType.ROLE_ASSOCIATE_MEMBER.ordinal())
				.build();
		authRepository.save(authVO);
	}
	
	@Transactional
	public void updateMemberType(AuthVO authVO) {
		authRepository.remove(authVO.getMemberId()); // 모든등급삭제 
		MemberType memberType = authVO.getMemberType(); // 변경할 회원등급 
		MemberType[] types = MemberType.values(); // 전체 회원등급
		for(int i=memberType.ordinal(); i<types.length;i++) {
			AuthVO vo = AuthVO.builder()
				.memberId(authVO.getMemberId())
				.memberType(types[i])
				.ordinal(types[i].ordinal())
				.build();
			authRepository.save(vo);
		}
	}
	// 회원목록 조회 
	public List<MemberVO> memberList(){
		return memberRepository.memberList();
	}

	public MemberVO read(String uid) {
		return memberRepository.read(uid);
	}

	@Transactional
	public void memberUpdate(MemberDTO dto) {
		dto.setPassword(passwordEncoder.encode(dto.getPassword())); // 비밀번호 암호화 
		memberRepository.memberUpdate(dto);
	}
}
