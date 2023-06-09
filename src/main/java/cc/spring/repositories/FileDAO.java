package cc.spring.repositories;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.FileDTO;

@Repository
public class FileDAO {
	
	@Autowired
	private SqlSessionTemplate db;
	
	public int insertShopImage(FileDTO dto) {
		return db.insert("insertShopImage", dto);
	}
	
}
