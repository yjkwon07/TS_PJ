package com.duojj.dto;

import java.util.HashMap;
import java.util.Map;

public class CategoriesDTO {
	private static final String MAIN_DESIGN = "디자인";
	private static final String MAIN_IT = "IT";
	private static final String MAIN_VIDEO = "영상";
	private static final String MAIN_LANGUAGE = "외국어";
	private static final String MAIN_BEAUTY = "뷰티";
	private static final String MAIN_MUSIC = "음악";

	private static final String[] SUB_DESIGN = { "포토샵", "일러스트레이터", "UI/UX" };
	private static final String[] SUB_IT = { "프로그래밍", "웹/모바일", "서버" };
	private static final String[] SUB_VIDEO = { "프리미어", "여행영상", "기획/촬영" };
	private static final String[] SUB_LANGUAGE = { "영어", "중국어", "기타외국어" };
	private static final String[] SUB_BEAUTY = { "메이크업", "헤어", "네일" };
	private static final String[] SUB_MUSIC = { "랩", "보컬", "디제잉" };

	private Map<String, String> getMain_categories() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("design", MAIN_DESIGN);
		map.put("it", MAIN_IT);
		map.put("video", MAIN_VIDEO);
		map.put("forLanguage", MAIN_LANGUAGE);
		map.put("beauty", MAIN_BEAUTY);
		map.put("music", MAIN_MUSIC);
		return map;
	}

	private Map<String, String[]> getSub_categories() {
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("design", SUB_DESIGN);
		map.put("it", SUB_IT);
		map.put("video", SUB_VIDEO);
		map.put("forLanguage", SUB_LANGUAGE);
		map.put("beauty", SUB_BEAUTY);
		map.put("music", SUB_MUSIC);
		return map;
	}

	@SuppressWarnings("rawtypes")
	public Map<String, Map> getCategories() {
		Map<String, Map> categories = new HashMap<String, Map>();
		Map<String, String> mainMap = new HashMap<String, String>();
		Map<String, String[]> subMap = new HashMap<String, String[]>();
		mainMap = getMain_categories();
		subMap = getSub_categories();
		categories.put("mainMap", mainMap);
		categories.put("subMap", subMap);
		return categories;
	}
}
