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
			memberId = #{memberId},
			title = #{title},
			`body` = #{body},
			boardId = #{boardId}
			""")
	public void writePress(String title, String body, int memberId, int boardId);

	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

	@Select("""
			SELECT *
			FROM press
			WHERE id = #{id}
			""")
	public Press getPress(int id);

	@Select("""
			SELECT A.*, M.nickname AS extra__writer, B.code AS board_code
			FROM press AS A
			INNER JOIN `member` AS M
			ON A.memberId = M.id
			INNER JOIN board AS B
			ON A.boardId = B.id
			GROUP BY A.id
			HAVING A.id = #{id}
			""")
	public Press getForPrintPress(int id);

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
			SELECT A.*, M.nickname AS extra__writer
			FROM press AS A
			INNER JOIN `member` AS M
			ON A.memberId = M.id
			ORDER BY A.id DESC
			""")
	public List<Press> getPresses();

	@Select("""
			<script>
			SELECT A.*, M.nickname AS extra__writer, IFNULL(COUNT(R.id),0) AS extra__repliesCnt
			FROM press AS A
			INNER JOIN `member` AS M
			ON A.memberId = M.id
			LEFT JOIN `reply` AS R 
			ON A.id = R.relId
			WHERE 1
			<if test="boardId != 0">
				AND A.boardId = #{boardId}
			</if>
			<if test="searchKeyword != ''">
				<choose>
					<when test = "searchKeywordTypeCode == 'title'">
						AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test = "searchKeywordTypeCode == 'extra__writer'">
						AND M.nickname LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test="searchKeywordTypeCode == 'body'">
						AND A.`body` LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<otherwise>
						AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
						OR A.body LIKE CONCAT('%',#{searchKeyword},'%')
					</otherwise>
					</choose>
			</if>
			GROUP BY A.id
			ORDER BY A.id DESC
			<if test="limitFrom >= 0 ">
				LIMIT #{limitFrom}, #{limitTake}
			</if>

			</script>
			""")
	public List<Press> getForPrintPresses(int boardId, int limitFrom, int limitTake, String searchKeywordTypeCode,
			String searchKeyword);

	@Select("""
			<script>
			SELECT COUNT(*) AS cnt
			FROM press AS A
			INNER JOIN `member` AS M
			ON A.memberId = M.id
			WHERE 1
			<if test="boardId != 0">
				AND boardId = #{boardId}
			</if>
			<if test="searchKeyword != ''">
				<choose>
					<when test="searchKeywordTypeCode == 'title'">
						AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test = "searchKeywordTypeCode == 'extra__writer'">
						AND M.nickname LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test="searchKeywordTypeCode == 'body'">
						AND A.body LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<otherwise>
						AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
						OR A.body LIKE CONCAT('%',#{searchKeyword},'%')
					</otherwise>
				</choose>
			</if>
			ORDER BY A.id DESC
			</script>
			""")
	public int getPressesCount(Integer boardId, String searchKeywordTypeCode, String searchKeyword);

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