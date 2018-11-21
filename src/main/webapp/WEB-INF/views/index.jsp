<%--
  Created by IntelliJ IDEA.
  User: Caizhenya
  Date: 2018/11/20
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Static Top Navbar Example for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="navbar-static-top.css" rel="stylesheet">

</head>

<body>

<!-- Static navbar -->
<nav class="navbar navbar-default navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">沙问</a>
        </div>

        <form class="navbar-form navbar-right" role="search">
            <div class="form-group">
                <label for="keyword" class="sr-only">关键字</label>
                <input type="text" id="keyword" class="form-control" placeholder="输入关键字">
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
        </form>

        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="#focus">关注</a></li>
                <li><a href="#recommend">推荐</a></li>
                <li><a href="#activity">活动</a></li>

            </ul>
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">我的<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/index">主页</a></li>
                        <li><a href="/setting">设置</a></li>
                        <li><a href="/logout">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container blog-content-container">

    <div class="row">

        <!-- Blog Entries Column -->
        <div class="col-md-8">

            <!-- Blog Post -->
            <div id="mainContainer">
                <div id="mainContainerRepleace">
                    <div class="card mb-4" th:each="question : ${questionList}">
                        <div class="card-block">
                            <h2 class="card-title">
                                <%--本来是放置头像--%>
								<span>
                                    <%--<a href="/question/${question.questionId}" title="${question.questionTitle}"></a>--%>
								</span>
                                <%--具体问题和链接--%>
                                <a href="/question/${question.questionId}" class="card-link" title="${question.questionTitle}"
                                OAuth 2.0 认证的原理与实践
                                </a>
                            </h2>
                            <p class="card-text" th:text="${blog.summary}">我收藏夹有一家店，叫士多啤梨R酱小铺。卖欧美“原单”女装的，真假且不论，
                                价格总是比别人家高很多（起码一两百）。微淘里大家评论价格高，而且店主知道别家价格比她低
                                ，找贸易去限价。今早我一看微淘，她家40条评论只剩2条了，不利的全删了。我看这卖家不爽，所以我要把她发到知乎来。还有同类店吗？曝光吧</p>
                            <%--尾部信息--%>
                            <div class="card-text">
                                <a href="/u/waylau" th:href="'/u/' + ${blog.username}"
                                   class="card-link" th:text=${blog.username}>waylau</a> 发表于2019年
                                <%--<i class="fa fa-eye" aria-hidden="true">[[${blog.readSize}]]</i>--%>
                                <%--<i class="fa fa-heart-o" aria-hidden="true">[[${blog.voteSize}]]</i>--%>
                                <%--<i class="fa fa-comment-o" aria-hidden="true">[[${blog.commentSize}]]</i>--%>
                            </div>
                        </div>

                        <div class="card-block">
                            <h2 class="card-title">
								<span>
                                    <%--用户头像以及跳转--%>
                                    <%--<a href="/user/#" title="#">--%>
                                        <%--<img src="images/avatar-defualt.jpg">--%>
                                    <%--</a>--%>

                                    <%--<a href="/u/waylau" title="waylau"--%>
                                       <%--th:href="'/u/' + ${blog.username}" th:title="${blog.username}">--%>
										<%--<img src="/images/avatar-defualt.jpg"--%>
                                             <%--th:src="${blog.avatar} == null ? '/images/avatar-defualt.jpg' : ${blog.avatar}"--%>
                                             <%--class="blog-avatar-50">--%>
								    <%--</a>--%>
								</span>
                                <%--具体问题和链接--%>
                                <%--<a href="/u/waylau/blogs/1" class="card-link" title="waylau"--%>
                                <%--th:href="'/u/' + ${blog.username} + '/blogs/'+ ${blog.blogId}"--%>
                                <%--th:title="${blog.title}" th:text="${blog.title}"> OAuth--%>
                                <%--2.0 认证的原理与实践--%>
                                <%--</a>--%>
                            </h2>
                            <p class="card-text" th:text="${blog.summary}">我收藏夹有一家店，叫士多啤梨R酱小铺。卖欧美“原单”女装的，真假且不论，
                                价格总是比别人家高很多（起码一两百）。微淘里大家评论价格高，而且店主知道别家价格比她低
                                ，找贸易去限价。今早我一看微淘，她家40条评论只剩2条了，不利的全删了。我看这卖家不爽，所以我要把她发到知乎来。还有同类店吗？曝光吧</p>
                            <%--尾部信息--%>
                            <div class="card-text">
                                <a href="/u/waylau" th:href="'/u/' + ${blog.username}"
                                   class="card-link" th:text=${blog.username}>waylau</a> 发表于2019年
                                <%--<i class="fa fa-eye" aria-hidden="true">[[${blog.readSize}]]</i>--%>
                                <%--<i class="fa fa-heart-o" aria-hidden="true">[[${blog.voteSize}]]</i>--%>
                                <%--<i class="fa fa-comment-o" aria-hidden="true">[[${blog.commentSize}]]</i>--%>
                            </div>
                        </div>

                        <div class="card-block">
                            <h2 class="card-title">
								<span>
                                    <%--用户头像以及跳转--%>
                                    <%--<a href="/user/#" title="#">--%>
                                        <%--<img src="images/avatar-defualt.jpg">--%>
                                    <%--</a>--%>

                                    <%--<a href="/u/waylau" title="waylau"--%>
                                       <%--th:href="'/u/' + ${blog.username}" th:title="${blog.username}">--%>
										<%--<img src="/images/avatar-defualt.jpg"--%>
                                             <%--th:src="${blog.avatar} == null ? '/images/avatar-defualt.jpg' : ${blog.avatar}"--%>
                                             <%--class="blog-avatar-50">--%>
								    <%--</a>--%>
								</span>
                                <%--具体问题和链接--%>
                                <%--<a href="/u/waylau/blogs/1" class="card-link" title="waylau"--%>
                                <%--th:href="'/u/' + ${blog.username} + '/blogs/'+ ${blog.blogId}"--%>
                                <%--th:title="${blog.title}" th:text="${blog.title}"> OAuth--%>
                                <%--2.0 认证的原理与实践--%>
                                <%--</a>--%>
                            </h2>
                            <p class="card-text" th:text="${blog.summary}">我收藏夹有一家店，叫士多啤梨R酱小铺。卖欧美“原单”女装的，真假且不论，
                                价格总是比别人家高很多（起码一两百）。微淘里大家评论价格高，而且店主知道别家价格比她低
                                ，找贸易去限价。今早我一看微淘，她家40条评论只剩2条了，不利的全删了。我看这卖家不爽，所以我要把她发到知乎来。还有同类店吗？曝光吧</p>
                            <%--尾部信息--%>
                            <div class="card-text">
                                <a href="/u/waylau" th:href="'/u/' + ${blog.username}"
                                   class="card-link" th:text=${blog.username}>waylau</a> 发表于2019年
                                <%--<i class="fa fa-eye" aria-hidden="true">[[${blog.readSize}]]</i>--%>
                                <%--<i class="fa fa-heart-o" aria-hidden="true">[[${blog.voteSize}]]</i>--%>
                                <%--<i class="fa fa-comment-o" aria-hidden="true">[[${blog.commentSize}]]</i>--%>
                            </div>
                        </div>

                        <div class="card-block">
                            <h2 class="card-title">
								<span>
                                    <%--用户头像以及跳转--%>
                                    <%--<a href="/user/#" title="#">--%>
                                        <%--<img src="images/avatar-defualt.jpg">--%>
                                    <%--</a>--%>

                                    <%--<a href="/u/waylau" title="waylau"--%>
                                       <%--th:href="'/u/' + ${blog.username}" th:title="${blog.username}">--%>
										<%--<img src="/images/avatar-defualt.jpg"--%>
                                             <%--th:src="${blog.avatar} == null ? '/images/avatar-defualt.jpg' : ${blog.avatar}"--%>
                                             <%--class="blog-avatar-50">--%>
								    <%--</a>--%>
								</span>
                                <%--具体问题和链接--%>
                                <%--<a href="/u/waylau/blogs/1" class="card-link" title="waylau"--%>
                                <%--th:href="'/u/' + ${blog.username} + '/blogs/'+ ${blog.blogId}"--%>
                                <%--th:title="${blog.title}" th:text="${blog.title}"> OAuth--%>
                                <%--2.0 认证的原理与实践--%>
                                <%--</a>--%>
                            </h2>
                            <p class="card-text" th:text="${blog.summary}">我收藏夹有一家店，叫士多啤梨R酱小铺。卖欧美“原单”女装的，真假且不论，
                                价格总是比别人家高很多（起码一两百）。微淘里大家评论价格高，而且店主知道别家价格比她低
                                ，找贸易去限价。今早我一看微淘，她家40条评论只剩2条了，不利的全删了。我看这卖家不爽，所以我要把她发到知乎来。还有同类店吗？曝光吧</p>
                            <%--尾部信息--%>
                            <div class="card-text">
                                <a href="/u/waylau" th:href="'/u/' + ${blog.username}"
                                   class="card-link" th:text=${blog.username}>waylau</a> 发表于2019年
                                <%--<i class="fa fa-eye" aria-hidden="true">[[${blog.readSize}]]</i>--%>
                                <%--<i class="fa fa-heart-o" aria-hidden="true">[[${blog.voteSize}]]</i>--%>
                                <%--<i class="fa fa-comment-o" aria-hidden="true">[[${blog.commentSize}]]</i>--%>
                            </div>
                        </div>
                        <div class="card-block">
                            <h2 class="card-title">
								<span>
                                    <%--用户头像以及跳转--%>
                                    <%--<a href="/user/#" title="#">--%>
                                        <%--<img src="images/avatar-defualt.jpg">--%>
                                    <%--</a>--%>

                                    <%--<a href="/u/waylau" title="waylau"--%>
                                       <%--th:href="'/u/' + ${blog.username}" th:title="${blog.username}">--%>
										<%--<img src="/images/avatar-defualt.jpg"--%>
                                             <%--th:src="${blog.avatar} == null ? '/images/avatar-defualt.jpg' : ${blog.avatar}"--%>
                                             <%--class="blog-avatar-50">--%>
								    <%--</a>--%>
								</span>
                                <%--具体问题和链接--%>
                                <%--<a href="/u/waylau/blogs/1" class="card-link" title="waylau"--%>
                                <%--th:href="'/u/' + ${blog.username} + '/blogs/'+ ${blog.blogId}"--%>
                                <%--th:title="${blog.title}" th:text="${blog.title}"> OAuth--%>
                                <%--2.0 认证的原理与实践--%>
                                <%--</a>--%>
                            </h2>
                            <p class="card-text" th:text="${blog.summary}">我收藏夹有一家店，叫士多啤梨R酱小铺。卖欧美“原单”女装的，真假且不论，
                                价格总是比别人家高很多（起码一两百）。微淘里大家评论价格高，而且店主知道别家价格比她低
                                ，找贸易去限价。今早我一看微淘，她家40条评论只剩2条了，不利的全删了。我看这卖家不爽，所以我要把她发到知乎来。还有同类店吗？曝光吧</p>
                            <%--尾部信息--%>
                            <div class="card-text">
                                <a href="/u/waylau" th:href="'/u/' + ${blog.username}"
                                   class="card-link" th:text=${blog.username}>waylau</a> 发表于2019年
                                <%--<i class="fa fa-eye" aria-hidden="true">[[${blog.readSize}]]</i>--%>
                                <%--<i class="fa fa-heart-o" aria-hidden="true">[[${blog.voteSize}]]</i>--%>
                                <%--<i class="fa fa-comment-o" aria-hidden="true">[[${blog.commentSize}]]</i>--%>
                            </div>
                        </div>
                        <div class="card-block">
                            <h2 class="card-title">
								<span>
                                    <%--用户头像以及跳转--%>
                                    <%--<a href="/user/#" title="#">--%>
                                        <%--<img src="images/avatar-defualt.jpg">--%>
                                    <%--</a>--%>

                                    <%--<a href="/u/waylau" title="waylau"--%>
                                       <%--th:href="'/u/' + ${blog.username}" th:title="${blog.username}">--%>
										<%--<img src="/images/avatar-defualt.jpg"--%>
                                             <%--th:src="${blog.avatar} == null ? '/images/avatar-defualt.jpg' : ${blog.avatar}"--%>
                                             <%--class="blog-avatar-50">--%>
								    <%--</a>--%>
								</span>
                                <%--具体问题和链接--%>
                                <%--<a href="/u/waylau/blogs/1" class="card-link" title="waylau"--%>
                                <%--th:href="'/u/' + ${blog.username} + '/blogs/'+ ${blog.blogId}"--%>
                                <%--th:title="${blog.title}" th:text="${blog.title}"> OAuth--%>
                                <%--2.0 认证的原理与实践--%>
                                <%--</a>--%>
                            </h2>
                            <p class="card-text" th:text="${blog.summary}">我收藏夹有一家店，叫士多啤梨R酱小铺。卖欧美“原单”女装的，真假且不论，
                                价格总是比别人家高很多（起码一两百）。微淘里大家评论价格高，而且店主知道别家价格比她低
                                ，找贸易去限价。今早我一看微淘，她家40条评论只剩2条了，不利的全删了。我看这卖家不爽，所以我要把她发到知乎来。还有同类店吗？曝光吧</p>
                            <%--尾部信息--%>
                            <div class="card-text">
                                <a href="/u/waylau" th:href="'/u/' + ${blog.username}"
                                   class="card-link" th:text=${blog.username}>waylau</a> 发表于2019年
                                <%--<i class="fa fa-eye" aria-hidden="true">[[${blog.readSize}]]</i>--%>
                                <%--<i class="fa fa-heart-o" aria-hidden="true">[[${blog.voteSize}]]</i>--%>
                                <%--<i class="fa fa-comment-o" aria-hidden="true">[[${blog.commentSize}]]</i>--%>
                            </div>
                        </div>
                        <div class="card-block">
                            <h2 class="card-title">
								<span>
                                    <%--用户头像以及跳转--%>
                                    <%--<a href="/user/#" title="#">--%>
                                        <%--<img src="images/avatar-defualt.jpg">--%>
                                    <%--</a>--%>

                                    <%--<a href="/u/waylau" title="waylau"--%>
                                       <%--th:href="'/u/' + ${blog.username}" th:title="${blog.username}">--%>
										<%--<img src="/images/avatar-defualt.jpg"--%>
                                             <%--th:src="${blog.avatar} == null ? '/images/avatar-defualt.jpg' : ${blog.avatar}"--%>
                                             <%--class="blog-avatar-50">--%>
								    <%--</a>--%>
								</span>
                                <%--具体问题和链接--%>
                                <%--<a href="/u/waylau/blogs/1" class="card-link" title="waylau"--%>
                                <%--th:href="'/u/' + ${blog.username} + '/blogs/'+ ${blog.blogId}"--%>
                                <%--th:title="${blog.title}" th:text="${blog.title}"> OAuth--%>
                                <%--2.0 认证的原理与实践--%>
                                <%--</a>--%>
                            </h2>
                            <p class="card-text" th:text="${blog.summary}">我收藏夹有一家店，叫士多啤梨R酱小铺。卖欧美“原单”女装的，真假且不论，
                                价格总是比别人家高很多（起码一两百）。微淘里大家评论价格高，而且店主知道别家价格比她低
                                ，找贸易去限价。今早我一看微淘，她家40条评论只剩2条了，不利的全删了。我看这卖家不爽，所以我要把她发到知乎来。还有同类店吗？曝光吧</p>
                            <%--尾部信息--%>
                            <div class="card-text">
                                <a href="/u/waylau" th:href="'/u/' + ${blog.username}"
                                   class="card-link" th:text=${blog.username}>waylau</a> 发表于2019年
                                <%--<i class="fa fa-eye" aria-hidden="true">[[${blog.readSize}]]</i>--%>
                                <%--<i class="fa fa-heart-o" aria-hidden="true">[[${blog.voteSize}]]</i>--%>
                                <%--<i class="fa fa-comment-o" aria-hidden="true">[[${blog.commentSize}]]</i>--%>
                            </div>
                        </div>
                        <div class="card-block">
                            <h2 class="card-title">
								<span>
                                    <%--用户头像以及跳转--%>
                                    <%--<a href="/user/#" title="#">--%>
                                        <%--<img src="images/avatar-defualt.jpg">--%>
                                    <%--</a>--%>

                                    <%--<a href="/u/waylau" title="waylau"--%>
                                       <%--th:href="'/u/' + ${blog.username}" th:title="${blog.username}">--%>
										<%--<img src="/images/avatar-defualt.jpg"--%>
                                             <%--th:src="${blog.avatar} == null ? '/images/avatar-defualt.jpg' : ${blog.avatar}"--%>
                                             <%--class="blog-avatar-50">--%>
								    <%--</a>--%>
								</span>
                                <%--具体问题和链接--%>
                                <%--<a href="/u/waylau/blogs/1" class="card-link" title="waylau"--%>
                                <%--th:href="'/u/' + ${blog.username} + '/blogs/'+ ${blog.blogId}"--%>
                                <%--th:title="${blog.title}" th:text="${blog.title}"> OAuth--%>
                                <%--2.0 认证的原理与实践--%>
                                <%--</a>--%>
                            </h2>
                            <p class="card-text" th:text="${blog.summary}">我收藏夹有一家店，叫士多啤梨R酱小铺。卖欧美“原单”女装的，真假且不论，
                                价格总是比别人家高很多（起码一两百）。微淘里大家评论价格高，而且店主知道别家价格比她低
                                ，找贸易去限价。今早我一看微淘，她家40条评论只剩2条了，不利的全删了。我看这卖家不爽，所以我要把她发到知乎来。还有同类店吗？曝光吧</p>
                            <%--尾部信息--%>
                            <div class="card-text">
                                <a href="/u/waylau" th:href="'/u/' + ${blog.username}"
                                   class="card-link" th:text=${blog.username}>waylau</a> 发表于2019年
                                <%--<i class="fa fa-eye" aria-hidden="true">[[${blog.readSize}]]</i>--%>
                                <%--<i class="fa fa-heart-o" aria-hidden="true">[[${blog.voteSize}]]</i>--%>
                                <%--<i class="fa fa-comment-o" aria-hidden="true">[[${blog.commentSize}]]</i>--%>
                            </div>
                        </div>
                        <div class="card-block">
                            <h2 class="card-title">
								<span>
                                    <%--用户头像以及跳转--%>
                                    <%--<a href="/user/#" title="#">--%>
                                        <%--<img src="images/avatar-defualt.jpg">--%>
                                    <%--</a>--%>

                                    <%--<a href="/u/waylau" title="waylau"--%>
                                       <%--th:href="'/u/' + ${blog.username}" th:title="${blog.username}">--%>
										<%--<img src="/images/avatar-defualt.jpg"--%>
                                             <%--th:src="${blog.avatar} == null ? '/images/avatar-defualt.jpg' : ${blog.avatar}"--%>
                                             <%--class="blog-avatar-50">--%>
								    <%--</a>--%>
								</span>
                                <%--具体问题和链接--%>
                                <%--<a href="/u/waylau/blogs/1" class="card-link" title="waylau"--%>
                                <%--th:href="'/u/' + ${blog.username} + '/blogs/'+ ${blog.blogId}"--%>
                                <%--th:title="${blog.title}" th:text="${blog.title}"> OAuth--%>
                                <%--2.0 认证的原理与实践--%>
                                <%--</a>--%>
                            </h2>
                            <p class="card-text" th:text="${blog.summary}">我收藏夹有一家店，叫士多啤梨R酱小铺。卖欧美“原单”女装的，真假且不论，
                                价格总是比别人家高很多（起码一两百）。微淘里大家评论价格高，而且店主知道别家价格比她低
                                ，找贸易去限价。今早我一看微淘，她家40条评论只剩2条了，不利的全删了。我看这卖家不爽，所以我要把她发到知乎来。还有同类店吗？曝光吧</p>
                            <%--尾部信息--%>
                            <div class="card-text">
                                <a href="/u/waylau" th:href="'/u/' + ${blog.username}"
                                   class="card-link" th:text=${blog.username}>waylau</a> 发表于2019年
                                <%--<i class="fa fa-eye" aria-hidden="true">[[${blog.readSize}]]</i>--%>
                                <%--<i class="fa fa-heart-o" aria-hidden="true">[[${blog.voteSize}]]</i>--%>
                                <%--<i class="fa fa-comment-o" aria-hidden="true">[[${blog.commentSize}]]</i>--%>
                            </div>
                        </div>
                        <div class="card-block">
                            <h2 class="card-title">
								<span>
                                    <%--用户头像以及跳转--%>
                                    <%--<a href="/user/#" title="#">--%>
                                        <%--<img src="images/avatar-defualt.jpg">--%>
                                    <%--</a>--%>

                                    <%--<a href="/u/waylau" title="waylau"--%>
                                       <%--th:href="'/u/' + ${blog.username}" th:title="${blog.username}">--%>
										<%--<img src="/images/avatar-defualt.jpg"--%>
                                             <%--th:src="${blog.avatar} == null ? '/images/avatar-defualt.jpg' : ${blog.avatar}"--%>
                                             <%--class="blog-avatar-50">--%>
								    <%--</a>--%>
								</span>
                                <%--具体问题和链接--%>
                                <%--<a href="/u/waylau/blogs/1" class="card-link" title="waylau"--%>
                                <%--th:href="'/u/' + ${blog.username} + '/blogs/'+ ${blog.blogId}"--%>
                                <%--th:title="${blog.title}" th:text="${blog.title}"> OAuth--%>
                                <%--2.0 认证的原理与实践--%>
                                <%--</a>--%>
                            </h2>
                            <p class="card-text" th:text="${blog.summary}">我收藏夹有一家店，叫士多啤梨R酱小铺。卖欧美“原单”女装的，真假且不论，
                                价格总是比别人家高很多（起码一两百）。微淘里大家评论价格高，而且店主知道别家价格比她低
                                ，找贸易去限价。今早我一看微淘，她家40条评论只剩2条了，不利的全删了。我看这卖家不爽，所以我要把她发到知乎来。还有同类店吗？曝光吧</p>
                            <%--尾部信息--%>
                            <div class="card-text">
                                <a href="/u/waylau" th:href="'/u/' + ${blog.username}"
                                   class="card-link" th:text=${blog.username}>waylau</a> 发表于2019年
                                <%--<i class="fa fa-eye" aria-hidden="true">[[${blog.readSize}]]</i>--%>
                                <%--<i class="fa fa-heart-o" aria-hidden="true">[[${blog.voteSize}]]</i>--%>
                                <%--<i class="fa fa-comment-o" aria-hidden="true">[[${blog.commentSize}]]</i>--%>
                            </div>
                        </div>
                        <div class="card-block">
                            <h2 class="card-title">
								<span>
                                    <%--用户头像以及跳转--%>
                                    <%--<a href="/user/#" title="#">--%>
                                        <%--<img src="images/avatar-defualt.jpg">--%>
                                    <%--</a>--%>

                                    <%--<a href="/u/waylau" title="waylau"--%>
                                       <%--th:href="'/u/' + ${blog.username}" th:title="${blog.username}">--%>
										<%--<img src="/images/avatar-defualt.jpg"--%>
                                             <%--th:src="${blog.avatar} == null ? '/images/avatar-defualt.jpg' : ${blog.avatar}"--%>
                                             <%--class="blog-avatar-50">--%>
								    <%--</a>--%>
								</span>
                                <%--具体问题和链接--%>
                                <%--<a href="/u/waylau/blogs/1" class="card-link" title="waylau"--%>
                                <%--th:href="'/u/' + ${blog.username} + '/blogs/'+ ${blog.blogId}"--%>
                                <%--th:title="${blog.title}" th:text="${blog.title}"> OAuth--%>
                                <%--2.0 认证的原理与实践--%>
                                <%--</a>--%>
                            </h2>
                            <p class="card-text" th:text="${blog.summary}">我收藏夹有一家店，叫士多啤梨R酱小铺。卖欧美“原单”女装的，真假且不论，
                                价格总是比别人家高很多（起码一两百）。微淘里大家评论价格高，而且店主知道别家价格比她低
                                ，找贸易去限价。今早我一看微淘，她家40条评论只剩2条了，不利的全删了。我看这卖家不爽，所以我要把她发到知乎来。还有同类店吗？曝光吧</p>
                            <%--尾部信息--%>
                            <div class="card-text">
                                <a href="/u/waylau" th:href="'/u/' + ${blog.username}"
                                   class="card-link" th:text=${blog.username}>waylau</a> 发表于2019年
                                <%--<i class="fa fa-eye" aria-hidden="true">[[${blog.readSize}]]</i>--%>
                                <%--<i class="fa fa-heart-o" aria-hidden="true">[[${blog.voteSize}]]</i>--%>
                                <%--<i class="fa fa-comment-o" aria-hidden="true">[[${blog.commentSize}]]</i>--%>
                            </div>
                        </div>
                        <div class="card-block">
                            <h2 class="card-title">
								<span>
                                    <%--用户头像以及跳转--%>
                                    <%--<a href="/user/#" title="#">--%>
                                        <%--<img src="images/avatar-defualt.jpg">--%>
                                    <%--</a>--%>

                                    <%--<a href="/u/waylau" title="waylau"--%>
                                       <%--th:href="'/u/' + ${blog.username}" th:title="${blog.username}">--%>
										<%--<img src="/images/avatar-defualt.jpg"--%>
                                             <%--th:src="${blog.avatar} == null ? '/images/avatar-defualt.jpg' : ${blog.avatar}"--%>
                                             <%--class="blog-avatar-50">--%>
								    <%--</a>--%>
								</span>
                                <%--具体问题和链接--%>
                                <%--<a href="/u/waylau/blogs/1" class="card-link" title="waylau"--%>
                                <%--th:href="'/u/' + ${blog.username} + '/blogs/'+ ${blog.blogId}"--%>
                                <%--th:title="${blog.title}" th:text="${blog.title}"> OAuth--%>
                                <%--2.0 认证的原理与实践--%>
                                <%--</a>--%>
                            </h2>
                            <p class="card-text" th:text="${blog.summary}">我收藏夹有一家店，叫士多啤梨R酱小铺。卖欧美“原单”女装的，真假且不论，
                                价格总是比别人家高很多（起码一两百）。微淘里大家评论价格高，而且店主知道别家价格比她低
                                ，找贸易去限价。今早我一看微淘，她家40条评论只剩2条了，不利的全删了。我看这卖家不爽，所以我要把她发到知乎来。还有同类店吗？曝光吧</p>
                            <%--尾部信息--%>
                            <div class="card-text">
                                <a href="/u/waylau" th:href="'/u/' + ${blog.username}"
                                   class="card-link" th:text=${blog.username}>waylau</a> 发表于2019年
                                <%--<i class="fa fa-eye" aria-hidden="true">[[${blog.readSize}]]</i>--%>
                                <%--<i class="fa fa-heart-o" aria-hidden="true">[[${blog.voteSize}]]</i>--%>
                                <%--<i class="fa fa-comment-o" aria-hidden="true">[[${blog.commentSize}]]</i>--%>
                            </div>
                        </div>
                        <div class="card-block">
                            <h2 class="card-title">
								<span>
                                    <%--用户头像以及跳转--%>
                                    <%--<a href="/user/#" title="#">--%>
                                        <%--<img src="images/avatar-defualt.jpg">--%>
                                    <%--</a>--%>

                                    <%--<a href="/u/waylau" title="waylau"--%>
                                       <%--th:href="'/u/' + ${blog.username}" th:title="${blog.username}">--%>
										<%--<img src="/images/avatar-defualt.jpg"--%>
                                             <%--th:src="${blog.avatar} == null ? '/images/avatar-defualt.jpg' : ${blog.avatar}"--%>
                                             <%--class="blog-avatar-50">--%>
								    <%--</a>--%>
								</span>
                                <%--具体问题和链接--%>
                                <%--<a href="/u/waylau/blogs/1" class="card-link" title="waylau"--%>
                                <%--th:href="'/u/' + ${blog.username} + '/blogs/'+ ${blog.blogId}"--%>
                                <%--th:title="${blog.title}" th:text="${blog.title}"> OAuth--%>
                                <%--2.0 认证的原理与实践--%>
                                <%--</a>--%>
                            </h2>
                            <p class="card-text" th:text="${blog.summary}">我收藏夹有一家店，叫士多啤梨R酱小铺。卖欧美“原单”女装的，真假且不论，
                                价格总是比别人家高很多（起码一两百）。微淘里大家评论价格高，而且店主知道别家价格比她低
                                ，找贸易去限价。今早我一看微淘，她家40条评论只剩2条了，不利的全删了。我看这卖家不爽，所以我要把她发到知乎来。还有同类店吗？曝光吧</p>
                            <%--尾部信息--%>
                            <div class="card-text">
                                <a href="/u/waylau" th:href="'/u/' + ${blog.username}"
                                   class="card-link" th:text=${blog.username}>waylau</a> 发表于2019年
                                <%--<i class="fa fa-eye" aria-hidden="true">[[${blog.readSize}]]</i>--%>
                                <%--<i class="fa fa-heart-o" aria-hidden="true">[[${blog.voteSize}]]</i>--%>
                                <%--<i class="fa fa-comment-o" aria-hidden="true">[[${blog.commentSize}]]</i>--%>
                            </div>
                        </div>
                        <div class="card-block">
                            <h2 class="card-title">
								<span>
                                    <%--用户头像以及跳转--%>
                                    <%--<a href="/user/#" title="#">--%>
                                        <%--<img src="images/avatar-defualt.jpg">--%>
                                    <%--</a>--%>

                                    <%--<a href="/u/waylau" title="waylau"--%>
                                       <%--th:href="'/u/' + ${blog.username}" th:title="${blog.username}">--%>
										<%--<img src="/images/avatar-defualt.jpg"--%>
                                             <%--th:src="${blog.avatar} == null ? '/images/avatar-defualt.jpg' : ${blog.avatar}"--%>
                                             <%--class="blog-avatar-50">--%>
								    <%--</a>--%>
								</span>
                                <%--具体问题和链接--%>
                                <%--<a href="/u/waylau/blogs/1" class="card-link" title="waylau"--%>
                                <%--th:href="'/u/' + ${blog.username} + '/blogs/'+ ${blog.blogId}"--%>
                                <%--th:title="${blog.title}" th:text="${blog.title}"> OAuth--%>
                                <%--2.0 认证的原理与实践--%>
                                <%--</a>--%>
                            </h2>
                            <p class="card-text" th:text="${blog.summary}">我收藏夹有一家店，叫士多啤梨R酱小铺。卖欧美“原单”女装的，真假且不论，
                                价格总是比别人家高很多（起码一两百）。微淘里大家评论价格高，而且店主知道别家价格比她低
                                ，找贸易去限价。今早我一看微淘，她家40条评论只剩2条了，不利的全删了。我看这卖家不爽，所以我要把她发到知乎来。还有同类店吗？曝光吧</p>
                            <%--尾部信息--%>
                            <div class="card-text">
                                <a href="/u/waylau" th:href="'/u/' + ${blog.username}"
                                   class="card-link" th:text=${blog.username}>waylau</a> 发表于2019年
                                <%--<i class="fa fa-eye" aria-hidden="true">[[${blog.readSize}]]</i>--%>
                                <%--<i class="fa fa-heart-o" aria-hidden="true">[[${blog.voteSize}]]</i>--%>
                                <%--<i class="fa fa-comment-o" aria-hidden="true">[[${blog.commentSize}]]</i>--%>
                            </div>
                        </div>


                    </div>
                    <div th:replace="~{fragments/page :: page}">...</div>
                </div>
            </div>
        </div>

        <!-- 右侧栏目 -->
        <div class="col-md-4">
            <div>
                <!-- 热门标签 -->
                <div class="card ">
                    <h5 class="card-header"><i class="fa fa-tags" aria-hidden="true"></i> 热门标签</h5>
                    <div class="card-block">
                        <div class="row">
                            <div class="col-lg-12">
                                <%--<a th:each="tag, tagStat : ${tags}" th:object="${tag}"--%>
                                <%--href="/blogs?keyword=1" th:href="'/blogs?keyword=' +  *{name}">--%>
                                <%--<span class="badge"--%>
                                <%--th:classappend="${tagStat.index} eq 0--%>
                                <%--? 'badge-danger': (${tagStat.index} eq 1--%>
                                <%--? 'badge-warning':(${tagStat.index} eq 2--%>
                                <%--? 'badge-info':'badge-default'))"--%>
                                <%--th:text="*{name}">Web Design</span>--%>
                                <%--</a>--%>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 热门问题 -->
                <div class="card my-4">
                    <h5 class="card-header"><i class="fa fa-users" aria-hidden="true"></i> 热门问题</h5>
                    <div class="card-block">
                        <div class="row">
                            <div class="col-lg-12">
								<span th:each="user: ${users}" th:object="${user}">
									<%--<a--%>
                                            <%--href="/u/waylau" th:href="'/u/' + *{username}" title="waylau"--%>
                                            <%--th:title="*{username}"> <img--%>
                                            <%--src="/images/avatar-defualt.jpg"--%>
                                            <%--th:src="*{avatar} == null ? '/images/avatar-defualt.jpg' : *{avatar}"--%>
                                            <%--class="blog-avatar-50">--%>
									<%--</a>--%>
								</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 热门文章 -->
                <div class="card my-4">
                    <h5 class="card-header"><i class="fa fa-fire" aria-hidden="true"></i> 热门文章</h5>

                    <ul class="list-group" th:each="hotblog , hotblogStat : ${hotest}"
                        th:object="${hotblog}">
                        <a th:href="'/u/'+*{username} +'/blogs/'+ *{blogId}"
                           class="list-group-item"> [[*{title}]]<span
                                class="badge badge-pill"
                                th:classappend="${hotblogStat.index} eq 0
							? 'badge-danger': (${hotblogStat.index} eq 1
							? 'badge-warning':(${hotblogStat.index} eq 2
							? 'badge-info':'badge-default'))">[[*{readSize}]]</span>
                        </a>
                    </ul>

                </div>

                <!-- 最新发布 -->
                <div class="card my-4">
                    <h5 class="card-header"><i class="fa fa-line-chart" aria-hidden="true"></i> 最新发布</h5>
                    <div class="list-group">
                        <ul class="list-group" th:each="newblog : ${newest}"
                            th:object="${newblog}">
                            <a th:href="'/u/'+*{username} +'/blogs/'+ *{blogId}"
                               class="list-group-item" th:text="*{title}"> </a>
                        </ul>
                    </div>

                </div>
            </div>
        </div>

    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<!-- Bootstrap core JavaScript
================================================== -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>

