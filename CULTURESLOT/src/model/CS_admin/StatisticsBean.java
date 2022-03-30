package model.CS_admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bean.CS_admin.StatisticsDAO;
import bean.CS_admin.StatisticsDTO;
import bean.CS_member.MemberDTO;

@Controller
@RequestMapping("/admin/stat/")
public class StatisticsBean {
	
	@Autowired
	private StatisticsDAO stat = null;

	@RequestMapping("memberStat.do")
	public String memberStat(StatisticsDTO statDto, Model model) {

		List memAgeGroup = stat.countAgeGroup();
		for(int i = 0 ; i < memAgeGroup.size() ; i++) {
			statDto = (StatisticsDTO)memAgeGroup.get(i);
			model.addAttribute("age10", statDto.getAge10());
			model.addAttribute("age20", statDto.getAge20());
			model.addAttribute("age30", statDto.getAge30());
			model.addAttribute("age40", statDto.getAge40());
			model.addAttribute("age50", statDto.getAge50());
			model.addAttribute("age60", statDto.getAge60());
			model.addAttribute("ageNone", statDto.getAgeNone());
		}
		model.addAttribute("maleCount", stat.countMaleGroup());
		model.addAttribute("femaleCount", stat.countFemaleGroup());
		
		return "/CS_admin/CS_memberStatistics";
	}
	// 0701 add - eunsol
	@RequestMapping("scrapeStat.do")
	public String scrapeStat(StatisticsDTO statDto, Model model) {
		
		int allcount = stat.allScrapeCount();
		int contentCount = stat.allScrapeContentCount();
		
		// 전체 스크랩 횟수: allcount
				// 스크랩된 전체 포스트 갯수 : contentCount
		
		model.addAttribute("allcount",allcount);
		model.addAttribute("contentCount",contentCount);
		
		//==전체회원 카테고리와 콘텐츠 스크랩 Top5==
		
		List allScrapeList = stat.selectAllScrapeTitleTop5();
		
		for (int i = 0 ; i < allScrapeList.size() ; i++) {
			statDto = (StatisticsDTO)allScrapeList.get(i);
			
			double title_count = (double)statDto.getTitle_count();
			double percent = title_count/allcount*100;
			percent = Math.round(percent*100)/100.0; //소수점 둘째자리까지 표현

			statDto.setPercent(percent);
		}
		
		model.addAttribute("allScrapeList",allScrapeList);
		
		//===회원 연령대/성별 별 스크랩 List===
		
		List<StatisticsDTO> maleAge10 = new ArrayList();
		List<StatisticsDTO> maleAge20 = new ArrayList();
		List<StatisticsDTO> maleAge30 = new ArrayList();
		List<StatisticsDTO> maleAge40 = new ArrayList();
		List<StatisticsDTO> maleAge50 = new ArrayList();
		List<StatisticsDTO> maleAge60 = new ArrayList();
		List<StatisticsDTO> maleAgeNone = new ArrayList();
		
		List<StatisticsDTO> femaleAge10 = new ArrayList();
		List<StatisticsDTO> femaleAge20 = new ArrayList();
		List<StatisticsDTO> femaleAge30 = new ArrayList();
		List<StatisticsDTO> femaleAge40 = new ArrayList();
		List<StatisticsDTO> femaleAge50 = new ArrayList();
		List<StatisticsDTO> femaleAge60 = new ArrayList();
		List<StatisticsDTO> femaleAgeNone = new ArrayList();
		
		List memScrapeList = stat.selectAgeGroupAndGenderScrape();
		
		for(int i = 0 ; i < memScrapeList.size(); i++) {
			statDto = (StatisticsDTO)memScrapeList.get(i);
			if(statDto.getGender().equals("남성")) {
				if (statDto.getAgeGroup() == 10) {
					maleAge10.add(statDto);
				}else if (statDto.getAgeGroup() == 20) {
					maleAge20.add(statDto);
				}else if (statDto.getAgeGroup() == 30) {
					maleAge30.add(statDto);
				}else if (statDto.getAgeGroup() == 40) {					
					maleAge40.add(statDto);
				}else if (statDto.getAgeGroup() == 50) {					
					maleAge50.add(statDto);
				}else if (statDto.getAgeGroup() == 60) {		
					maleAge60.add(statDto);
				}else if (statDto.getAgeGroup() == 0) {
					maleAgeNone.add(statDto);
				}	
			}else if (statDto.getGender().equals("여성")) {
				if (statDto.getAgeGroup() == 10) {
					femaleAge10.add(statDto);
				}else if (statDto.getAgeGroup() == 20) {
					femaleAge20.add(statDto);
				}else if (statDto.getAgeGroup() == 30) {
					femaleAge30.add(statDto);
				}else if (statDto.getAgeGroup() == 40) {					
					femaleAge40.add(statDto);	
				}else if (statDto.getAgeGroup() == 50) {					
					femaleAge50.add(statDto);
				}else if (statDto.getAgeGroup() == 60) {		
					femaleAge60.add(statDto);
				}else if (statDto.getAgeGroup() == 0) {
					femaleAgeNone.add(statDto);
				}
			}
		}
		model.addAttribute("maleAge10", maleAge10);
		model.addAttribute("maleAge20", maleAge20);
		model.addAttribute("maleAge30", maleAge30);
		model.addAttribute("maleAge40", maleAge40);
		model.addAttribute("maleAge50", maleAge50);
		model.addAttribute("maleAge60", maleAge60);
		model.addAttribute("maleAgeNone", maleAgeNone);
		
		model.addAttribute("femaleAge10", femaleAge10);
		model.addAttribute("femaleAge20", femaleAge20);
		model.addAttribute("femaleAge30", femaleAge30);
		model.addAttribute("femaleAge40", femaleAge40);
		model.addAttribute("femaleAge50", femaleAge50);
		model.addAttribute("femaleAge60", femaleAge60);
		model.addAttribute("femaleAgeNone", femaleAgeNone);
		
		return "/CS_admin/CS_scrapeStatistics";
	}
}
		