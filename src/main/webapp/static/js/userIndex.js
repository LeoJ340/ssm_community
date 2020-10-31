function getScrollTop(){
    let scrollTop
    let bodyScrollTop = 0
    let documentScrollTop = 0
    if(document.body){
        bodyScrollTop = document.body.scrollTop
    }
    if(document.documentElement){
        documentScrollTop = document.documentElement.scrollTop
    }
    scrollTop = (bodyScrollTop - documentScrollTop > 0) ? bodyScrollTop : documentScrollTop
    return scrollTop
}
function getScrollHeight(){
    let scrollHeight
    let bodyScrollHeight = 0
    let documentScrollHeight = 0
    if(document.body){
        bodyScrollHeight = document.body.scrollHeight
    }
    if(document.documentElement){
        documentScrollHeight = document.documentElement.scrollHeight
    }
    scrollHeight = (bodyScrollHeight - documentScrollHeight > 0) ? bodyScrollHeight : documentScrollHeight
    return scrollHeight
}
function getWindowHeight(){
    let windowHeight
    if(document.compatMode === "CSS1Compat"){
        windowHeight = document.documentElement.clientHeight
    }else{
        windowHeight = document.body.clientHeight
    }
    return windowHeight
}
window.onscroll = function () {
    // 页面滚动到底部
    if(getScrollHeight() - (getScrollTop() + getWindowHeight()) < 1){
        if (tabType === "dynamic"){
            lazyLoadDynamics()
        }else if (tabType === "invitation"){
            lazyLoadInvitations()
        }else if (tabType === "notice"){
            lazyLoadNotices()
        }
    }
}

/**
 * tabContent解决方案:
 *      初始化方法
 *          用于：切换Tab、点击Tab、页面初始化
 *          逻辑：设置tab变量 -> 清空列表 -> 请求接口获取数据 —> 拼接html渲染 -> 判断隐藏加载图标
 *      懒加载方法
 *          页面滚动底部触发 —> 请求接口获取数据 —> 拼接html渲染 -> 设置isFull标识符（判断隐藏加载图标）
 */

// 全局标识符
let tabType = ""
let dynamicIsFull = false
let invitationIsFull = false
let noticeIsFull = false
// 页码与单页显示数
let dynamicPageIndex = 1
let invitationPageIndex = 1
let noticesPageIndex = 1
let pageSize = 10

// 初始化个人动态
function dynamics() {
    tabType = "dynamic"
    // 清空列表
    dynamicPageIndex = 1
    $("#dynamics").empty()
    loadDynamics()
    dynamicIsFull = false
}

// 懒加载个人动态
function lazyLoadDynamics() {
    if (!dynamicIsFull){
        loadDynamics()
    }
}

// 初始化invitationContent
function invitations() {
    tabType = "invitation"
    // 清空列表
    invitationPageIndex = 1
    $("#invitations").empty()
    loadInvitations()
    invitationIsFull = false
}

// 懒加载invitationContent
function lazyLoadInvitations() {
    if (!invitationIsFull){
        loadInvitations()
    }
}

// 初始化noticeContent
function notices() {
    tabType = "notice"
    // 清空列表
    noticesPageIndex = 1
    $("#notices").empty()
    loadNotices()
    noticeIsFull = false
}

// 懒加载noticeContent
function lazyLoadNotices() {
    if (!noticeIsFull){
        loadNotices()
    }
}

// 时间格式处理
function dateFormat(fmt, date) {
    let newDate = new Date(date)
    let ret;
    const opt = {
        "Y+": newDate.getFullYear().toString(),        // 年
        "m+": (newDate.getMonth() + 1).toString(),     // 月
        "d+": newDate.getDate().toString(),            // 日
        "H+": newDate.getHours().toString(),           // 时
        "M+": newDate.getMinutes().toString(),         // 分
        "S+": newDate.getSeconds().toString()          // 秒
    };
    for (let k in opt) {
        ret = new RegExp("(" + k + ")").exec(fmt);
        if (ret) {
            fmt = fmt.replace(ret[1], (ret[1].length === 1) ? (opt[k]) : (opt[k].padStart(ret[1].length, "0")))
        }
    }
    return fmt;
}