package com.app.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.pojos.Employee;
import com.app.pojos.Shops;

@Repository
@Transactional
public class EmployeeDaoImpl implements EmployeeDao {
	
	
	@Autowired
	private EntityManager mgr;
	
	@Override
	public List<Employee> getEmployees() {
		String jpql1 = "select e from Employee e";
		List<Employee> elist=new ArrayList<Employee>();
		elist=mgr.createQuery(jpql1,Employee.class).getResultList();
		
		return elist;
	}
	
//	@Override
//	public List<Employee> getEmployees(String shopName) {
//		String jpql1 = "select e from Employee e where e.salonName=:shopName";
//		List<Employee> elist=new ArrayList<Employee>();
//		elist=mgr.createQuery(jpql1,Employee.class).setParameter("shopName",shopName).getResultList();
//		
//		return elist;
//	}

//	@Override
//	public List<Employee> getEmployeeList(String shopName) {
//		Shops e=getShopByshopName(shopName);
//		String jpql4 = "select e from Employee e where e.salonName=:shopName";
//		List<Employee> elist=new ArrayList<Employee>();
//		elist=mgr.createQuery(jpql4,Employee.class).setParameter("sid",shopName).getResultList();
//		return elist;
//		
//	}
//
//	private Shops getShopByshopName(String shName) {
//	String jpql5="select s from Shops s where shopName=:shName";
// 	return mgr.createQuery(jpql5, Shops.class).setParameter("shName",shName).getSingleResult();
//    }

	


	@Override
	public String addNewEmployee(Employee e) {
		mgr.persist(e);
		return "Employee registered successfully : ID "+e.getEmpId();
	}

	@Override
	public String removeEmployee(int empId) {
		Employee e = mgr.find(Employee.class, empId);
		if (e != null) {
			mgr.remove(e);
		
			return "employee deleted with ID " + e.getEmpId();
		}
		return "employee deletion failed Invalid employee ID";
	}

	@Override
	public String updateEmployee(Employee e) {
		
		mgr.merge(e);
		return "employee Updated successfully : ID "+e.getEmpId();
	}

	@Override
	public Employee getEmployeeByEmpId(int empId) {
		String jpql2="select e from Employee e where e.empId=:empId";
		return mgr.createQuery(jpql2,Employee.class).setParameter("empId",empId).getSingleResult();
	}

	

	

}
