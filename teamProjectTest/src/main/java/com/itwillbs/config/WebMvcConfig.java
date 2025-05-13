package com.itwillbs.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.CacheControl;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**")
                .addResourceLocations("file:///C:/Users/admin/git/test1/teamProjectTest/src/main/webapp/resources/")
                .setCacheControl(CacheControl.noStore()) // ✅ 브라우저/서버 캐시 모두 차단
                .resourceChain(false); // ✅ 리소스 캐싱 체인 비활성화
    }
}
