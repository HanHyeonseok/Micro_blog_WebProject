package dto;
/*
CREATE TABLE FAVORITE(  
		   BSEQ NUMBER(10) NOT NULL,
		   LIKECHECK NUMBER(5) DEFAULT 0 NOT NULL,
		   ID VARCHAR2(50) NOT NULL,
		   
		   CONSTRAINT FK_favorite_BSEQ FOREIGN KEY(BSEQ) REFERENCES BBS(SEQ) ON DELETE CASCADE,
		   CONSTRAINT FK_favorite_ID FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE
		);
*/


public class FavoriteDto {

	public int B_Seq;
	public int Like_Check;
	public String id;
	
	public FavoriteDto() {
	
	}

	public FavoriteDto(int like_Check) {
		super();
		Like_Check = like_Check;
	}

	public FavoriteDto(int b_Seq, int like_Check, String id) {
		super();
		B_Seq = b_Seq;
		Like_Check = like_Check;
		this.id = id;
	}

	@Override
	public String toString() {
		return "FavoriteDto [B_Seq=" + B_Seq + ", Like_Check=" + Like_Check + ", id=" + id + "]";
	}

	public int getB_Seq() {
		return B_Seq;
	}

	public void setB_Seq(int b_Seq) {
		B_Seq = b_Seq;
	}

	public int getLike_Check() {
		return Like_Check;
	}

	public void setLike_Check(int like_Check) {
		Like_Check = like_Check;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	
}
