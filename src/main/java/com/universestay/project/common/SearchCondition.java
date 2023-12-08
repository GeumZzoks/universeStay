package com.universestay.project.common;

import org.springframework.web.util.UriComponentsBuilder;

public class SearchCondition {
    private Integer page = 1;
    private Integer pageSize = DEFAULT_PAGE_SIZE;
    private String option = "";
    private String type = "";
    private String keyword = "";

    public static final int MIN_PAGE_SIZE = 5;
    public static final int DEFAULT_PAGE_SIZE = 10;
    public static final int MAX_PAGE_SIZE = 20;

    public SearchCondition() {
    }

    public SearchCondition(Integer page, Integer pageSize) {
        this(page, pageSize, "", "", "");
    }

    public SearchCondition(Integer page, Integer pageSize, String option, String keyword) {
        this(page, pageSize, "", option, keyword);
    }

    public SearchCondition(Integer page, Integer pageSize, String type, String option, String keyword) {
        this.page = page;
        this.pageSize = pageSize;
        this.type = type;
        this.option = option;
        this.keyword = keyword;
    }

    public String getQueryString() {
        return getQueryString(page);
    }

    public String getQueryString(Integer page) {
        return UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("pageSize", pageSize)
                .queryParam("type", type)
                .queryParam("option", option)
                .queryParam("keyword", keyword)
                .build().toString();
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Integer getOffset() {
        return (page - 1) * pageSize;
    }

    @Override
    public String toString() {
        return "SearchCondition{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                ", type='" + type + '\'' + ", option='" + option + '\'' +
                ", keyword='" + keyword + '\'' +
                '}';
    }
}
