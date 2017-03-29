package com.mrs.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mrs.model.BenefitType;
import com.mrs.model.Emp;
import com.mrs.model.Incident;
import com.mrs.model.Nominee;
import com.mrs.model.OfficeLocation;
import com.mrs.service.HomeService;

@Controller
@RequestMapping(value="/rest")
public class HomeRestController {

	@Autowired
	HomeService homeService;
	
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
	@RequestMapping(value="/getAllBenefitType",method = RequestMethod.GET)
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
    }
    @RequestMapping(value="/createDependent",method = RequestMethod.POST, produces="application/json", consumes="application/json")
    public @ResponseBody Nominee createNominee(@RequestBody Nominee nominee) {
        return homeService.createNominee(nominee);
    }
}
