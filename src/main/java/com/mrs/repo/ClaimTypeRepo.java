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

import com.mrs.model.ClaimType;

@Repository
public class ClaimTypeRepo {

	private static final Logger logger = Logger.getLogger(ClaimTypeRepo.class);

	@PersistenceContext
	private EntityManager entityManager;

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = DataAccessException.class)
	public void save(ClaimType entity) {
		logger.info("saving ClaimType instance");
		try {
			entityManager.persist(entity);
			logger.info("save successful");
		} catch (RuntimeException re) {
			logger.error("save failed", re);
			throw re;
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = DataAccessException.class)
	public void delete(ClaimType entity) {
		logger.info("deleting ClaimType instance");
		try {
			entity = entityManager.getReference(ClaimType.class,
					entity.getClaimtypeid());
			entityManager.remove(entity);
			logger.info("delete successful");
		} catch (RuntimeException re) {
			logger.error("delete failed", re);
			throw re;
		}
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = DataAccessException.class)
	public ClaimType update(ClaimType entity) {
		logger.info("updating ClaimType instance");
		try {
			ClaimType result = entityManager.merge(entity);
			logger.info("update successful");
			return result;
		} catch (RuntimeException re) {
			logger.error("update failed", re);
			throw re;
		}
	}

	public ClaimType findById(Integer id) {
		logger.info("finding ClaimType instance with id: " + id);
		try {
			ClaimType instance = entityManager.find(ClaimType.class, id);
			return instance;
		} catch (RuntimeException re) {
			logger.error("find failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<ClaimType> findByProperty(String propertyName,
			final Object value, final int... rowStartIdxAndCount) {
		logger.info("finding ClaimType instance with property: " + propertyName
				+ ", value: " + value);
		try {
						
			String queryString = "select model from ClaimType model where model."
					+ propertyName + "= " + value;
			if(value.getClass().getName().equals("java.lang.String"))
				queryString = "select model from ClaimType model where model."
						+ propertyName + "= '" + value+"'";
			Query query = entityManager
					.createQuery(queryString, ClaimType.class);
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
	public List<ClaimType> findAll(final int... rowStartIdxAndCount) {
		logger.info("finding all ClaimType instances");
		try {
			final String queryString = "select model from ClaimType model";
			Query query = entityManager
					.createQuery(queryString, ClaimType.class);
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

