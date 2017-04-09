package com.mrs.service;

import java.util.List;

import com.mrs.model.Dependent;
import com.mrs.model.Emp;
import com.mrs.model.Hospital;
import com.mrs.model.HospitalType;

public interface HomeService {
	
	public List<Emp> getAllEmployees();
	public Emp getEmpById(Integer empid);
	public Emp createEmp(Emp emp);
	public List<Emp> getAllEmployeesByEmp(Emp emp);
	public Dependent createNominee(Dependent dependent);
	public Hospital getHospitalById(Integer hospitalid);
	public Hospital createHospital(Hospital emp);
	public List<HospitalType> getAllHospitalTypes();
}
