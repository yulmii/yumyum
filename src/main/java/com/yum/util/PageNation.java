package com.yum.util;

public class PageNation {
	
	public PageNation() {
		
	}
	
	/**
	 * 페이징 네비게이터를 만들어주는 함수
	 * @param totalCount	- 총수
	 * @param listCount		- 노출될 목록 게시물 수
	 * @param pagePerBlock	- 노출될 블록 수
	 * @param pageNum		- 페이지 번호
	 * @return
	 */
	public String getPageNavigator(int totalCount, int listCount, int pagePerBlock, int pageNum) {
		StringBuffer sb = new StringBuffer();
		if(totalCount > 0) {
			int totalNumOfPage = (totalCount % listCount == 0) ? 
					totalCount / listCount :
					totalCount / listCount + 1;
			
			int currentBlock = (pageNum % pagePerBlock == 0) ? 
						pageNum / pagePerBlock :
						pageNum / pagePerBlock + 1;
			
			int startPage = (currentBlock - 1) * pagePerBlock + 1;
			int endPage = startPage + pagePerBlock - 1;
			
			if(endPage > totalNumOfPage){
				endPage = totalNumOfPage;
			}
			
			//이전버튼
			if(pageNum > 1){
				if(startPage == 1) {
					//현재 페이지가 1 ~ 10일 때 이전 버튼
					sb.append("<button class='nextPrevBut butActive' onclick=\"paging(").append(1 + ")\">◀ 이전</button>");
				} else {
					//현재 페이지가 1 ~ 10이외 이전 버튼
					sb.append("<button class='nextPrevBut butActive' onclick=\"paging(").append(startPage - 10 + ")\">◀ 이전</button>");
				}
			} else {
				sb.append("<button class='nextPrevBut' onclick=\"#").append("\" disabled>◀ 이전</button>");
			}
			

			for (int i = startPage; i <= endPage; i++) {
				if (i == pageNum) {
					//현재 페이지
					sb.append("<button class='pagingBut pageActive' onclick=\"#\" disabled><strong>").append(i).append("</strong></button>");
				} else {
					//다른 페이지
					sb.append("<button class='pagingBut otherPage' onclick=\"paging(").append(i + ")\">").append(i+"</button>");
				}
			}
			
			if(pageNum != totalNumOfPage){
				if(endPage == totalNumOfPage) {
					//페이지 블록에 마지막 페이지가 전체 마지막 페이지랑 같을 때
					sb.append("<button class='nextPrevBut butActive' onclick=\"paging(").append(endPage + ")\">다음 ▶</button>");
				} else {
					//페이지 블록에 마지막 페이지가 전체 마지막 페이지랑 다를 때
					sb.append("<button class='nextPrevBut butActive' onclick=\"paging(").append(endPage + 1 + ")\">다음 ▶</button>");
				}
			} else {
				//현재 페이지가 전체 마지막 페이지랑 같을 때
				sb.append("<button class='nextPrevBut' onclick=\"#").append("\" disabled >다음 ▶</button>");
			}
			
		}
		return sb.toString();
	}
}
