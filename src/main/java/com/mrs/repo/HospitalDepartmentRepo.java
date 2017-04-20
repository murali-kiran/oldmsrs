package com.mrs.repo;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mrs.model.HospitalDepartment;

@Repository
public class HospitalDepartmentRepo {

	private static final Logger logger = Logger.getLogger(HospitalDepartmentRepo.class);

	@PersistenceContext
	private EntityManager entityManager;

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = DataAccessException.class)
	public void save(HospitalDepartment entity) {
		logger.info("saving HospitalDepartment instance");
		try {
			entityManager.persist(entity);
			logger.info("save successful");
		} catch (RuntimeException re) {
			logger.error("save failed", re);
			throw re;
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = DataAccessException.class)
	public void delete(HospitalDepartment entity) {
		logger.info("deleting HospitalDepartment instance");
		try {
			entity = entityManager.getReference(HospitalDepartment.class,
					entity.getHospitaldepartmentid());
			entityManager.remove(entity);
			logger.info("delete successful");
		} catch (RuntimeException re) {
			logger.error("delete failed", re);
			throw re;
		}
	}
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = DataAccessException.class)
	public void deleteByHospital(int hospitalId) {
		logger.info("deleting HospitalDepartment instance");
		try {
			String queryString = "delete from HospitalDepartment model where model.hospitalid="+hospitalId;
			Query query = entityManager
					.createQuery(queryString);
			query.executeUpdate();
			logger.info("delete successful");
		} catch (RuntimeException re) {
			logger.error("delete failed", re);
			throw re;
		}
	}
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = DataAccessException.class)
	public HospitalDepartment update(HospitalDepartment entity) {
		logger.info("updating HospitalDepartment instance");
		try {
			HospitalDepartment result = entityManager.merge(entity);
			logger.info("update successful");
			return result;
		} catch (RuntimeException re) {
			logger.error("update failed", re);
			throw re;
		}
	}

	public HospitalDepartment findById(Integer id) {
		logger.info("finding HospitalDepartment instance with id: " + id);
		try {
			HospitalDepartment instance = entityManager.find(HospitalDepartment.class, id);
			return instance;
		} catch (RuntimeException re) {
			logger.error("find failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<HospitalDepartment> findByProperty(String propertyName,
			final Object value, final int... rowStartIdxAndCount) {
		logger.info("finding HospitalDepartment instance with property: " + propertyName
				+ ", value: " + value);
		try {
						
			String queryString = "select model from HospitalDepartment model where model."
					+ propertyName + "= " + value;
			if(value.getClass().getName().equals("java.lang.String"))
				queryString = "select model from HospitalDepartment model where model."
						+ propertyName + "= '" + value+"'";
			Query query = entityManager
					.createQuery(queryString, HospitalDepartment.class);
			if (rowStartIdxAndCount != null && rowStartIdxAndCount.length > 0) {
				int rowStartIdx = Math.max(0, rowStartIdxAndCount[0]);
				if (rowStartIdx > 0) {
					query.setFirstResult(rowStartIdx);
				}

				if (rowStartIdxAndCount.length > 1) {
					int rowCount = Math.max(0, rowStartIdxAndCount[1]);
					if (rowCount > 0) {
						query.setMaxResults(rowCount);
					}
				}
			}
			return query.getResultList();
		} catch (RuntimeException re) {
			logger.error("find by property name failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<HospitalDepartment> findAll(final int... rowStartIdxAndCount) {
		logger.info("finding all HospitalDepartment instances");
		try {
			final String queryString = "select model from HospitalDepartment model";
			Query query = entityManager
					.createQuery(queryString, HospitalDepartment.class);
			if (rowStartIdxAndCount != null && rowStartIdxAndCount.length > 0) {
				int rowStartIdx = Math.max(0, rowStartIdxAndCount[0]);
				if (rowStartIdx > 0) {
					query.setFirstResult(rowStartIdx);
				}

				if (rowStartIdxAndCount.length > 1) {
					int rowCount = Math.max(0, rowStartIdxAndCount[1]);
					if (rowCount > 0) {
						query.setMaxResults(rowCount);
					}
				}
			}
			return query.getResultList();
		} catch (RuntimeException re) {
			logger.error("find all failed", re);
			throw re;
		}
	}
}

