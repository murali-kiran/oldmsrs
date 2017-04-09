package com.mrs.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrs.model.Dependent;
import com.mrs.model.Emp;
import com.mrs.model.Hospital;
import com.mrs.model.HospitalType;
import com.mrs.repo.AppointmentRepo;
import com.mrs.repo.AppointmentTypeRepo;
import com.mrs.repo.ClaimRepo;
import com.mrs.repo.ClaimTypeRepo;
import com.mrs.repo.EmpRepo;
import com.mrs.repo.HospitalRepo;
import com.mrs.repo.HospitalTypeRepo;
import com.mrs.service.HomeService;

@Service
public class HomeServiceImpl implements HomeService{

	Logger logger=LoggerFactory.getLogger(getClass());
	
	@Autowired
	EmpRepo empRepo;
	
	@Autowired
	AppointmentTypeRepo benefitTypeRepo;
	
	@Autowired
	AppointmentRepo incidentRepo;
	
	@Autowired
	ClaimRepo claimRepo;
	
	@Autowired
	ClaimTypeRepo officeLocationRepo;
	
	@Autowired
	HospitalRepo hospitalRepo;
	
	@Autowired
	HospitalTypeRepo hospitalTypeRepo;
	
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
	public Dependent createNominee(Dependent dependent) {
		// TODO Auto-generated method stub
		return null;
	}
	public Hospital getHospitalById(Integer hospitalid){
		return hospitalRepo.findById(hospitalid);
	}
	public Hospital createHospital(Hospital hospital){
		logger.info("Saving Hospital "+hospital);
		if(hospital.getHospitalid()==0){
			hospital.setCreatedtime(new Date());
		}
		hospital.setModifiedtime(new Date());
		hospitalRepo.save(hospital);
		return  hospital;
	}
	public List<HospitalType> getAllHospitalTypes(){
		return hospitalTypeRepo.findAll();
	}
}
