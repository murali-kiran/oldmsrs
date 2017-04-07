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

import com.mrs.model.Dependent;

@Repository
public class DependentRepo {

	private static final Logger logger = Logger.getLogger(DependentRepo.class);

	@PersistenceContext
	private EntityManager entityManager;

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = DataAccessException.class)
	public void save(Dependent entity) {
		logger.info("saving Dependent instance");
		try {
			entityManager.persist(entity);
			logger.info("save successful");
		} catch (RuntimeException re) {
			logger.error("save failed", re);
			throw re;
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = DataAccessException.class)
	public void delete(Dependent entity) {
		logger.info("deleting Dependent instance");
		try {
			entity = entityManager.getReference(Dependent.class,
					entity.getDependentid());
			entityManager.remove(entity);
			logger.info("delete successful");
		} catch (RuntimeException re) {
			logger.error("delete failed", re);
			throw re;
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = DataAccessException.class)
	public Dependent update(Dependent entity) {
		logger.info("updating Dependent instance");
		try {
			Dependent result = entityManager.merge(entity);
			logger.info("update successful");
			return result;
		} catch (RuntimeException re) {
			logger.error("update failed", re);
			throw re;
		}
	}

	public Dependent findById(Integer id) {
		logger.info("finding Dependent instance with id: " + id);
		try {
			Dependent instance = entityManager.find(Dependent.class, id);
			return instance;
		} catch (RuntimeException re) {
			logger.error("find failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Dependent> findByProperty(String propertyName,
			final Object value, final int... rowStartIdxAndCount) {
		logger.info("finding Dependent instance with property: " + propertyName
				+ ", value: " + value);
		try {
						
			String queryString = "select model from Dependent model where model."
					+ propertyName + "= " + value;
			if(value.getClass().getName().equals("java.lang.String"))
				queryString = "select model from Dependent model where model."
						+ propertyName + "= '" + value+"'";
			Query query = entityManager
					.createQuery(queryString, Dependent.class);
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
	public List<Dependent> findAll(final int... rowStartIdxAndCount) {
		logger.info("finding all Dependent instances");
		try {
			final String queryString = "select model from Dependent model";
			Query query = entityManager
					.createQuery(queryString, Dependent.class);
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

