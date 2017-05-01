package com.mrs.service.impl;

import java.net.URI;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.mrs.model.Appointment;
import com.mrs.model.Claim;
import com.mrs.model.ClaimType;
import com.mrs.model.Dependent;
import com.mrs.model.Emp;
import com.mrs.model.Hospital;
import com.mrs.model.HospitalAccount;
import com.mrs.model.HospitalAppoinmentBean;
import com.mrs.model.HospitalDepartment;
import com.mrs.model.HospitalType;
import com.mrs.repo.AppointmentRepo;
import com.mrs.repo.AppointmentTypeRepo;
import com.mrs.repo.ClaimRepo;
import com.mrs.repo.ClaimTypeRepo;
import com.mrs.repo.DependentRepo;
import com.mrs.repo.EmpRepo;
import com.mrs.repo.HospitalAccountRepo;
import com.mrs.repo.HospitalDepartmentRepo;
import com.mrs.repo.HospitalRepo;
import com.mrs.repo.HospitalTypeRepo;
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
	
	@Autowired
	HospitalRepo hospitalRepo;
	
	@Autowired
	HospitalTypeRepo hospitalTypeRepo;
	
	@Autowired
	HospitalAccountRepo hospitalAccountRepo;

	@Autowired
	HospitalDepartmentRepo hospitalDepartmentRepo;
	
	@Override
	public List<Emp> getAllEmployees() {
		return (List<Emp>) empRepo.findAll();
	}

	@Override
	public List<Emp> getAllEmployeesByEmp(Emp emp) {
		logger.info("find Employees by "+emp);
		return (List<Emp>) empRepo.findAllByEmp(emp);
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
	public Hospital getHospitalById(Integer hospitalid){
		Hospital instance = hospitalRepo.findById(hospitalid);
		String str = "";
		List<HospitalDepartment> hdps = hospitalDepartmentRepo.findByProperty("hospitalid", hospitalid);
		for (HospitalDepartment hospitalDepartment : hdps) {
			if(str.equals(""))
				str = str + hospitalDepartment.getDepartment();
			else
				str = str +","+ hospitalDepartment.getDepartment();
		}
		instance.setHospitalDeptString(str);
		return instance;
	}
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = DataAccessException.class)
	public Hospital createHospital(Hospital hospital){
		logger.info("Saving Hospital "+hospital);
		List<String> items = Arrays.asList(hospital.getHospitalDeptString().split("\\s*,\\s*"));
		List<HospitalDepartment> hdlist = new ArrayList<HospitalDepartment>(); 
		
		hospital.setHospitalDepartments(hdlist);
		if(hospital.getHospitalid()==0){
			hospital.setCreatedtime(new Date());
			hospital.setModifiedtime(new Date());
			hospitalRepo.save(hospital);
		}else {
			hospital.setModifiedtime(new Date());
			hospitalRepo.update(hospital);
		}
		int hospid = hospital.getHospitalid();
		hospitalDepartmentRepo.deleteByHospital(hospid);
		for (String string : items) {
			HospitalDepartment hd = new HospitalDepartment();
			hd.setCreatedtime(new Date());
			hd.setDepartment(string);
			hd.setHospitalid(hospid);
			hospitalDepartmentRepo.save(hd);
			//hdlist.add(hd);
		}
		
		
		return  hospital;
	}
	public List<Hospital> getAllHospitals(){
		List<Hospital> list= hospitalRepo.findAll();
		for(Hospital hospital:list){
			hospital.setHospitalAccounts(getAllHospitalAccountsByHospitalid(hospital.getHospitalid()));
			hospital.setHospitalDepartments(getAllHospitalDepartmentsByHospitalid(hospital.getHospitalid()));
		}
		return list;
	}
	public List<HospitalAccount> getAllHospitalAccountsByHospitalid(int hospitalid){
		return hospitalAccountRepo.findByProperty("hospitalid", hospitalid);
	}
	public List<HospitalDepartment> getAllHospitalDepartmentsByHospitalid(int hospitalid){
		return hospitalDepartmentRepo.findByProperty("hospitalid", hospitalid);
	}
	public List<HospitalType> getAllHospitalTypes(){
		return hospitalTypeRepo.findAll();
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
	public List<Claim> getAllClaims() {
		// TODO Auto-generated method stub
		return (List<Claim>)claimRepo.findAll();
	}

	@Override
	public List<Dependent> getAllDependents() {
		// TODO Auto-generated method stub
		return (List<Dependent>)dependentRepo.findAll();
	}

	@Override
	public Claim getClaimById(Integer claimid) {
		// TODO Auto-generated method stub
		return claimRepo.findById(claimid);
	}
	@Override
	public List<Appointment> getAllAppointmentsByClaim(Integer claimid) {
		// TODO Auto-generated method stub
		return appointmentRepo.findByProperty("claimid", claimid);
	}

	@Override
	public Appointment createAppointment(Appointment app,HttpServletRequest request) {
		// TODO Auto-generated method stub
		logger.info("Saving Claim "+app);
		if(app.getAppointmentid()==0){
			app.setCreatedtime(new Date());
			appointmentRepo.save(app);
			if(app.getHospitaltype() ==1) {
				try {
					logger.info("Hospital type is external going to hit practo api");
					HospitalAppoinmentBean appoinmentBean = new  HospitalAppoinmentBean();
					appoinmentBean.setAppointmentDate(app.getAppointmentdate());
					appoinmentBean.setHospitalCode(app.getHospitalid()+"");
					appoinmentBean.setDeptName(app.getDepartment());
					Emp emp =empRepo.findById(app.getEmpid());
					appoinmentBean.setEmpName(emp.getFirstname() + " " + emp.getLastname());
					appoinmentBean.setDocterName(app.getDoctorname());
					apiCall(request, appoinmentBean);
				} catch (Exception e) {
					logger.warn("Error",e);
				}
			}
		}else {
			app.setModifiedtime(new Date());
			appointmentRepo.update(app);
		}
		return app;
	}

	@Override
	public List<HospitalAccount> getAccountsByHospital(Integer hospitalid) {
		// TODO Auto-generated method stub
		return hospitalAccountRepo.findByProperty("hospitalid", hospitalid);
	}

	@Override
	public HospitalAccount getHospitalAccById(Integer hospaccid) {
		// TODO Auto-generated method stub
		return hospitalAccountRepo.findById(hospaccid);
	}

	@Override
	public HospitalAccount createHospitalAccount(HospitalAccount hospitalacc) {
		// TODO Auto-generated method stub
		if(hospitalacc.getHospitalaccountid()==0){
			hospitalacc.setCreatedtime(new Date());
			hospitalAccountRepo.save(hospitalacc);
		}else {
			hospitalacc.setModifiedtime(new Date());
			hospitalAccountRepo.update(hospitalacc);
		}
		return hospitalacc;
	}
	
	public void apiCall(HttpServletRequest request,HospitalAppoinmentBean appoinmentBean) throws Exception{
		RestTemplate rt = new RestTemplate();
        String[] tokens= request.getRequestURL().toString().split(request.getContextPath());
        String s = tokens[0] + request.getContextPath() + "/rest/practoAPI";
        String responce = rt.postForObject(new URI(s ), appoinmentBean,String.class);
        
        logger.info("Got Responce : " + responce);

	}
	
	
}
