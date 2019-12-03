# 基于ssm框架实现的简单社区平台
本项目基于ssm框架实现的社区网站，项目一定层度上参考了百度贴吧，采用[wangEditor富文本](http://www.wangeditor.com/)实现的发帖、评论功能。本项目无后台管理系统。

## 项目环境
    jdk：1.8
    maven：3.6
    数据库环境：MySQL8 + c3p0连接池
    集成开发环境：Idea 2019
    web容器：Tomcat 9

## 起步
  首先，我们需要使用maven搭建ssm框架环境。<br/>
  关于搭建ssm框架环境请参考我的博客：[Spring+SpringMvc+Mybatis框架整合](https://www.cnblogs.com/LeoCoding/p/11571816.html)
  ，以及我的另一个项目[ssm入门案例](https://github.com/Lionel340/ssm)

## 项目结构
    ├── README.md
    ├── pom.xml
    └── src
        └── main
            ├── java
            │   └── com
            │       └── jsj
            │           ├── bean  -- JavaBean实体类
            │           ├── controller  -- SpringMVC-WEB层控制器
            │           ├── converter -- 数据类型转换器
            │           ├── mapper  -- Mybatis接口和映射文件。本项目采用了mybatis的接口开发，所以接口和映射文件放在同一目录下，并且名称相同。
            │           └── service  -- service业务层
            ├── resources
            │       ├── db.properties  -- 数据源配置文件
            │       ├── log4j.properties  -- 日志配置文件
            │       ├── spring.xml  -- spring整合mybatis的配置文件
            │       ├── SpringMvc.xml  -- springmvc的配置文件
            │       └── ssm_community.sql  -- 项目数据库创建和表创建的SQL语句
            └── webapp
                    ├── static 
                    │       ├── bootstrap -- bootstrap依赖文件
                    │       ├── css  -- 样式文件
                    │       ├── js  -- javascript脚本文件
                    │       └── wangEditor  -- wangEditor富文本依赖文件
                    └── WEB-INF
                            ├── web.xml -- web部署文件
                            └── view -- 视图jsp文件
