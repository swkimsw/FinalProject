package cc.spring.repositories;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.FileDTO;
import cc.spring.dto.ReviewImgDTO;

@Repository
public class FileDAO {
	
	@Autowired
	private SqlSessionTemplate db;
	
	public int insertShopImage(FileDTO dto) {
		return db.insert("insertShopImage", dto);
	}
	
	public List<FileDTO> selectShopImg(int code) {
		return db.selectList("selectShopImg", code);
	}

	public int insertReviewImage(ReviewImgDTO dto) {
		return db.insert("File.insertReviewImage", dto);
	}

	

	
	
}
