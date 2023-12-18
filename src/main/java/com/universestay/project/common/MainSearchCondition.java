package com.universestay.project.common;

import lombok.ToString;
import org.springframework.web.util.UriComponentsBuilder;

@ToString
public class MainSearchCondition extends SearchCondition {

    private String category;
    private String view;
    private String address = "";
    private String search_start_date = "";
    private String search_end_date = "";
    private String search_capa = "";
    private String search_min_price = "";
    private String search_max_price = "";

    private String user_id = "";

    public MainSearchCondition(Integer page, Integer pageSize) {
        super(page, pageSize); // 부모 클래스의 생성자 호출
    }

    public MainSearchCondition(Integer page, Integer pageSize, String category, String view,
            String address, String search_start_date, String search_end_date,
            String search_capa, String search_min_price, String search_max_price, String user_id) {
        super(page, pageSize); // 부모 클래스의 생성자 호출
        this.category = category;
        this.view = view;
        this.address = address;
        this.search_start_date = search_start_date;
        this.search_end_date = search_end_date;
        this.search_capa = search_capa;
        this.search_min_price = search_min_price;
        this.search_max_price = search_max_price;
        this.user_id = user_id;
    }

    // 추가적인 파라미터를 포함하기 위해 getQueryString 메서드 오버라이드
    @Override
    public String getQueryString() {
        return super.getQueryString(getPage()); // 현재 페이지를 인자로 전달하여 부모 메서드 호출
    }

    @Override
    public String getQueryString(Integer page) {
        return UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("pageSize", getPageSize())
                .queryParam("address", address)
                .queryParam("search_start_date", search_start_date)
                .queryParam("search_end_date", search_end_date)
                .queryParam("search_capa", search_capa)
                .queryParam("search_min_price", search_min_price)
                .queryParam("search_max_price", search_max_price)
                .queryParam("user_id", user_id)
                .build().toString();
    }


    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getView() {
        return view;
    }

    public void setView(String view) {
        this.view = view;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSearch_start_date() {
        return search_start_date;
    }

    public void setSearch_start_date(String search_start_date) {
        this.search_start_date = search_start_date;
    }

    public String getSearch_end_date() {
        return search_end_date;
    }

    public void setSearch_end_date(String search_end_date) {
        this.search_end_date = search_end_date;
    }

    public String getSearch_capa() {
        return search_capa;
    }

    public void setSearch_capa(String search_capa) {
        this.search_capa = search_capa;
    }

    public String getSearch_min_price() {
        return search_min_price;
    }

    public void setSearch_min_price(String search_min_price) {
        this.search_min_price = search_min_price;
    }

    public String getSearch_max_price() {
        return search_max_price;
    }

    public void setSearch_max_price(String search_max_price) {
        this.search_max_price = search_max_price;
    }

    public Integer getOffset() {
        return (super.getPage() - 1) * super.getPageSize();
    }

    public String getUser_id() {
        return user_id;
    }
}
