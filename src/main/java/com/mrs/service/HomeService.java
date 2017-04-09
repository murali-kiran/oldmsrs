package com.mrs.service;

import java.util.List;
import com.mrs.model.Claim;
import com.mrs.model.ClaimType;
import com.mrs.model.Dependent;
import com.mrs.model.Emp;
import com.mrs.model.Hospital;
import com.mrs.model.HospitalType;

public interface HomeService {
	
	public List<Emp> getAllEmployees();
	public Emp getEmpById(Integer empid);
	public Emp createEmp(Emp emp);
	public List<Emp> getAllEmployeesByEmp(Emp emp);
	public Hospital getHospitalById(Integer hospitalid);
	public Hospital createHospital(Hospital emp);
	public List<HospitalType> getAllHospitalTypes();
	public Dependent createDependent(Dependent dependent);
	public List<ClaimType> getAllClaimType();
	public List<Claim> getAllClaimsByEmp(Integer empid);
	public List<Dependent> getAllDependentsByEmp(Integer empid);
	public Claim createClaim(Claim claim);
	public Object getAllClaims();
	public Object getAllDependents();
	public Claim getClaimById(Integer claimid);
}
