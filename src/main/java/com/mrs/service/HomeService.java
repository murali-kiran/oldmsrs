package com.mrs.service;

import java.util.List;

import com.mrs.model.Appointment;
import com.mrs.model.Claim;
import com.mrs.model.ClaimType;
import com.mrs.model.Dependent;
import com.mrs.model.Emp;

public interface HomeService {
	
	public List<Emp> getAllEmployees();
	public Emp getEmpById(Integer empid);
	public Emp createEmp(Emp emp);
	public List<Emp> getAllEmployeesByEmp(Emp emp);
	public Dependent createDependent(Dependent dependent);
	public List<ClaimType> getAllClaimType();
	public List<Claim> getAllClaimsByEmp(Integer empid);
	public List<Dependent> getAllDependentsByEmp(Integer empid);
	public Claim createClaim(Claim claim);
	public List<Claim> getAllClaims();
	public List<Dependent> getAllDependents();
	public Claim getClaimById(Integer claimid);
	public List<Appointment> getAllAppointmentsByClaim(Integer claimid);
	public Appointment createAppointment(Appointment app);

}
