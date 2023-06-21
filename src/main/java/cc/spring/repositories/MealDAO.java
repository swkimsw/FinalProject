package cc.spring.repositories;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.MealDTO;

@Repository
public class MealDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertMeal(MealDTO dto) {
		return mybatis.insert("Meal.insertMeal", dto);
	}

}
