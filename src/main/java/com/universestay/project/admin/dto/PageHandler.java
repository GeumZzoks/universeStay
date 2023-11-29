package com.universestay.project.admin.dto;

import org.springframework.web.util.UriComponentsBuilder;

public class PageHandler {

//    SearchCondition이 아래 4개를 포함하고 있음
//    private int pageSize = 10;
//    private int page;
//    private String option;
//    private String keyword;
    private SearchCondition sc;
    public final int NAV_SIZE = 10;
    private int totalCnt;
    private int totalPage;
    private int beginPage;
    private int endPage;
    private boolean showNext = false;
    private boolean showPrev = false;

    public PageHandler(int totalCnt, Integer page) {
        this(totalCnt, page, 10);
    }

    public PageHandler(int totalCnt, Integer page, Integer pageSize) {
        this(totalCnt, new SearchCondition(page, pageSize));
    }

    public PageHandler(int totalCnt, SearchCondition sc) {
        this.totalCnt = totalCnt;
        this.sc = sc;

        doPaging(totalCnt, sc);
    }

    private void doPaging(int totalCnt, SearchCondition sc) {
        this.totalPage = totalCnt / sc.getPageSize() + (totalCnt % sc.getPageSize() == 0 ? 0 : 1);
        this.sc.setPage(Math.min(sc.getPage(), totalPage)); // page가 totalPage보다 크지 않게 방지
        this.beginPage = (this.sc.getPage() - 1) / NAV_SIZE * NAV_SIZE + 1;
        this.endPage = Math.min(beginPage + NAV_SIZE - 1, totalPage);
        this.showPrev = beginPage != 1;
        this.showNext = endPage != totalPage;
    }

    public String getQueryString() {
        return getQueryString(this.sc.getPage());
    }

    public String getQueryString(Integer page) {
        // ?page=10&pageSize=10&option=A&keyword=title
        return UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("pageSize", sc.getPageSize())
                .queryParam("option", sc.getOption())
                .queryParam("keyword", sc.getKeyword())
                .build().toString();
    }

    void print() {
        System.out.println("page=" + sc.getPage());
        System.out.println(showPrev ? "PREV" : "");

        for (int i = beginPage; i < endPage; i++) {
            System.out.println(i + " ");
        }
        System.out.println(showNext ? " NEXT" : "");
    }

    public SearchCondition getSc() {
        return sc;
    }

    public void setSc(SearchCondition sc) {
        this.sc = sc;
    }

    public int getNAV_SIZE() {
        return NAV_SIZE;
    }

    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getBeginPage() {
        return beginPage;
    }

    public void setBeginPage(int beginPage) {
        this.beginPage = beginPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isShowNext() {
        return showNext;
    }

    public void setShowNext(boolean showNext) {
        this.showNext = showNext;
    }

    public boolean isShowPrev() {
        return showPrev;
    }

    public void setShowPrev(boolean showPrev) {
        this.showPrev = showPrev;
    }

    @Override
    public String toString() {
        return "PageHandler{" +
                "sc=" + sc +
                ", NAV_SIZE=" + NAV_SIZE +
                ", totalCnt=" + totalCnt +
                ", totalPage=" + totalPage +
                ", beginPage=" + beginPage +
                ", endPage=" + endPage +
                ", showNext=" + showNext +
                ", showPrev=" + showPrev +
                '}';
    }
}
