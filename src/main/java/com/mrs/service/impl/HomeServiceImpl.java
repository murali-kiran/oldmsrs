package com.mrs.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrs.model.BenefitType;
import com.mrs.model.Emp;
import com.mrs.model.Incident;
import com.mrs.model.Nominee;
import com.mrs.model.OfficeLocation;
import com.mrs.repo.BenefitTypeRepo;
import com.mrs.repo.EmpRepo;
import com.mrs.repo.IncidentRepo;
import com.mrs.repo.NomineeRepo;
import com.mrs.repo.OfficeLocationRepo;
import com.mrs.service.HomeService;

@Service
public class HomeServiceImpl implements HomeService{

	Logger logger=LoggerFactory.getLogger(getClass());
	
	@Autowired
	EmpRepo empRepo;
	
	@Autowired
	BenefitTypeRepo benefitTypeRepo;
	
	@Autowired
	IncidentRepo incidentRepo;
	
	@Autowired
	NomineeRepo nomineeRepo;
	
	@Autowired
	OfficeLocationRepo officeLocationRepo;
	
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
	public Nominee createNominee(Nominee nominee) {
		logger.info("Saving Nominee "+nominee);
		nomineeRepo.save(nominee);
		return nominee;
	}

	@Override
	public Incident createIncident(Incident incident) {
		logger.info("Saving Incident "+incident);
		
		incident.setModifiedtime(new Date());
		incident.setOfficeLocation1(officeLocationRepo.findById(incident.getOfficeLocation1().getOfficelocationid()));
		incident.setOfficeLocation1(officeLocationRepo.findById(incident.getOfficeLocation2().getOfficelocationid()));
		incident.setBenefitType(benefitTypeRepo.findById(incident.getBenefitType().getBenefittypeid()));
		if(incident.getIncidentid()==0){
			incident.setCreatedtime(new Date());
			incidentRepo.save(incident);
		}else{
			incidentRepo.update(incident);
		}
			
		
		return incident;
	}

	@Override
	public List<BenefitType> getAllBenefitType() {
		return (List<BenefitType>)benefitTypeRepo.findAll();
	}

	@Override
	public BenefitType getBenefitTypeById(Integer id) {
		return benefitTypeRepo.findById(id);
	}

	@Override
	public List<OfficeLocation> getAllOfficeLocation() {
		return (List<OfficeLocation>)officeLocationRepo.findAll();
	}

	@Override
	public OfficeLocation getOfficeLocationById(Integer id) {
		return officeLocationRepo.findById(id);
	}
	@Override
	public List<Incident> getAllClaimsByEmp(Integer empid) {
		return (List<Incident>)incidentRepo.findByProperty("empid", empid, 1);
	}
	@Override
	public List<Nominee> getAllDependentsByEmp(Integer empid) {
		return (List<Nominee>)nomineeRepo.findByProperty("empid", empid, 1);
	}
}
