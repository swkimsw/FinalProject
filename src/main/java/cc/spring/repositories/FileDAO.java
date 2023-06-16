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
	
	public int updateShopImage(FileDTO dto) {
		// 이미지 업데이트 - 입력된 이미지 삭제 후 다시 입력
		db.delete("deleteShopImage", dto);
		return db.insert("insertShopImage", dto);
	}

	public int insertReviewImage(ReviewImgDTO dto) {
		return db.insert("File.insertReviewImage", dto);
	}

	

	
	
}
