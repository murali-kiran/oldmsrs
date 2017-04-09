package com.mrs.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mrs.model.Appointment;
import com.mrs.model.Claim;
import com.mrs.model.Dependent;
import com.mrs.model.Emp;
import com.mrs.model.Hospital;
import com.mrs.service.HomeService;

@Controller
@RequestMapping(value="/home")
public class HomeController {
	@Autowired
	HomeService homeService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/index.html")
    String all(Model model) {
        model.addAttribute("emps", homeService.getAllEmployees());
        return "index";
    }
	@RequestMapping(method = RequestMethod.GET, value = "/searchEmp")
    String showSearch(Model model) {
		model.addAttribute("emp", new Emp());
		model.addAttribute("emps", new ArrayList<Emp>());
        return "searchEmp";
    } 
	@RequestMapping(method = RequestMethod.POST, value = "/searchEmp")
    String getSearch(@ModelAttribute Emp emp, BindingResult bindingresult, Model model) {
		model.addAttribute("emps", homeService.getAllEmployeesByEmp(emp));
        return "searchEmp";
    }
	@RequestMapping(value="/viewEmp",method = RequestMethod.GET)
    public String getEmp(@RequestParam(value="empid",required=true) Integer empid, Model model) {
		model.addAttribute("emp", homeService.getEmpById(empid));
		model.addAttribute("benifitTypes", homeService.getAllClaimType());
	//	model.addAttribute("claims", homeService.getAllClaimsByEmp(empid));
	//	model.addAttribute("dependents", homeService.getAllDependentsByEmp(empid));
		model.addAttribute("claims", homeService.getAllClaims());
		model.addAttribute("dependents", homeService.getAllDependents());
		model.addAttribute("incident", new Claim());
		model.addAttribute("dependent", new Dependent());
		return "viewEmp";
    }
	@RequestMapping(method = RequestMethod.GET, value = "/empList")
    String getEmpList(@ModelAttribute Emp emp, BindingResult bindingresult, Model model) {
		model.addAttribute("emps", homeService.getAllEmployees());
		model.addAttribute("emp", null);
        return "searchEmp";
    }
	@RequestMapping(method = RequestMethod.GET, value = "/createEmp")
    String createEmpForm(@RequestParam(value = "empid", required = false) Integer empid,Model model) {
		Emp emp = null;
		if(empid!=null)
			emp=homeService.getEmpById(empid);
        model.addAttribute("emp",  emp == null ? new Emp() : emp);
        return "createEmp";
    }
	@RequestMapping(method = RequestMethod.POST, value = "/createEmp")
    String createEmpSubmit(@ModelAttribute Emp emp,BindingResult bindingResult) {
		homeService.createEmp(emp);
		return "redirect:/home/searchEmp";
    }
		
	@RequestMapping(method = RequestMethod.GET, value = "/createHospital")
    String createHospitalForm(@RequestParam(value = "hospitalid", required = false) Integer hospitalid,Model model) {
		Hospital hospital = null;
		if(hospitalid!=null)
			hospital=homeService.getHospitalById(hospitalid);
        model.addAttribute("hospital",  hospital == null ? new Hospital() : hospital);
        model.addAttribute("hospitaltypes",  homeService.getAllHospitalTypes());
        return "createHospital";
    }
	@RequestMapping(method = RequestMethod.POST, value = "/createHospital")
    String createHospitalSubmit(@ModelAttribute Hospital hospital,BindingResult bindingResult) {
		homeService.createHospital(hospital);
		return "redirect:/home/searchHospital";
    }
	
	
	@RequestMapping(method = RequestMethod.GET, value = "/viewClaim")
    String viewClaim(@RequestParam(value = "claimid", required = false) Integer claimid, Model model) {
		Claim claim = null;
		if(claimid!=null)
			claim=homeService.getClaimById(claimid);
        model.addAttribute("claim",  claim == null ? new Claim() : claim);
        model.addAttribute("claimTypes", homeService.getAllClaimType());
        model.addAttribute("appointment", new Appointment());
        model.addAttribute("appointments", null);
        return "viewClaim";
    }
	@RequestMapping(method = RequestMethod.POST, value = "/createClaim")
    String createCreateSubmit(@ModelAttribute Claim claim,BindingResult bindingResult) {
		homeService.createClaim(claim);
		return "redirect:/home/viewClaim?claimid="+claim.getClaimid();
    }
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    CustomDateEditor editor = new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true);
	    binder.registerCustomEditor(Date.class, editor);
	}
}
