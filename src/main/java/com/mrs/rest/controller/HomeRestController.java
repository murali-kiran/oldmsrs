package com.mrs.rest.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mrs.model.Dependent;
import com.mrs.model.Emp;
import com.mrs.model.HospitalAppoinmentBean;
import com.mrs.service.HomeService;
import com.mrs.util.ApplicationProperties;

@Controller
@RequestMapping(value="/rest")
public class HomeRestController {

	@Autowired
	HomeService homeService;
	
	@Autowired
	ApplicationProperties applicaitionProperties;
	
	Logger logger=LoggerFactory.getLogger(getClass());
	
	Logger practoAPI=LoggerFactory.getLogger("practoAPI");
	/*@RequestMapping(value="/all",method = RequestMethod.GET)
    public List<Emp> all(Pageable pageable) {
        return (List<Emp>) homeService.getAllEmployees(pageable);
    }
	@RequestMapping(value="/getEmps",method = RequestMethod.POST)
    public List<Emp> getEmps(@RequestBody Emp emp,Pageable pageable ) {
     //   return homeService.getAllEmployeesByEmp(emp);
		 return (List<Emp>) homeService.getAllEmployees(pageable);
    }*/
	@RequestMapping(value="/createEmp",method = RequestMethod.POST)
    public Emp createEmp(@RequestBody Emp emp) {
        return homeService.createEmp(emp);
    }
	@RequestMapping(value="/getEmp",method = RequestMethod.GET)
    public Emp getEmp(@RequestParam(value="empid",required=true) Integer empid) {
        return homeService.getEmpById(empid);
    }
	/*@RequestMapping(value="/getAllBenefitType",method = RequestMethod.GET)
    public @ResponseBody List<BenefitType> getAllBenefitType() {
        return homeService.getAllBenefitType();
    }
	@RequestMapping(value="/getBenefitType",method = RequestMethod.GET)
    public @ResponseBody BenefitType getBenefitType(@RequestParam(value="id",required=true) Integer id) {
        return homeService.getBenefitTypeById(id);
    }
	@RequestMapping(value="/getAllOfficeLocation",method = RequestMethod.GET)
    public List<OfficeLocation> getAllOfficeLocation() {
        return homeService.getAllOfficeLocation();
    }
	@RequestMapping(value="/getOfficeLocation",method = RequestMethod.GET)
    public @ResponseBody OfficeLocation getOfficeLocation(@RequestParam(value="id",required=true) Integer id) {
        return homeService.getOfficeLocationById(id);
    }
	@RequestMapping(value="/createIncident",method = RequestMethod.POST, produces="application/json", consumes="application/json")
    public @ResponseBody Incident createIncident(@RequestBody Incident incident) {
        return homeService.createIncident(incident);
    }*/
    @RequestMapping(value="/createDependent",method = RequestMethod.POST, produces="application/json", consumes="application/json")
    public @ResponseBody Dependent createDependent(@RequestBody Dependent dependent) {
        return homeService.createDependent(dependent);
    }
    
    @RequestMapping(value="/practoAPI",method = RequestMethod.POST, consumes="application/json")
    public @ResponseBody String practoAPI(@RequestBody HospitalAppoinmentBean hospitalAppoinmentBean) {
    	
    	if(applicaitionProperties.getHospitalCodes().contains(hospitalAppoinmentBean.getHospitalCode()))
    	{
    		practoAPI.info("Hospital Found and Successfully created appointment for "+hospitalAppoinmentBean.toString());
    		return "success";
    	}
    	practoAPI.info("Hospital Not Found and Failed to creat appointment for "+hospitalAppoinmentBean.toString());
		return "failure";
    }
}
