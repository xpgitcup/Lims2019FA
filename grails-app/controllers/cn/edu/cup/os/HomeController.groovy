package cn.edu.cup.os

import cn.edu.cup.basic.Caption
import cn.edu.cup.system.SystemMenu
import cn.edu.cup.system.SystemStatus
import cn.edu.cup.system.SystemUser
import grails.converters.JSON

import java.text.SimpleDateFormat

class HomeController {

    def systemCommonService
    def systemMenuService
    def initService
    def systemUserService
    def commonQueryAService

    def prepareParams() {
        def pkey = "${params.key}"
        // 计算起始时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, - 7);
        Date monday = c.getTime();
        String preMonday = sdf.format(monday);
        println("7 天以前 ：${preMonday}");
        // 更新参数
        if (pkey.contains("近7天")) {
            params.startDate = monday
        }
    }

    def processResult(result, params) {
        return result
    }

    def list() {
        prepareParams()
        def result = commonQueryAService.listFunction(params)
        result = processResult(result, params)
        def view = result.view
        flash.message = result.message
        if (request.xhr) {
            render(template: view, model: [objectList: result.objectList, flash: flash])
        } else {
            respond result.objectList
        }
    }

    def count() {
        prepareParams()
        def count = commonQueryAService.countFunction(params)
        def result = [count: count]

        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    /*
    修改密码
    * */

    def changePasswordUI() {}

    def changePassword() {
        def oldPassword = params.oldPassword.encodeAsMD5()
        def user = systemUserService.get(session.systemUser.id)
        println("修改${user}的密码！${user.id}")
        def p = user.password
        if (p==oldPassword) {
            def newPassword = params.newPassword
            def rePassword = params.rePassword
            if (newPassword!="") {
                if (newPassword == rePassword) {
                    user.password = newPassword
                    systemUserService.save(user)
                    //重新设置用户
                    session.systemUser = user
                    flash.message = "密码修改成功！"
                    redirect(action: "index")
                } else {
                    flash.message = "两次密码不一致！"
                    redirect(action: "changePasswordUI")
                }
            } else {
                flash.message = "密码不能空！"
                redirect(action: "changePasswordUI")
            }
        } else {
            flash.message = "密码不对！"
            redirect(action: "changePasswordUI")
        }
    }

    /*
    选择当前菜单
    * */

    def selectCurrentMenuItem() {
        println("${params}")
        systemCommonService.updateSystemStatus(request, params)
        redirect(action: "index")
    }

    def getMenuItems() {
        def systemMenuList = []
        def menuPath = []
        def currentMenuItem = null
        def sid = session.getId()
        def ss = SystemStatus.findBySessionId(sid)
        if (ss) {
            //println("参数：${ss.statusParameters}")
            def ps = ss.getParameters()
            currentMenuItem = systemMenuService.get(ps.currentMenuItem)
            //println("当前菜单：${currentMenuItem}")
            if (currentMenuItem) {
                //println("当前：${currentMenuItem}")
                menuPath = currentMenuItem.menuPath()
                systemMenuList = currentMenuItem.menuItems
            } else {
                def q = SystemMenu.createCriteria()
                def user = systemUserService.get(session.systemUser.id)
                //println("当前用户：${user}")
                if (user) {
                    def roles = user.userRoles()
                    //println("当前权限：${roles}")
                    systemMenuList = q.list(params) {
                        isNull('upMenuItem')
                        'in'('menuContext', roles)      // 只要菜单的名字在其中就可以 20181208
                        order('menuOrder')
                    }
                }
            }
        } else {
        }
        def result = [systemMenuList: systemMenuList, meunPath: menuPath, currentMenuItem: currentMenuItem]
        if (request.xhr) {
            render(template: "applicationMenu", model: result)
        } else {
            result
        }
    }

    def countOnlineUsers() {
        def current = new Date()
        //Date start = new Date(current.getTime() - 30 * 60 * 1000) // 30分钟转换成毫秒
        //def cc = SystemStatus.countByLogoutTimeIsNullAndLoginTimeGreaterThan(start)
        //def users = SystemStatus.findAllByLogoutTimeIsNullAndLoginTimeGreaterThan(start)
        def ctx = request.session.servletContext
        List serviceUserList = (List) ctx.getAttribute("serviceUserList");

        //def cc = SystemStatus.countByLogoutTimeIsNull()
        def cc = SystemStatus.countBySessionIdInList(serviceUserList)
        //def users = SystemStatus.findAllByLogoutTimeIsNull()
        def users = SystemStatus.findAllBySessionIdInList(serviceUserList)
        def usersStr = ""
        if (users.size() < 3) {
            users.each { e ->
                usersStr += "${e.userName},"
            }
        } else {
            usersStr = "${users[0].userName},${users[1].userName},${users[2].userName}..."
        }
        def result = [count: cc, usersStr: usersStr]
        if (request.xhr) {
            render(template: "onlineCount", model: result)
        } else {
            result
        }
    }

    def index() {
        def controllers = initService.checkSystemStatus()
        def fc = 0
        controllers.each { e ->
            //println("${e.statusKey}--")
            if (e.value) {
                fc++
            }
        }
        def pfc = Math.round(fc / controllers.size() * 100 * 100) / 100
        model:
        [controllers: controllers, pfc: pfc]
    }

    /*
    * 退出登录
    * */

    def logout() {
        def pscontext = request.session.servletContext
        // 登陆后--记录
        if (session.systemUser) {
            systemCommonService.updateSystemStatus(request, params)
        }
        if (session.systemUser) {
            println("${session.systemUser.userName}退出...")
            def logoutUser = session.systemUser.personName()
            session.invalidate()
            //redirect(uri: "/")
            println("拜拜...${logoutUser}")
            model:
            [logoutUser: logoutUser]
        } else {
            redirect(uri: "${createLink(uri: '/')}")
        }
    }

    /*
    * 登录
    * */

    def login() {
        String userName = params.userName;
        String p = params.password.encodeAsMD5()
        def systemUser = SystemUser.findByUserNameAndPassword(userName, p)
        if (systemUser) {
            //println("找到了：${systemUser}")
            session.layout = Caption.findByName("main").layout
            session.systemUser = systemUser
            session.userTitle = systemUser.personTitle()
            session.userName = systemUser.personName()
            systemCommonService.updateSystemStatus(request, params)
            redirect(uri: "/home")
            //redirect(uri: "/")
        } else {
            flash.message = "用户名或密码错误！"
            println("用户名或密码错误！")
            redirect(uri: "${createLink(uri: '/')}")
        }
    }

    /*
    * 显示登录界面
    * */

    def loginUI() {}

}
