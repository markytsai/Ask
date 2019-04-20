# Ask
     
> ***AnswerPedia***是一款专注于提供学科类知识问答社区网站。主要包括六大学科主题：社会科学、
自然科学、理科、人文学科、形式科学和技术与应用科学。使用推荐技术给用户提供个性化的问题
推荐，来减少僵尸问题的数量，提高问题的回答率。
>

系统具有垂直类问答社区的角色，在功能方面覆盖了绝大部分问答网站应有的功能。系统主要实现了如下的功能：

（1）注册、登录、查看个人信息，修改个人信息，退出登录。

（2）查看关注问题，查看推荐问题，查看热门问题。

（3）关注、提出、回答问题，点赞、评论、收藏回答。

（4）根据话题，问题，回答，用户四种类型进行全局搜索。

（5）修改个人偏好。

（6）接收消息，按照系统和用户两种类型查看消息。

（7）游客登录

#### 使用技术介绍
后端使用的技术如下：   
- Spring
- Spring MVC
- MyBatis
- MySQL
- Redis
     
前端使用的技术如下：     
- Bootstrap
- Thymeleaf模板引擎
- jquery
- summernote.js富文本编辑器
- popper.min.js提示插件

#### 推荐方法使用说明
系统采用了四种经典的推荐算法，它们分别是UserCF,ItemCF,基于Context的推荐和基于标签的推荐。
          
#### 平台部署和配置说明
1. 下载项目源码，安装JDK、Tomca、MySQL、Redis。
2. 创建mysql用户和数据库，运行/ask下对应ask.sql。
3. 设置数据库配置文件application.yml。
4. 部署有三种方式：（1）直接在IDEA中运行即可访问；（2）在项目的根目录中执行
`mvn -Dmaven.test.skip=true package`命令，之后在target文件夹中找到
warName.war，之后将该war包放在tomcat的/webapps目录中，启动tomcat，即可访问。


#### 项目源码地址     
GitHub地址：<https://github.com/markytsai/Ask>
     
#### 效果演示截图

登录
![登录](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/_login.png)

注册
![注册](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/_register.png)

关注页面
![关注页面](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/_following.png)

推荐页面
![推荐页面](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/_recommend.png)

问题详情页面
![问题详情页面](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/_questionDetal.png)

用户主页面
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/user/_userhome_activity.png)
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/user/_userhome_answer.png)
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/user/_userhome_collect.png)
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/user/_userhome_follouser.png)
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/user/_userhome_followquestion.png)
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/user/_userhome_followtopic.png)
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/user/_userhome_question.png)

搜索页面
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/search/_search_question.png)
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/search/_search_topic.png)
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/search/_search_user.png)
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/search/_search_answer.png)

话题页面
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/topic/_topic_intro.png)
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/topic/_topic_question.png)
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/topic/_topic_answer.png)
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/topic/__topic_user.png)

热门问题页面
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/popular/_popular_day.png)
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/popular/_popular_week.png)
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/popular/_popular_month.png)

消息页面
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/notification/_notification_sys.png)
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/notification/_notification_user.png)

设置页面
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/setting/_setting_profile.png)
![活动详情](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/setting/_setting_preferece.png)

![写回答页面](http://github.com/markytsai/Readme_pictures/raw/master/readme-pic/_writeAnswer.png)
     
     
     
     
     
