package com.mrs.service;

import java.util.List;

import com.mrs.model.Claim;
import com.mrs.model.Dependent;
import com.mrs.model.Emp;

public interface HomeService {
	
	public List<Emp> getAllEmployees();
	public Emp getEmpById(Integer empid);
	public Emp createEmp(Emp emp);
	public List<Emp> getAllEmployeesByEmp(Emp emp);
	public Dependent createNominee(Dependent dependent);

}
