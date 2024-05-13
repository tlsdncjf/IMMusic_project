package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Press;

@Mapper
public interface PressRepository {

	@Insert("""
			INSERT INTO
			press SET
			regDate = NOW(),
			updateDate = NOW(),
			title = #{title},
			`body` = #{body}
			""")
	public void writePress(String title, String body);

	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

	@Select("""
			SELECT *
			FROM press
			WHERE id = #{id}
			""")
	public Press getPress(int id);

	@Select("""
			SELECT *
			FROM press AS P
			WHERE P.id = #{id}
			""")
	public Press getForPrintPress(int id);
	
//	@Select("""
//			SELECT id, title, `body`
//			FROM press
//			""")
//	public List<Press> getAllPrintPress();

	@Delete("DELETE FROM press WHERE id = #{id}")
	public void deletePress(int id);

	@Update("""
			UPDATE press
			SET title = #{title},
			`body` = #{body},
			updateDate = NOW()
			WHERE id = #{id}
				""")
	public void modifyPress(int id, String title, String body);

	@Select("""
			SELECT P.*
			FROM press AS P
			ORDER BY P.id DESC
			""")
	public List<Press> getPresses();

	@Select("""
			<script>
			SELECT P.*
			FROM press AS P
			WHERE 1
			<if test="searchKeyword != ''">
				<choose>
					<when test = "searchKeywordTypeCode == 'title'">
						AND P.title LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test="searchKeywordTypeCode == 'body'">
						AND P.`body` LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					</choose>
			</if>
			GROUP BY P.id
			ORDER BY P.id DESC
			<if test="limitFrom >= 0 ">
				LIMIT #{limitFrom}, #{limitTake}
			</if>

			</script>
			""")
	public List<Press> getForPrintPresses(int limitFrom, int limitTake, String searchKeywordTypeCode,
			String searchKeyword);

	@Select("""
			<script>
			SELECT COUNT(*) AS cnt
			FROM press AS P
			WHERE 1
			<if test="searchKeyword != ''">
				<choose>
					<when test="searchKeywordTypeCode == 'title'">
						AND P.title LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test="searchKeywordTypeCode == 'body'">
						AND P.body LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
				</choose>
			</if>
			ORDER BY P.id DESC
			</script>
			""")
	public int getPressesCount(String searchKeywordTypeCode, String searchKeyword);

	@Update("""
			UPDATE press
			SET	hitCount = hitCount + 1
			WHERE id = #{id}
			""")
	public int increaseHitCount(int id);

	@Select("""
			SELECT hitCount
			FROM press
			WHERE id = #{id}
			""")
	public int getPressHitCount(int id);

	@Update("""
			UPDATE press
			SET goodReactionPoint = goodReactionPoint + 1
			WHERE id = #{relId}
			""")
	public int increaseGoodReactionPoint(int relId);

	@Update("""
			UPDATE press
			SET goodReactionPoint = goodReactionPoint - 1
			WHERE id = #{relId}
			""")
	public int decreaseGoodReactionPoint(int relId);

	@Update("""
			UPDATE press
			SET badReactionPoint = badReactionPoint + 1
			WHERE id = #{relId}
			""")
	public int increaseBadReactionPoint(int relId);

	@Update("""
			UPDATE press
			SET badReactionPoint = badReactionPoint - 1
			WHERE id = #{relId}
			""")
	public int decreaseBadReactionPoint(int relId);

	@Select("""
			SELECT goodReactionPoint
			FROM press
			WHERE id = #{relId}
			""")
	public int getGoodRP(int relId);

	@Select("""
			SELECT badReactionPoint
			FROM press
			WHERE id = #{relId}
			""")
	public int getBadRP(int relId);
	
	@Select("""
			SELECT MAX(id) + 1
			FROM press
			""")
	public int getCurrentPressId();
}
