package main.dao;

import main.bean.Admin;

import java.util.List;

public interface AdminDao {
    public boolean insertAdmin(Admin admin);

    public List<Admin> getAdmin(String account);

}
