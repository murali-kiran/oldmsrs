package com.mrs.service;

import java.util.List;

import com.mrs.model.BenefitType;
import com.mrs.model.Emp;
import com.mrs.model.Incident;
import com.mrs.model.Nominee;
import com.mrs.model.OfficeLocation;

public interface HomeService {
	
	public List<Emp> getAllEmployees();
	public Emp getEmpById(Integer empid);
	public Emp createEmp(Emp emp);
	public List<Emp> getAllEmployeesByEmp(Emp emp);
	
	public Nominee createNominee(Nominee nominee);
	public Incident createIncident(Incident incident);
	
	public List<BenefitType> getAllBenefitType();
	public BenefitType getBenefitTypeById(Integer id);
	
	public List<OfficeLocation> getAllOfficeLocation();
	public OfficeLocation getOfficeLocationById(Integer id);
	List<Incident> getAllClaimsByEmp(Integer empid);
	public Object getAllDependentsByEmp(Integer empid);

}
