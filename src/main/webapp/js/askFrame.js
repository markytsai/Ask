var questionList;
var topicList;
var hint;
var topicChosenNum = 0;
var topicChosenString = "";


function autoSearchRelativeQuestion(partialWord) {
    $.ajax({
        url: "/getProbablyRelativeQestions/" + partialWord.trim(),
        type: "get",
        async: false,
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {
                questionList = response.data;
                hint = response.message;
            } else {
            }
        }
    });
}

function autoSearchRelativeTopic(partialWord) {
    $.ajax({
        url: "/getProbablyRelativeTopics/" + partialWord.trim(),
        type: "get",
        async: false,
        dataType: 'json',
        success: function (response) {
            if (response.state == 1) {
                topicList = response.data;
                hint = response.message;
            } else {
            }
        }
    });
}

function addTopicThroughSearch(inp) {
    var currentFocus;

    inp.addEventListener("input", function (e) {
        var a, b, i, val = this.value.trim();
        closeAllLists();
        autoSearchRelativeTopic(val);
        // 根据topicChosenString，更新topicList
        var temp = topicChosenString.split(',');

        // 这里双重循环去除已经选中的话题
        for (var i = 0; i < topicList.length; i++) {
            for (var j = 0; j < temp.length; j++) {
                if (topicList[i].topicId == temp[j]) {
                    topicList.splice(i, 1);
                }
            }

        }

        /*close any already open lists of autocompleted values*/
        closeAllLists();
        if (!val) {
            return false;
        }
        currentFocus = -1;
        /*create a DIV element that will contain the items (values):*/
        a = document.createElement("DIV");
        a.setAttribute("id", this.id + "autocomplete-list");
        a.setAttribute("class", "autocomplete-items");
        a.setAttribute("style", "margin-top: -30px;width: 568px;margin-left: 15px;");
        /*append the DIV element as a child of the autocomplete container:*/
        this.parentNode.appendChild(a);

        // if (topicList.length > 0) {
        //     b = document.createElement("DIV");
        //     /*make the matching letters bold:*/
        //     b.innerHTML = "<p style='float: right;font-size: small;margin-top: -9px;'>" + hint + "</p>";
        //     /*insert a input field that will hold the current array item's value:*/
        //     a.appendChild(b);
        // }

        for (i = 0; i < topicList.length; i++) {
            if (topicChosenString.includes(topicList[i].topicId + ",")) {
                continue;
            }
            b = document.createElement("DIV");
            /*make the matching letters bold:*/
            var topicName = topicList[i].topicName;
            var hrefA = document.createElement('A');


            if (topicName.startsWith(val)) {
                hrefA.innerHTML += "<strong>" + topicName.substr(0, val.length) + "</strong>";
                hrefA.innerHTML += topicName.substr(val.length);
            } else if (topicName.endsWith(val)) {
                hrefA.innerHTML += topicName.substr(0, topicName.length - val.length);
                hrefA.innerHTML += "<strong>" + topicName.substr(topicName.length - val.length, topicName.length) + "</strong>";
            } else {
                var leftLoc = topicName.indexOf(val);
                hrefA.innerHTML += topicName.substr(0, leftLoc);
                hrefA.innerHTML += "<strong>" + topicName.substr(leftLoc, val.length) + "</strong>";
                hrefA.innerHTML += topicName.substr(leftLoc + val.length);
            }
            hrefA.innerHTML += "<p style='float: right;'>" + topicList[i].topicId + "个人正在关注</p>";
            hrefA.setAttribute('href', '/topic/' + topicList[i].topicId + '/introduction');
            hrefA.setAttribute('style', 'color: black;');
            hrefA.setAttribute('title', '点击查看话题详情');
            b.appendChild(hrefA);
            a.appendChild(b);
        }
    });
    inp.addEventListener("keydown", function (e) {
        var x = document.getElementById(this.id + "autocomplete-list");
        if (x) x = x.getElementsByTagName("div");
        if (e.keyCode == 40) {
            /*If the arrow DOWN key is pressed,
            increase the currentFocus variable:*/
            currentFocus++;
            /*and and make the current item more visible:*/
            addActive(x);
        } else if (e.keyCode == 38) { //up
            /*If the arrow UP key is pressed,
            decrease the currentFocus variable:*/
            currentFocus--;
            /*and and make the current item more visible:*/
            addActive(x);
        } else if (e.keyCode == 13) {
            /*If the ENTER key is pressed, prevent the form from being submitted,*/
            e.preventDefault();
            if (currentFocus > -1) {
                /*and simulate a click on the "active" item:*/
                // if (x) x[currentFocus].click();
                if (x) {
                    topicChosenNum += 1;
                    checkNum();
                    topicChosenString += topicList[currentFocus].topicId + ",";

                    var s, a, i;
                    // var topicRoot = $('.ask-topic-list');
                    var topicRoot = document.getElementById('ask-topic-list');
                    s = document.createElement("SPAN");
                    s.setAttribute("class", "topicItem");
                    s.setAttribute('style', 'border-radius: 40%;background-color: #cbcbd8;padding: 2px;margin-right: 4px;');
                    /*append the DIV element as a child of the autocomplete container:*/
                    topicRoot.appendChild(s);

                    a = document.createElement('A');
                    a.setAttribute('href', '/topic/' + topicList[currentFocus].topicId + '/introduction');
                    a.text = topicList[currentFocus].topicName;
                    s.appendChild(a);
                    i = document.createElement("I");
                    i.setAttribute('class', 'icon-remove');
                    s.appendChild(i);

                    x[currentFocus].click();
                    $('#topic').val("");
                }
            }
        }
    });

    function addActive(x) {
        /*a function to classify an item as "active":*/
        if (!x) return false;
        /*start by removing the "active" class on all items:*/
        removeActive(x);
        if (currentFocus >= x.length) currentFocus = 0;
        if (currentFocus < 0) currentFocus = (x.length - 1);
        /*add class "autocomplete-active":*/
        x[currentFocus].classList.add("autocomplete-active");
    }

    function removeActive(x) {
        /*a function to remove the "active" class from all autocomplete items:*/
        for (var i = 0; i < x.length; i++) {
            x[i].classList.remove("autocomplete-active");
        }
    }

    function closeAllLists(elmnt) {
        /*close all autocomplete lists in the document,
        except the one passed as an argument:*/
        var x = document.getElementsByClassName("autocomplete-items");
        for (var i = 0; i < x.length; i++) {
            if (elmnt != x[i] && elmnt != inp) {
                x[i].parentNode.removeChild(x[i]);
            }
        }
    }

    /*execute a function when someone clicks in the document:*/
    document.addEventListener("click", function (e) {
        if (e.target.getAttribute('class') == 'icon-remove') {
            document.getElementById('ask-topic-list').removeChild(e.target.parentNode);
        }
        closeAllLists(e.target);
        // $('#topic').val("");
    });

    // 这个点击事件不起做用，不知道为什么
    $(".icon-remove").on('click', function (e) {
        var topicRoot = document.getElementById('ask-topic-list');
        topicRoot.removeChild(this.parentNode);
    });
}



// ----------------------------------------------------------------------------------------
function autocomplete(inp) {
    /*the autocomplete function takes two arguments,
    the text field element and an array of possible autocompleted values:*/
    var currentFocus;
    /*execute a function when someone writes in the text field:*/
    inp.addEventListener("input", function (e) {
        var a, b, i, val = this.value;
        autoSearchRelativeQuestion(val);
        /*close any already open lists of autocompleted values*/
        closeAllLists();
        if (!val) {
            return false;
        }
        currentFocus = -1;
        /*create a DIV element that will contain the items (values):*/
        a = document.createElement("DIV");
        a.setAttribute("id", this.id + "autocomplete-list");
        a.setAttribute("class", "autocomplete-items");
        /*append the DIV element as a child of the autocomplete container:*/
        this.parentNode.appendChild(a);

        if (questionList.length > 0) {
            b = document.createElement("DIV");
            /*make the matching letters bold:*/
            b.innerHTML = "<p style='float: right;font-size: small;margin-top: -9px;'>" + hint + "</p>";
            /*insert a input field that will hold the current array item's value:*/
            a.appendChild(b);
        }

        // prepare to search relative questions from server using ajax, and display them in DIV created above
        var i;
        for (i = 0; i < questionList.length; i++) {
            b = document.createElement("DIV");
            /*make the matching letters bold:*/
            var title = questionList[i].questionTitle;
            var hrefA = document.createElement('A');


            if (title.startsWith(val)) {
                hrefA.innerHTML += "<strong>" + title.substr(0, val.length) + "</strong>";
                hrefA.innerHTML += title.substr(val.length);
            } else if (title.endsWith(val)) {
                hrefA.innerHTML += title.substr(0, title.length - val.length);
                hrefA.innerHTML += "<strong>" + title.substr(title.length - val.length, title.length) + "</strong>";
            } else {
                var leftLoc = title.indexOf(val);
                hrefA.innerHTML += title.substr(0, leftLoc);
                hrefA.innerHTML += "<strong>" + title.substr(leftLoc, val.length) + "</strong>";
                hrefA.innerHTML += title.substr(leftLoc + val.length);
            }
            hrefA.innerHTML += "<p style='float: right;'>" + questionList[i].answerCount + "个回答</p>";
            hrefA.setAttribute('href', '/question/' + questionList[i].questionId);
            hrefA.setAttribute('style', 'color: black;');
            hrefA.setAttribute('title', '点击查看问题详情');
            b.appendChild(hrefA);
            a.appendChild(b);
        }
    });
    /*execute a function presses a key on the keyboard:*/
    inp.addEventListener("keydown", function (e) {
        var x = document.getElementById(this.id + "autocomplete-list");
        if (x) x = x.getElementsByTagName("div");
        if (e.keyCode == 40) {
            /*If the arrow DOWN key is pressed,
            increase the currentFocus variable:*/
            currentFocus++;
            /*and and make the current item more visible:*/
            addActive(x);
        } else if (e.keyCode == 38) { //up
            /*If the arrow UP key is pressed,
            decrease the currentFocus variable:*/
            currentFocus--;
            /*and and make the current item more visible:*/
            addActive(x);
        } else if (e.keyCode == 13) {
            /*If the ENTER key is pressed, prevent the form from being submitted,*/
            e.preventDefault();
            if (currentFocus > -1) {
                /*and simulate a click on the "active" item:*/
                if (x) x[currentFocus].click();
            }
        }
    });

    function addActive(x) {
        /*a function to classify an item as "active":*/
        if (!x) return false;
        /*start by removing the "active" class on all items:*/
        removeActive(x);
        if (currentFocus >= x.length) currentFocus = 0;
        if (currentFocus < 0) currentFocus = (x.length - 1);
        /*add class "autocomplete-active":*/
        x[currentFocus].classList.add("autocomplete-active");
    }

    function removeActive(x) {
        /*a function to remove the "active" class from all autocomplete items:*/
        for (var i = 0; i < x.length; i++) {
            x[i].classList.remove("autocomplete-active");
        }
    }

    function closeAllLists(elmnt) {
        /*close all autocomplete lists in the document,
        except the one passed as an argument:*/
        var x = document.getElementsByClassName("autocomplete-items");
        for (var i = 0; i < x.length; i++) {
            if (elmnt != x[i] && elmnt != inp) {
                x[i].parentNode.removeChild(x[i]);
            }
        }
    }

    /*execute a function when someone clicks in the document:*/
    document.addEventListener("click", function (e) {
        closeAllLists(e.target);
    });
}


function checkNum() {
    if (topicChosenNum > 0) {
        $('#topicDisplay').show();
    } else {
        $('#topicDisplay').hide();
    }
}

/*initiate the autocomplete function on the "questionTitle" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("questionTitle"));

addTopicThroughSearch(document.getElementById("topic"));

checkNum();
