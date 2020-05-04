package com.tj.pj.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.pj.dto.ActEventDate;
import com.tj.pj.dto.Activity;
import com.tj.pj.dto.ActivityCategory;
import com.tj.pj.dto.ActivityReserve;
import com.tj.pj.dto.ActivityVO;
import com.tj.pj.dto.LikeActivity;
import com.tj.pj.dto.LikeHost;
import com.tj.pj.dto.Member;
import com.tj.pj.dto.Review;
import com.tj.pj.dto.ReviewLike;
import com.tj.pj.service.ActivityFileUpService;
import com.tj.pj.service.ActivityService;
import com.tj.pj.service.HostService;
import com.tj.pj.service.ReviewFileUpService;
import com.tj.pj.service.ReviewService;
import com.tj.pj.util.Paging;

@Controller
public class ActivityController {

	@Autowired
	private ActivityService aService;
	@Autowired
	private ActivityFileUpService afService;
	@Autowired
	private ReviewService rService;
	@Autowired
	private ReviewFileUpService rfService;
	@Autowired
	private HostService hService;
	
	private int check = 0;
	
	////////////////////////////////
	// 액티비티 관련 //
	////////////////////////////////
	// 액티비티 생성 화면
	@RequestMapping(value = "activityWriteForm", method = RequestMethod.GET)
	public String activityWriteForm() {
		return "activity/activityWrite";
	}

	@RequestMapping(value = "activityWriteForm", method = RequestMethod.POST)
	public String activityWrite_post() {
		return "activity/activityWrite";
	}

	// 액티비티 생성
	@RequestMapping(value = "activityCategory", method = RequestMethod.GET)
	public String activityCategory(ActivityCategory aCategory, Model model) {
		check = 0;
		if (aCategory.getActCategory() != null) {
			model.addAttribute("aCategory2", aService.activityCategoryList(aCategory));
		}
		if (aCategory.getActCategory2() != null) {
			model.addAttribute("aCategory3", aService.activityCategory2List(aCategory));
		}
		if (aCategory.getActCategory3() != null) {
			model.addAttribute("aCategory4", aService.activityCategory3List(aCategory));
		}
		if (aCategory.getActCategory4() != null) {
			if (aService.activityCategory4List(aCategory).size() > 1) {
				model.addAttribute("aCategory5", aService.activityCategory4List(aCategory));
			}
		}
		return "forward:activityWriteForm.do";
	}

	@RequestMapping(value = "activityTitle", method = RequestMethod.POST)
	public String activityTitle(ActivityCategory aCategory, Model model) {
		model.addAttribute("actCno", aService.activityCategoryCheck(aCategory));
		return "activity/activityTitle";
	}

	@RequestMapping(value = "activityMemberCnt", method = RequestMethod.POST)
	public String activityMemberCnt(MultipartHttpServletRequest mRequest, Model model) {
		afService.FileUp(mRequest, model);
		return "activity/memberCntForm";
	}

	@RequestMapping(value = "activityClude", method = RequestMethod.POST)
	public String activityClude(Activity activity, String actAddress2) {
		return "activity/activityClude";
	}

	@RequestMapping(value = "activityPolicy", method = RequestMethod.POST)
	public String activityPolicy(Activity activity) {
		return "activity/activityPolicy";
	}

	@RequestMapping(value = "activityInfo", method = RequestMethod.POST)
	public String activityInfo(Activity activity) {
		return "activity/activityInfo";
	}

	@RequestMapping(value = "activityInfoUpload", method = RequestMethod.POST)
	public String activityInfoUpload(ActivityVO activityVO, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		activityVO = afService.activityVO(activityVO, request, response);
		model.addAttribute("filePath", activityVO.getAttachPath() + activityVO.getFilename());
		model.addAttribute("filename", activityVO.getFilename());
		return "activity/ckeditorUp";
	}

	@RequestMapping(value = "activityCheck", method = RequestMethod.POST)
	public String activityCheck(Activity activity, Model model) {
		return "activity/activityCheck";
	}

	@RequestMapping(value = "activityWrite", method = RequestMethod.POST)
	public String activityWrite(Activity activity, Model model) {
		int result = aService.activityWrite(activity);
		if (result == 1) {
			model.addAttribute("activityWrite", "액티비티 생성 완료");
		} else {
			model.addAttribute("errorMsg", "액티비티 생성 실패");
		}
		return "forward:main.do";
	}

	@RequestMapping(value = "activityModifyForm", method = RequestMethod.GET)
	public String activityModifyForm(Activity activity, Model model) {
		model.addAttribute("activity", aService.getActivity(activity));
		return "activity/activityModifyForm";
	}

	@RequestMapping(value = "activityModify", method = RequestMethod.POST)
	public String activityModify(MultipartHttpServletRequest mRequest, Activity activity, Model model) {
		String actImgstr = mRequest.getParameter("actImgstr");
		if (actImgstr != null) {
			afService.FileUp(mRequest, model);
		}
		if (check == 0) {
			int res = aService.activityModify(activity);
			if (res == 1) {
				model.addAttribute("activityModify", "액티비티 수정 완료");
			} else if (res == 0) {
				model.addAttribute("errorMsg", "액티비티 수정이 실패하였습니다");
				System.out.println("액티비티 수정 실패");
			}
			check = 1;
		}
		return "forward:hostActivityList.do";
	}

	@RequestMapping(value = "activityDelete", method = RequestMethod.GET)
	public String activityDelete(Activity activity, ActEventDate actEventDate, Model model) {
		int result = aService.getActivityDateCnt(actEventDate);
		if (result == 0) {
			result = aService.activityDelete(activity);
			if (result == 1) {
				model.addAttribute("activityDelete", "액티비티 삭제 완료");
			} else if (result == 0) {
				model.addAttribute("errorMsg", "액티비티 삭제 실패");
			}
		} else {
			model.addAttribute("errorMsg", "액티비티에 등록된 일정이 있습니다");
		}
		return "forward:hostActivityList.do";
	}

	@RequestMapping(value = "activityDateWriteForm", method = RequestMethod.GET)
	public String activityDateWriteForm(Activity activity, Model model) {
		model.addAttribute("activity", aService.getActivity(activity));
		check = 0;
		return "activity/activityDateWrite";
	}

	@RequestMapping(value = "activityDateWrite", method = RequestMethod.POST)
	public String activityDateWrite(ActEventDate actEventDate, String startDay, String endDay, String startTime,
			String endTime, Model model) {
		actEventDate.setActStartdate(Timestamp.valueOf(startDay + " " + startTime));
		actEventDate.setActEnddate(Timestamp.valueOf(endDay + " " + endTime));
		if (check == 0) {
			int result = aService.activityDate(actEventDate);
			if (result == 1) {
				model.addAttribute("activityDate", "일정 추가가 완료되었습니다");
			} else if (result == 0) {
				model.addAttribute("errorMsg", "일정 추가가 실패하였습니다");
			}
			check = 1;
		}
		return "forward:hostActivityList.do";
	}

	@RequestMapping(value = "activityDateModifyForm", method = RequestMethod.GET)
	public String activityDateModifyForm(Activity activity, Model model, String pageNum) {
		model.addAttribute("actDate", aService.getActivityDate(activity.getActId()));
		model.addAttribute("hId", activity.gethId());
		model.addAttribute("pageNum", pageNum);
		return "activity/activityDateModify";
	}

	@RequestMapping(value = "activityDateModifyForm", method = RequestMethod.POST)
	public String activityDateModifyForm_post(Activity activity, Model model, String pageNum) {
		model.addAttribute("actDate", aService.getActivityDate(activity.getActId()));
		model.addAttribute("hId", activity.gethId());
		model.addAttribute("pageNum", pageNum);
		return "activity/activityDateModify";
	}

	@RequestMapping(value = "activityDateModify", method = RequestMethod.GET)
	public String activityDateModify(ActEventDate actEventDate, Model model, String pageNum) {
		actEventDate = aService.getActDate(actEventDate);
		String startDate = actEventDate.getActStartdate().toString();
		String endDate = actEventDate.getActEnddate().toString();
		model.addAttribute("eNo", actEventDate.geteNo());
		model.addAttribute("hId", actEventDate.gethId());
		model.addAttribute("actId", actEventDate.getActId());
		model.addAttribute("startDate", startDate.substring(0, 10));
		model.addAttribute("endDate", endDate.substring(0, 10));
		model.addAttribute("startTime", startDate.substring(11, 19));
		model.addAttribute("endTime", endDate.substring(11, 19));
		model.addAttribute("pageNum", pageNum);
		check = 0;
		return "activity/actDateModify";
	}

	@RequestMapping(value = "actDateModify", method = RequestMethod.POST)
	public String actDateModify(ActEventDate actEventDate, String startDay, String endDay, String startTime,
			String endTime, Model model) {
		actEventDate.setActStartdate(Timestamp.valueOf(startDay + " " + startTime));
		actEventDate.setActEnddate(Timestamp.valueOf(endDay + " " + endTime));
		if (check == 0) {
			int result = aService.activityDateModify(actEventDate);
			if (result == 1) {
				model.addAttribute("activityDate", "일정 수정이 완료되었습니다");
				model.addAttribute("hId", actEventDate.gethId());
			} else if (result == 0) {
				model.addAttribute("errorMsg", "일정 수정이 실패하였습니다");
			}
			check = 1;
		}
		return "forward:activityDateModifyForm.do";
	}

	@RequestMapping(value = "activityDateDelete", method = RequestMethod.GET)
	public String activityDateDelete(ActEventDate actEventDate, Model model) {
		int result = aService.hostActivityReserveCnt(actEventDate);
		if (result == 0) {
			result = aService.activityDateDelete(actEventDate);
			if (result == 1) {
				model.addAttribute("activityDate", "일정 삭제가 완료되었습니다");
			} else if (result == 0) {
				model.addAttribute("errorMsg", "일정 삭제가 실패하였습니다");
			}
		} else {
			model.addAttribute("errorMsg", "예약된 인원이 있습니다");
		}
		return "forward:activityDateModifyForm.do";
	}

	@RequestMapping(value = "hostActivityList", method = RequestMethod.GET)
	public String hostActivityList(Activity activity, Model model, String pageNum) {
		Paging paging = new Paging(aService.hostActivityTotal(activity), pageNum, 6, 10);
		activity.setStartRow(paging.getStartRow());
		activity.setEndRow(paging.getEndRow());
		model.addAttribute("ActivityList", aService.hostActivityList(activity));
//		System.out.println("컨트롤러 : " +  aService.hostActivityList(activity));
		model.addAttribute("hId", activity.gethId());
		model.addAttribute("paging", paging);
		return "host/activityList";
	}

	@RequestMapping(value = "hostActivityList", method = RequestMethod.POST)
	public String hostActivityList_post(Activity activity, Model model, String pageNum) {
		Paging paging = new Paging(aService.hostActivityTotal(activity), pageNum, 6, 10);
		activity.setStartRow(paging.getStartRow());
		activity.setEndRow(paging.getEndRow());
		model.addAttribute("ActivityList", aService.hostActivityList(activity));
		model.addAttribute("hId", activity.gethId());
		model.addAttribute("paging", paging);
		return "host/activityList";
	}

	////////////////////////////////
	// 후기 관련 //
	////////////////////////////////
	@RequestMapping(value = "activityReviewList", method = RequestMethod.GET)
	public String activityReviewList(int actId, Model model, ReviewLike reviewLike) {
		model.addAttribute("review", rService.LikeReview(actId));
		model.addAttribute("reviewCnt", rService.reviewCnt(actId));
		model.addAttribute("actId", actId);
		reviewLike = rService.likeReviewCheck(reviewLike);
		if (rService.reviewLikeCheck(reviewLike) == null) {
			model.addAttribute("reviewLike", reviewLike);
		} else if (rService.reviewLikeCheck(reviewLike) != null) {
			model.addAttribute("reviewLike", rService.reviewLikeCheck(reviewLike));
		}
		return "activity/reviewList";
	}

	@RequestMapping(value = "activityReviewAllList", method = RequestMethod.GET)
	public String activityReviewAllList(Review review, ReviewLike reviewLike, String pageNum, Model model) {
		Paging paging = new Paging(rService.reviewCnt(review.getActId()), pageNum, 10, 10);
		review.setStartRow(paging.getStartRow());
		review.setEndRow(paging.getEndRow());
		model.addAttribute("reviewGrade", rService.reviewGrade(review.getActId()));
		model.addAttribute("reviewList", rService.reviewList(review));
		model.addAttribute("paging", paging);
		model.addAttribute("actId", review.getActId());
		reviewLike.setStartRow(paging.getStartRow());
		reviewLike.setEndRow(paging.getEndRow());
		model.addAttribute("reviewLikeList", rService.reviewListLikeCheck(reviewLike));
		return "activity/reviewAllList";
	}

	@RequestMapping(value = "activityReviewAllList", method = RequestMethod.POST)
	public String activityReviewAllList_post(Review review, ReviewLike reviewLike, String pageNum, Model model) {
		Paging paging = new Paging(rService.reviewCnt(review.getActId()), pageNum, 10, 10);
		review.setStartRow(paging.getStartRow());
		review.setEndRow(paging.getEndRow());
		model.addAttribute("reviewGrade", rService.reviewGrade(review.getActId()));
		model.addAttribute("reviewList", rService.reviewList(review));
		model.addAttribute("paging", paging);
		model.addAttribute("actId", review.getActId());
		reviewLike.setStartRow(paging.getStartRow());
		reviewLike.setEndRow(paging.getEndRow());
		model.addAttribute("reviewLikeList", rService.reviewListLikeCheck(reviewLike));
		return "activity/reviewAllList";
	}

	@RequestMapping(value = "activityReviewLike", method = RequestMethod.GET)
	public String activityReviewLike(Review review, ReviewLike reviewLike) {
		if (reviewLike.getRlNo() == 0) {
			rService.reviewLikeClickWrite(reviewLike);
			rService.reviewLike(review.getrId());
		} else if (reviewLike.getRlNo() != 0) {
			if (reviewLike.getRlCheck() == 0) {
				rService.reviewLike(review.getrId());
				rService.reviewLikeClick(reviewLike);
			} else if (reviewLike.getRlCheck() == 1) {
				rService.reviewUnLike(review.getrId());
				rService.reviewLikeClick(reviewLike);
			}
		}
		return "forward:activityReviewList.do";
	}

	@RequestMapping(value = "activityReviewAllLike", method = RequestMethod.GET)
	public String activityReviewAllLike(Review review, ReviewLike reviewLike, Model model) {
		if (reviewLike.getRlNo() == 0) {
			rService.reviewLikeClickWrite(reviewLike);
			rService.reviewLike(review.getrId());
		} else if (reviewLike.getRlNo() != 0) {
			if (reviewLike.getRlCheck() == 0) {
				rService.reviewLike(review.getrId());
				rService.reviewLikeClick(reviewLike);
			} else if (reviewLike.getRlCheck() == 1) {
				rService.reviewUnLike(review.getrId());
				rService.reviewLikeClick(reviewLike);
			}
		}
		return "forward:activityReviewAllList.do";
	}

	@RequestMapping(value = "activityReviewWriteForm", method = RequestMethod.GET)
	public String activityReviewWrite(int actId, Model model) {
		model.addAttribute("actId", actId);
		check = 0;
		return "activity/reviewWrite";
	}

	@RequestMapping(value = "activityReviewWrite", method = RequestMethod.POST)
	public String activityReviewWrite(MultipartHttpServletRequest mRequest, Activity activity, HttpSession session,
			Model model) {
		Review review = new Review();
		rfService.FileUp(mRequest, model, session);
		String rImg = null;
		if (session.getAttribute("rImg") != null) {
			rImg = session.getAttribute("rImg").toString();
			session.removeAttribute("rImg");
		}
		review.setActId(Integer.parseInt(mRequest.getParameter("actId")));
		review.setrWriter(mRequest.getParameter("rWriter"));
		review.setrTitle(mRequest.getParameter("rTitle"));
		review.setrContent(mRequest.getParameter("rContent"));
		review.setrGrade(Integer.parseInt(mRequest.getParameter("rGrade")));
		review.setrPw(mRequest.getParameter("rPw"));
		review.setrImg(rImg);
		review.setmId(mRequest.getParameter("mId"));
		review.sethId(mRequest.getParameter("hId"));
		if (check == 0) {
			int result = rService.reviewWrite(review);
			if (result == 1) {
				model.addAttribute("reviewWrite", "후기 작성이 완료되었습니다");
				activity.setActId(Integer.parseInt(mRequest.getParameter("actId")));
				aService.activityReviewGrade(activity);
			} else if (result == 0) {
				model.addAttribute("errorMsg", "후기 작성이 실패하였습니다");
			}
			check = 1;
		}
		return "forward:activityReviewAllList.do";
	}

	@RequestMapping(value = "activityReviewModifyForm", method = RequestMethod.GET)
	public String activityReviewModifyForm(Review review, Model model, String pageNum) {
		model.addAttribute("review", rService.getReview(review));
		model.addAttribute("pageNum", pageNum);
		check = 0;
		return "activity/reviewModify";
	}

	@RequestMapping(value = "activityReviewModify", method = RequestMethod.POST)
	public String activityReviewModify(Review review, Model model) {
		if (check == 0) {
			int result = rService.reviewModify(review);
			if (result == 1) {
				model.addAttribute("reviewModify", "후기 수정이 완료되었습니다");
			} else if (result == 0) {
				model.addAttribute("errorMsg", "후기 수정이 실패했습니다");
			}
			check = 1;
		}
		return "forward:activityReviewAllList.do";
	}

	@RequestMapping(value = "activityReviewDeleteForm", method = RequestMethod.GET)
	public String activityReviewDeleteForm(Review review, Model model, String pageNum) {
		model.addAttribute("review", rService.getReview(review));
		model.addAttribute("pageNum", pageNum);
		check = 0;
		return "activity/reviewDelete";
	}

	@RequestMapping(value = "activityReviewDelete", method = RequestMethod.POST)
	public String activityReviewDelete(Review review, Model model) {
		if (check == 0) {
			int result = rService.reviewDelete(review);
			if (result == 1) {
				model.addAttribute("reviewDelete", "후기 삭제가 완료되었습니다");
			} else if (result == 0) {
				model.addAttribute("errorMsg", "후기 삭제가 실패하였습니다");
			}
			check = 1;
		}
		return "forward:activityReviewAllList.do";
	}

	@RequestMapping(value = "activityReviewReplyForm", method = RequestMethod.GET)
	public String activityReviewReplyForm(Review review, Model model) {
		model.addAttribute("review", rService.getReview(review));
		check = 0;
		return "activity/reviewReply";
	}

	@RequestMapping(value = "activityReviewReply", method = RequestMethod.POST)
	public String activityReviewReply(Review review, Model model) {
		if (check == 0) {
			int result = rService.reviewReply(review);
			if (result == 1) {
				if (result == 1) {
					model.addAttribute("reviewReply", "후기 답변 작성이 완료되었습니다");
					if (review.getrStep() > 0) {
						result = rService.reviewStepA(review);
					}
				} else if (result == 0) {
					model.addAttribute("errorMsg", "후기 답변 작성이 실패했습니다");
				}
			} else if (result == 0) {
				model.addAttribute("errorMsg", "stepA 실패");
			}
			check = 1;
		}
		return "forward:activityReviewAllList.do";
	}

	////////////////////////////////
	// 액티비티 예약 관련 //
	////////////////////////////////
	@RequestMapping(value = "myActivityReserveList", method = RequestMethod.GET)
	public String myActivityReserveList(Activity activity, String pageNum, Model model) {
		Paging paging = new Paging(aService.hostActivityTotal(activity), pageNum, 10, 10);
		activity.setStartRow(paging.getStartRow());
		activity.setEndRow(paging.getEndRow());
		model.addAttribute("ActivityList", aService.hostActivityList(activity));
		model.addAttribute("paging", paging);
		return "host/activityReserveList";
	}

	@RequestMapping(value = "activityReserve", method = RequestMethod.GET)
	public String activityReserve(Activity activity, Model model) {
		model.addAttribute("activity", aService.getActivity(activity));
		model.addAttribute("activityDate", aService.hostActivityDateList(activity.getActId()));
		return "host/activityReserve";
	}

	@RequestMapping(value = "reserveList", method = RequestMethod.GET)
	public String reserveList(ActivityReserve activityReserve, Model model) {
		model.addAttribute("reserve", aService.hostActivityReserveList(activityReserve));
		return "host/reserveList";
	}

	@RequestMapping(value = "myActivityCheckList", method = RequestMethod.GET)
	public String myActivityCheckList(ActEventDate actEventDate, Model model, String pageNum) {
		Paging paging = new Paging(aService.hostActivityCheckTotal(actEventDate), pageNum, 5, 10);
		actEventDate.setStartRow(paging.getStartRow());
		actEventDate.setEndRow(paging.getEndRow());
		model.addAttribute("checkList", aService.hostActivityCheckList(actEventDate));
		model.addAttribute("paging", paging);
		return "host/activityCheck";
	}

	@RequestMapping(value = "activityCheck", method = RequestMethod.GET)
	public String activityCheck(ActivityReserve activityReserve, Model model) {
		model.addAttribute("checkList", aService.hostActivityReserveList(activityReserve));
		model.addAttribute("hId", activityReserve.gethId());
		return "host/activityCheckList";
	}

	@RequestMapping(value = "actCheck", method = RequestMethod.GET)
	public String actCheck(ActivityReserve activityReserve, Model model) {
		int result = aService.hostActivityCheck(activityReserve.getArId());
		if (result == 1) {
			model.addAttribute("hId", activityReserve.gethId());
			model.addAttribute("check", "출석체크 처리가 완료되었습니다");
		} else if (result == 0) {
			model.addAttribute("errorMsg", "출석체크 처리가 실패하였습니다");
		}
		return "forward:activityCheck.do";
	}
	// 메인에서 검색 시 액티비티 뿌려주기
		@RequestMapping(value="activityAllList", method=RequestMethod.GET)
		public String activityAllList(Activity activity, String pageNum, Model model) {
			//페이징 
			Paging paging = new Paging(aService.activityCnt(activity), pageNum, 12, 5); // 한 페이지에 4*3 , < 1 2 3 4 5 >
			activity.setStartRow(paging.getStartRow());
			activity.setEndRow(paging.getEndRow());
			model.addAttribute("activityAllList", aService.activityAllList(activity));
			model.addAttribute("activity", activity);
			model.addAttribute("paging", paging);
			return "main/activityAllList";
		}
		// 메인에서 신규 액티비티 전체보기 클릭
		@RequestMapping(value="activityNewList", method=RequestMethod.GET)
		public String activityNewList(Activity activity, String pageNum, Model model) {		
			Paging paging = new Paging(aService.activityCnt(activity), pageNum, 12, 5); // 한 페이지에 4*3 , < 1 2 3 4 5 >
			activity.setStartRow(paging.getStartRow());
			activity.setEndRow(paging.getEndRow());
			model.addAttribute("activityNewList", aService.activityNewList(activity));
			model.addAttribute("paging", paging);
			return "main/activityNewList";
		}
		// 메인에서 베스트 호스트 액티비티 전체보기 클릭
		@RequestMapping(value="activityBestHostList", method=RequestMethod.GET)
		public String activityBestHostList(Activity activity, String pageNum, Model model) {
			Paging paging = new Paging(aService.activityCnt(activity), pageNum, 12, 5); // 한 페이지에 4*3 , < 1 2 3 4 5 >
			activity.setStartRow(paging.getStartRow());
			activity.setEndRow(paging.getEndRow());
			model.addAttribute("activityBestHostList", aService.activityBestHostList(activity));
			model.addAttribute("paging", paging);
			return "main/activityBestHostList";
		}
		
		// 메인에서 관심 추천 액티비티 전체보기 클릭
		@RequestMapping(value="memberCustomizedActListAll", method=RequestMethod.GET)
		public String memberCustomizedActListAll(Activity activity, String pageNum, Model model, HttpSession httpsession) {
			String mId = null;
			Member member = (Member) httpsession.getAttribute("member");
			if(member!=null) mId = member.getmId();
			activity.setmId(mId);
			Paging paging = new Paging(aService.memberCustomizedActListAllCnt(mId), pageNum, 12, 5); // 한 페이지에 4*3 , < 1 2 3 4 5 >
			activity.setStartRow(paging.getStartRow());
			activity.setEndRow(paging.getEndRow());
			model.addAttribute("memberCustomizedActListAll", aService.memberCustomizedActListAll(activity));
			model.addAttribute("paging", paging);
			return "main/memberCustomizedActListAll";
		}
		
		// 메인에서 인기 카테고리 클릭 
		@RequestMapping(value="activityBestCateList", method=RequestMethod.GET)
		public String activityBestCateList(Activity activity, String pageNum, Model model) {
			Paging paging = new Paging(aService.activityBestCateCnt(activity), pageNum, 12, 5); // 한 페이지에 4*3 , < 1 2 3 4 5 >
			activity.setStartRow(paging.getStartRow());
			activity.setEndRow(paging.getEndRow());
			model.addAttribute("activityBestCateList", aService.activityBestCateList(activity));
			model.addAttribute("activity", activity);
			model.addAttribute("paging", paging);
			return "main/activityBestCateList";
		}
		// 액티비티 상세보기
		@RequestMapping(value="activityDetail", method=RequestMethod.GET)
		public String activityDetail(Activity activity, LikeActivity likeActivity, ReviewLike reviewLike, String pageNum, Model model, HttpSession httpsession) {
			int actId = activity.getActId();
			Member member = (Member)httpsession.getAttribute("member"); // 세션에서 멤버 값 가져옴
			String mId = null;
			if(member!=null) mId = member.getmId();
			likeActivity.setmId(mId);
			model.addAttribute("checkResult", aService.memberLikeActivityCheck(likeActivity)); // 처음 초기값을 jsp에서 1이면 채운하트, 0이면 하얀 하트를 보여줘라 						
			model.addAttribute("activityByCateList", aService.activityByCateList(activity));
			model.addAttribute("actEventDate", aService.hostActivityDateList(actId));
			model.addAttribute("activity", aService.activityDetail(activity));
			model.addAttribute("activitySameCate3List", aService.activitySameCate3List(actId));
			// 액티비티 후기 include
			model.addAttribute("review", rService.LikeReview(actId));
			model.addAttribute("reviewCnt", rService.reviewCnt(actId));
			model.addAttribute("actId", actId);
//			reviewLike = rService.likeReviewCheck(reviewLike);
//			if(rService.reviewLikeCheck(reviewLike) == null) {
//				model.addAttribute("reviewLike", reviewLike);
//			} else if(rService.reviewLikeCheck(reviewLike) != null) {
//				model.addAttribute("reviewLike", rService.reviewLikeCheck(reviewLike));
//			}		
			return "activity/activityDetail";
		}
		
		// 멤버가 액티비티 좋아하기(좋아요 버튼을 눌러서 여기에 온 경우)
		@RequestMapping(value="activityLike", method=RequestMethod.GET)
		public String memberLikeActivity(int actId, LikeActivity likeActivity, Model model, HttpSession httpsession) {
			Member member = (Member)httpsession.getAttribute("member"); // 세션에서 멤버 값 가져옴
			String mId = null;
			if(member!=null) mId = member.getmId();
			likeActivity.setmId(mId);
			// 멤버가 이미 좋아한 액티비티인지 체크(체크 값 model에 넣어 넘겨서 jsp에서도 처리 해줄 예정)
			int checkResult = aService.memberLikeActivityCheck(likeActivity);
			if(checkResult!=1) { // 좋아한 적 없는 액티비티면,
				aService.memberLikeActivity(likeActivity); // 좋아하기(LikeActivity 테이블에 생성)
				aService.whenMemberActLike(actId); // activity 테이블에 actLike+1
				model.addAttribute("likeResultMsg", "좋아한 액티비티 리스트에 추가되었습니다.");
			}else { // 이미 좋아한 적 있는 액티비티면,
				aService.memberLikeActivityDelete(likeActivity); // 좋아한 것 취소하기(LikeActivity 테이블에서 delete)
				aService.whenMemberActDislike(actId); // activity 테이블에 actLike-1
				model.addAttribute("likeResultMsg", "좋아한 액티비티 리스트에서 제외되었습니다.");
			}		
			return "forward:activityDetail.do";
		}	

		// 상품 상세보기에서 호스트 상세보기 클릭
		@RequestMapping(value="hostDetail", method=RequestMethod.GET)
		public String hostDetail(String hId, LikeHost likeHost, Model model, HttpSession httpsession) {
			Member member = (Member)httpsession.getAttribute("member"); // 세션에서 멤버 값 가져옴
			String mId = null;
			if(member!=null) mId = member.getmId();
			likeHost.sethId(hId);
			likeHost.setmId(mId);
			model.addAttribute("checkResult", hService.memberLikeHostCheck(likeHost)); // 처음 초기값을 jsp에서 1이면 채운하트, 0이면 하얀 하트를 보여줘라
			model.addAttribute("hostActivityList", aService.hostActivityList2(hId));
			model.addAttribute("hostInfo", hService.getHost(hId));
			return "activity/hostDetail";
		}
		
		// 멤버가 호스트 좋아하기(좋아요 버튼을 눌러서 여기에 온 경우)
		@RequestMapping(value="memberLikeHost", method=RequestMethod.GET)
		public String memberLikeHost(String hId, LikeHost likeHost, Model model, HttpSession httpsession) {
			Member member = (Member)httpsession.getAttribute("member"); // 세션에서 멤버 값 가져옴
			String mId = null;
			if(member!=null) mId = member.getmId();
			likeHost.sethId(hId);
			likeHost.setmId(mId);	
			model.addAttribute("hostInfo", hService.getHost(hId));
			int checkResult = hService.memberLikeHostCheck(likeHost);
			if(checkResult!=1) {
				hService.memberLikeHost(likeHost);
				hService.whenMemberHostLike(hId);
				model.addAttribute("likeResultMsg", "좋아한 호스트 리스트에 추가되었습니다.");
			}else {
				hService.memberLikeHostDelete(likeHost);
				hService.whenMemberHostDislike(hId);
				model.addAttribute("likeResultMsg", "좋아한 호스트 리스트에서 제외되었습니다.");
			}
			return "forward:hostDetail.do";
		}

		// 멤버가 작성한 후기 보기
		@RequestMapping(value="myReviewList", method=RequestMethod.GET)
		public String myReviewList(Review review, String pageNum, Model model) {
			int total = rService.myReviewCnt(review);
			Paging paging = new Paging(total, pageNum, 10, 10);
			review.setStartRow(paging.getStartRow());
			review.setEndRow(paging.getEndRow());
			model.addAttribute("reviewList", rService.myReviewList(review));
			model.addAttribute("paging", paging);
			return "member/reviewList";
		}
		@RequestMapping(value="activityDate", method=RequestMethod.GET)
		public String activityDate(String actDate) {
			/*
			 * HashMap<String, Object> returnMap = new HashMap<String, Object>();
			 * 
			 * 
			 * returnMap.put("idConfirm", result); return returnMap;
			 */
			
			String a = actDate;
			return "activity/"; 
		}
	
	

}
