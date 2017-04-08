package com.mrs.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mrs.model.Claim;
import com.mrs.model.ClaimType;
import com.mrs.model.Dependent;
import com.mrs.model.Emp;
import com.mrs.repo.AppointmentRepo;
import com.mrs.repo.AppointmentTypeRepo;
import com.mrs.repo.ClaimRepo;
import com.mrs.repo.ClaimTypeRepo;
import com.mrs.repo.DependentRepo;
import com.mrs.repo.EmpRepo;
import com.mrs.service.HomeService;

@Service
public class HomeServiceImpl implements HomeService{

	Logger logger=LoggerFactory.getLogger(getClass());
	
	@Autowired
	EmpRepo empRepo;
	
	@Autowired
	DependentRepo dependentRepo;
	
	@Autowired
	AppointmentRepo appointmentRepo;
	
	@Autowired
	AppointmentTypeRepo appointmentTypeRepo;
	
	@Autowired
	ClaimRepo claimRepo;
	
	@Autowired
	ClaimTypeRepo claimTypeRepo;
	
	@Override
	public List<Emp> getAllEmployees() {
		return (List<Emp>) empRepo.findAll();
	}

	@Override
	public List<Emp> getAllEmployeesByEmp(Emp emp) {
		logger.info("find Employees by "+emp);
		return (List<Emp>) empRepo.findAll();
	}
	@Override
	public Emp getEmpById(Integer empid) {
		logger.info("find Employees by empid : "+empid);
		return empRepo.findById(empid);
	}

	@Override
	public Emp createEmp(Emp emp) {
		logger.info("Saving Employee "+emp);
		if(emp.getEmpid()==0){
			emp.setCreatedtime(new Date());
		}
		emp.setModifiedtime(new Date());
		empRepo.save(emp);
		return  emp;
	}

	@Override
	public Dependent createDependent(Dependent dependent) {
		// TODO Auto-generated method stub
		logger.info("Saving Dependent "+dependent);
		if(dependent.getDependentid()==0){
			dependent.setCreatedtime(new Date());
			dependentRepo.save(dependent);
		}else{
		dependent.setModifiedtime( new Date());
		dependentRepo.update(dependent);
		}
		return null;
	}

	@Override
	public Claim createClaim(Claim claim) {
		logger.info("Saving Claim "+claim);
		
		if(claim.getClaimid()==0){
			claim.setCreatedtime(new Date());
			claimRepo.save(claim);
		}else {
		claim.setModifiedtime(new Date());
			claimRepo.update(claim);
		}
		return claim;
	}
	
	@Override
	public List<ClaimType> getAllClaimType() {
		// TODO Auto-generated method stub
		return (List<ClaimType>)claimTypeRepo.findAll();
	}

	@Override
	public List<Claim> getAllClaimsByEmp(Integer empid) {
		// TODO Auto-generated method stub
		return (List<Claim>)claimRepo.findByProperty("emp", empid);
	}

	@Override
	public List<Dependent> getAllDependentsByEmp(Integer empid) {
		// TODO Auto-generated method stub
		return (List<Dependent>)dependentRepo.findByProperty("emp", empid) ;
	}

	@Override
	public Object getAllClaims() {
		// TODO Auto-generated method stub
		return (List<Claim>)claimRepo.findAll();
	}

	@Override
	public Object getAllDependents() {
		// TODO Auto-generated method stub
		return (List<Dependent>)dependentRepo.findAll();
	}

	@Override
	public Claim getClaimById(Integer claimid) {
		// TODO Auto-generated method stub
		return claimRepo.findById(claimid);
	}
	
}
