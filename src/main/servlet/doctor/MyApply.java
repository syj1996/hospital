package main.servlet.doctor;

import main.bean.Doctor;
import main.dao.ApplyDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet("/doctor/myApply")
public class MyApply extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String  action = req.getParameter("action") ;
        String  aid = req.getParameter("aid") ;
        ApplyDao applyDao=new ApplyDao();
        if("cancel".equals(action)){
            String set="set state='取消' where aid=?";
            applyDao.update(set,new Object[]{aid});
        }
        Doctor doctor = (Doctor) req.getSession().getAttribute("doctor");

        String where=" where apply.wid=workday.wid and apply.did=? order by applytime desc";
        ArrayList<HashMap<String, String>> maps = applyDao.query(where, new Object[]{doctor.getDid()});

        req.setAttribute("maps",maps);
        req.getRequestDispatcher("myApply.jsp").forward(req,resp);
    }
}
