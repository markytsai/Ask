# Ask
* Ask is a web-based Q/A System with Recommendation.

* It works with Spring, Spring MVC and MyBatis frameworks and MySql and Redis in the backend.

* The recommendation module is implemented by user-based and item-based algorithms.

Here are several rederings.

1. Login page (with register page in same style)
![](https://raw.githubusercontent.com/markytsai/Ask/master/src/main/webapp/samples/login.jpg)

2. Question index page (shows followed questions by login user)
![](https://raw.githubusercontent.com/markytsai/Ask/master/src/main/webapp/samples/index-following.png)

3. Question detail page (shows question detail and answers details)
![](https://raw.githubusercontent.com/markytsai/Ask/master/src/main/webapp/samples/question-detail.jpg)

4. User home page (with only five tabs finished out of seven)
![](https://raw.githubusercontent.com/markytsai/Ask/master/src/main/webapp/samples/user-homepage.jpg)


#### To-do list

1. collection function, put the answer into favorites;
2. answering function, integrated with rich text editor;
3. users automatically following questions they raise;
4. full text search including username and question name as search target;
5. pop out a favorites box for user to choose which favorite to store answers for themselves;
6. user personal home page（emergency）
7. returning Response entity as a message carrier;
8. global exceptions capture;
9. person cards floating nearby when the cursor hovers the users' avatar;
10. top the newest answers;
11. folding extra contents of answer(in the process);
12. foreign Q&A community analysis including algorithm, product feature;
13. personal home page with collection tab, for one more submenu distinguishing answers from different favorites;
14. uploading avatar on clicking avatar picture;
15. uploaded avatar must support being cropped;
16. storing pictures in [qiniuyun](https://www.qiniu.com/);
17. tourist login;