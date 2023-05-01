package tw.eeit117.wematch.member.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("MemberDAO")
public class MemberDAO {

	private Member member;
	private SessionFactory sessionFactory;

	@Autowired
	public MemberDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public boolean checkLogin(Member users) {
		Session session = sessionFactory.getCurrentSession();
		Member resultAccount = selectMember(users.getMemberAccount(), users.getMemberPwd());
		System.out.println(resultAccount);
		if (resultAccount != null) {
			return true;
		} else {
			return false;
		}
	}

	public boolean insertMember(String memberAccount, String memberPwd) {
		Session session = sessionFactory.getCurrentSession();
		
		String hqlstr = "From Member where memberAccount=:user";
		Query<Member> query = session.createQuery(hqlstr, Member.class);
		query.setParameter("user", memberAccount);
		Member resultAccount = query.uniqueResult();

		if (resultAccount != null) {
			return false;
		} else {
			Member member = new Member();
			member.setMemberAccount(memberAccount);
			member.setMemberPwd(memberPwd);
			member.setMemberStatus(1);
			Serializable identifier = session.save(member);
			System.out.println("identifier:" + identifier);

			return true;
		}
	}

	public Member selectMember(String memberAccount, String memberPwd) {
		Session session = sessionFactory.getCurrentSession();

		String hqlstr = "From Member where memberAccount=:user and memberPwd=:pwd";
		Query<Member> query = session.createQuery(hqlstr, Member.class);
		query.setParameter("user", memberAccount);
		query.setParameter("pwd", memberPwd);
		Member resultAccount = query.uniqueResult();
		
		return resultAccount;
	}

	public Member selectMemberByAccountAndEmail(String memberAccount, String memberEmail) {
		Session session = sessionFactory.getCurrentSession();

		String hqlstr = "From Member where memberAccount=:account and memberEmail:mail";
		Query<Member> query = session.createQuery(hqlstr, Member.class);
		query.setParameter("account", memberAccount);
		query.setParameter("mail", memberEmail);
		Member resultAccount = query.uniqueResult();

		return resultAccount;
	}
	
	public void forgotPwd(String memberPwd, String memberAccount) {
		Session session = sessionFactory.getCurrentSession();
		
		member = selectMemberByAccount(memberAccount);
		member.setMemberPwd(memberPwd);
	}

	public Member selectMemberByAccount(String memberAccount) {
		Session session = sessionFactory.getCurrentSession();
		
		String hqlstr = "From Member where memberAccount=:account";
		Query<Member> query = session.createQuery(hqlstr, Member.class);
		query.setParameter("account", memberAccount);
		Member resultAccount = query.uniqueResult();
		
		return resultAccount;
	}
	
	public Member selectMemberById(int memberId) {
		Session session = sessionFactory.getCurrentSession();

		String hqlstr = "From Member where memberId=:id";
		Query<Member> query = session.createQuery(hqlstr, Member.class);
		query.setParameter("id", memberId);
		Member resultAccount = query.uniqueResult();

		return resultAccount;
	}

	public List<Member> selectAllMember() {
		Session session = sessionFactory.getCurrentSession();

		Query<Member> query = session.createQuery("From Member", Member.class);
		List<Member> resultAccount = query.getResultList();
		return resultAccount;
	}

	public void updateMember(Member member, HttpSession HttpSession) {
		Session session = sessionFactory.getCurrentSession();

		String hqlstr = "Update Member set memberName=:name, nickname=:nickname, gender=:gender, memberEmail=:mail, birthdayDate=:birthday, starSign=:starSign, city=:city, bloodType=:bloodType, hobbies=:hobbies, selfIntro=:selfIntro where memberAccount=:account";
		Query<Member> query = (Query<Member>) session.createQuery(hqlstr);
		query.setParameter("name", member.getMemberName());
		query.setParameter("nickname", member.getNickname());
		query.setParameter("gender", member.getGender());
		query.setParameter("mail", member.getMemberEmail());
		query.setParameter("birthday", member.getBirthdayDate());
		query.setParameter("starSign", member.getStarSign());
		query.setParameter("city", member.getCity());
		query.setParameter("bloodType", member.getBloodType());
		query.setParameter("hobbies", member.getHobbies());
		query.setParameter("selfIntro", member.getSelfIntro());
		query.setParameter("account", HttpSession.getAttribute("Account").toString());
		query.executeUpdate();
	}
	
	public void updateMemberPic1(HttpSession HttpSession, byte[] p1) {
		Session session = sessionFactory.getCurrentSession();
		
		String hqlstr = "Update Member set picture_1=:p1 where memberAccount=:account";
		Query<Member> query = (Query<Member>) session.createQuery(hqlstr);
		
		query.setParameter("p1", member.getPicture_1());
		query.setParameter("account", HttpSession.getAttribute("Account").toString());
		query.executeUpdate();
	}

	public void updateMemberPic2(HttpSession HttpSession, byte[] p2) {
		Session session = sessionFactory.getCurrentSession();
		
		String hqlstr = "Update Member set picture_2=:p2 where memberAccount=:account";
		Query<Member> query = (Query<Member>) session.createQuery(hqlstr);
		
		query.setParameter("p2", member.getPicture_2());
		query.setParameter("account", HttpSession.getAttribute("Account").toString());
		query.executeUpdate();
	}
	
	public void adminUpdateMember(Member member, HttpSession HttpSession) {
		Session session = sessionFactory.getCurrentSession();
		
		String hqlstr = "Update Member set memberName=:name, nickname=:nickname, gender=:gender, memberEmail=:mail, birthdayDate=:birthday, starSign=:starSign, city=:city, bloodType=:bloodType, hobbies=:hobbies, selfIntro=:selfIntro where memberAccount=:account";
		Query<Member> query = (Query<Member>) session.createQuery(hqlstr);
		query.setParameter("name", member.getMemberName());
		query.setParameter("nickname", member.getNickname());
		query.setParameter("gender", member.getGender());
		query.setParameter("mail", member.getMemberEmail());
		query.setParameter("birthday", member.getBirthdayDate());
		query.setParameter("starSign", member.getStarSign());
		query.setParameter("city", member.getCity());
		query.setParameter("bloodType", member.getBloodType());
		query.setParameter("hobbies", member.getHobbies());
		query.setParameter("selfIntro", member.getSelfIntro());
		query.setParameter("account", member.getMemberAccount());
		query.executeUpdate();
	}

	public void deleteMember(Integer memberId) {
		Session session = sessionFactory.getCurrentSession();

		String hqlstr = "From Member where memberId=:mId";
		Query<Member> query = session.createQuery(hqlstr, Member.class);
		query.setParameter("mId", memberId);

		Member resultAccount = query.uniqueResult();
		session.delete(resultAccount);
	}
	
	public String checkMemberAccount(String memberAccount) {
		Session session = sessionFactory.getCurrentSession();
		String hqlstr = "FROM Member WHERE memberAccount=:account";
		String mAccount = "";
		try {
			Member m = (Member)session.createQuery(hqlstr).setParameter("account", memberAccount).uniqueResult();
			mAccount = m.getMemberAccount();
		} catch (NoResultException ex) {
			;
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println("ErrorMsg=" + ex.getMessage());
			mAccount = "Error: 資料庫異常，請檢查資料庫";
		}
		return mAccount;
	}
}
